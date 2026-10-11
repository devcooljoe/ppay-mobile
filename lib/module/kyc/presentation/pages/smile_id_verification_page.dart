import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/kyc/presentation/providers/kyc_providers.dart';
import 'package:usesmileid/usesmileid.dart';
import 'package:usesmileid_mlkit_face/usesmileid_mlkit_face.dart';
import 'package:usesmileid_vision_face/usesmileid_vision_face.dart';

/// Helper function to get the appropriate face analyzer factory for the current platform.
/// Per SDK docs: "Each face provider package exports a FaceAnalyzerFactory;
/// register the running platform's factory per capture type."
FaceAnalyzerFactory _getFaceAnalyzerFactory() {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return const MlKitFaceAnalyzerFactory();
    case TargetPlatform.iOS:
      return const VisionFaceAnalyzerFactory();
    default:
      throw UnsupportedError(
        'Smile ID SDK supports Android and iOS only. Running on ${defaultTargetPlatform.name}.',
      );
  }
}

void _log(String message) {
  if (kDebugMode) {
    debugPrint('[SmileID] $message');
  }
}

void _logError(String message, [Object? error, StackTrace? stackTrace]) {
  debugPrint('[SmileID ERROR] $message');
  if (error != null) {
    debugPrint('[SmileID ERROR] Error: $error');
  }
  if (stackTrace != null) {
    debugPrint('[SmileID ERROR] StackTrace: $stackTrace');
  }
}

/// The Smile ID verification page.
/// 
/// Per SDK docs: "The flow is a self-contained screen stack. Three rules hold on every platform:
/// - Hand it the full screen, uninset. The SDK applies its own window insets.
/// - Prefer a full-screen destination. Persistent host chrome draws over or compresses the SDK's UI.
/// - Handle the cancelled outcome -- it is a real result on every platform."
/// 
/// And specifically for Flutter:
/// - Return the builder widget bare -- no Scaffold around it, no SafeArea, no added padding.
/// - Give the flow a full-screen route and keep it mounted until onResult fires.
/// - Handle UseSmileIDCancelled -- the result type is sealed.
@RoutePage()
class SmileIdVerificationPage extends ConsumerStatefulWidget {
  final String idType; // 'BVN' or 'NIN'
  final String idNumber;
  final String userFullName;
  final String userEmail;
  final String token;
  final String partnerId;
  final String callbackUrl;
  final bool useSandbox;
  
  /// Our backend's job ID for correlating the webhook response.
  /// This is passed to Smile ID via partnerParams and echoed back in the webhook.
  final String smileJobId;
  
  /// Our internal user ID (UUID) for correlating the webhook response.
  /// This is passed to Smile ID via partnerParams and echoed back in the webhook.
  final String smileUserId;

  const SmileIdVerificationPage({
    super.key,
    required this.idType,
    required this.idNumber,
    required this.userFullName,
    required this.userEmail,
    required this.token,
    required this.partnerId,
    required this.callbackUrl,
    required this.useSandbox,
    required this.smileJobId,
    required this.smileUserId,
  });

  @override
  ConsumerState<SmileIdVerificationPage> createState() => _SmileIdVerificationPageState();
}

class _SmileIdVerificationPageState extends ConsumerState<SmileIdVerificationPage> {
  /// The SDK widget, created once in initState and cached.
  /// Per SDK sample: built once so an identical child is not rebuilt when brightness changes.
  late final Widget _sdkWidget;
  
  /// Track if we've already handled a result to prevent double-handling
  bool _resultHandled = false;

  @override
  void initState() {
    super.initState();
    _log('initState - creating UseSmileIDBuilder ONCE');
    
    // Parse name into given names and last name
    final nameParts = widget.userFullName.trim().split(' ');
    final lastName = nameParts.length > 1 ? nameParts.last : nameParts.first;
    final givenNames = nameParts.length > 1 
        ? nameParts.sublist(0, nameParts.length - 1).join(' ') 
        : nameParts.first;
    
    _log('Creating SDK widget with:');
    _log('  givenNames=$givenNames, lastName=$lastName');
    _log('  email=${widget.userEmail}');
    _log('  idType=${widget.idType}, idNumber=${widget.idNumber}');
    _log('  partnerId=${widget.partnerId}');
    _log('  useSandbox=${widget.useSandbox}');
    _log('  smileJobId=${widget.smileJobId}');
    _log('  smileUserId=${widget.smileUserId}');
    
    // Create the SDK widget once - following the official sample pattern
    _sdkWidget = UseSmileIDBuilder(
      builder: (UseSmileIDFlowBuilder builder) {
        _log('UseSmileIDBuilder builder callback invoked');
        
        // Set user details (required per SDK docs)
        final userDetails = UserDetails(
          givenNames: givenNames,
          lastName: lastName,
          email: widget.userEmail.isNotEmpty ? widget.userEmail : null,
        );
        builder.userDetails = userDetails;
        _log('userDetails set');
        
        // Validate user details
        final userDetailsValidation = builder.validateUserDetails(userDetails);
        _log('userDetails validation: $userDetailsValidation');
        if (userDetailsValidation is ValidationStateInvalid) {
          for (final issue in userDetailsValidation.issues) {
            _logError('UserDetails validation issue: ${issue.message}');
          }
        }
        
        // Set BiometricKYCParams (required for biometricKyc job type)
        final biometricParams = BiometricKYCParams(
          idType: widget.idType,
          idNumber: widget.idNumber,
          country: 'NG',
        );
        builder.biometricKYCParams = biometricParams;
        _log('biometricKYCParams set');
        
        // Validate biometric params
        final biometricValidation = builder.validateBiometricKYCParams(biometricParams);
        _log('biometricKYCParams validation: $biometricValidation');
        if (biometricValidation is ValidationStateInvalid) {
          for (final issue in biometricValidation.issues) {
            _logError('BiometricKYCParams validation issue: ${issue.message}');
          }
        }
        
        // Configure ML analyzers - per SDK docs:
        // "Every capture type in your flow needs an analyzer. Without one,
        // the builder will reject the flow at validation."
        builder.ml((UseSmileIDMLBuilder ml) {
          ml.analyzers((AnalyzerConfigBuilder a) {
            a.forCaptureType(CaptureType.selfie, (CaptureTypeAnalyzerBuilder c) {
              c.add(_getFaceAnalyzerFactory());
            });
          });
        });
        _log('ML analyzers configured');
        
        // Configure network - per SDK docs:
        // "Set the token inside the network.config block and select
        // the sandbox or production environment with partnerConfig.useSandbox"
        builder.network((UseSmileIDNetworkBuilder network) {
          network.config((ConfigBuilder config) {
            config.jobType = JobType.biometricKyc;
            config.token = widget.token;
            
            // Token refresh callback
            config.onTokenExpired = (String previous) async {
              _log('onTokenExpired callback triggered');
              try {
                final newToken = await ref.read(smileIdTokenProvider.future);
                _log('New token fetched successfully');
                return newToken.token;
              } catch (e, stackTrace) {
                _logError('Failed to refresh token', e, stackTrace);
                // Return the previous token - SDK will handle the auth error
                return previous;
              }
            };
            
            config.partnerConfig((PartnerConfigBuilder partner) {
              partner.partnerId = widget.partnerId;
              partner.callbackUrl = widget.callbackUrl;
              partner.useSandbox = widget.useSandbox;
              
              // CRITICAL: Pass our backend's IDs via partnerParams so we can correlate
              // the webhook response. The SDK will echo these back in the webhook payload
              // under partner_params.job_id and partner_params.user_id
              partner.partnerParams = {
                'job_id': widget.smileJobId,
                'user_id': widget.smileUserId,
              };
              _log('partnerParams set: job_id=${widget.smileJobId}, user_id=${widget.smileUserId}');
            });
            
            // Debug logging (only in debug mode)
            if (kDebugMode) {
              config.logging((LoggingConfigBuilder logging) {
                logging.enabled = true;
                logging.level = LogLevel.headers;
              });
            }
          });
        });
        _log('Network configured');
        
        // Configure screens flow - per SDK docs:
        // "The SDK navigates through screens in the order you declare them."
        builder.screens((ScreensBuilder screens) {
          screens.consent((ConsentConfigBuilder consent) {
            consent.partnerName = 'Pinnacle Pay';
            consent.partnerPrivacyPolicyUrl = 'https://pinnaclepay.app/privacy';
            consent.partnerIcon = const _PartnerIcon();
          });
          
          screens.instructions();
          
          screens.capture((CaptureConfigBuilder capture) {
            capture.captureType = CaptureType.selfie;
            capture.selfie((SelfieCaptureConfigBuilder selfie) {
              selfie.enableEnhancedLiveness = true;
            });
          });
          
          screens.preview();
          
          screens.processing();
        });
        _log('Screens configured');
        
        // Set result callback
        builder.onResult = _handleResult;
        _log('onResult callback set');
        
        // Validate the entire builder configuration
        final builderValidation = builder.validate();
        _log('Full builder validation: $builderValidation');
        if (builderValidation is ValidationStateInvalid) {
          for (final issue in builderValidation.issues) {
            _logError('Builder validation issue: ${issue.message} (code: ${issue.errorCode}, fix: ${issue.suggestedFix})');
          }
        }
        
        _log('UseSmileIDBuilder configuration complete');
      },
    );
  }

  void _handleResult(UseSmileIDResult<JobSubmissionResponse> result) {
    _log('onResult callback triggered: ${result.runtimeType}');
    
    // Prevent double-handling
    if (_resultHandled) {
      _log('Result already handled, skipping');
      return;
    }
    
    if (!mounted) {
      _log('Widget not mounted in onResult, skipping');
      return;
    }
    
    _resultHandled = true;
    
    switch (result) {
      case UseSmileIDSuccess(:final value):
        _log('SUCCESS: jobId=${value.jobId}, userId=${value.userId}');
        _log('SUCCESS: status=${value.status}, message=${value.message}');
        
        // Update local user state to reflect that BVN verification has been submitted
        // This ensures the UI shows "pending" status immediately, even before the backend
        // webhook updates the status (which happens asynchronously)
        final currentUser = ref.read(authenticatedUserProvider).valueOrNull;
        if (currentUser != null) {
          // Determine which flag to set based on the idType
          if (widget.idType == 'BVN') {
            ref.read(authenticatedUserProvider.notifier).updateUser(
              currentUser.copyWith(isBvnSubmitted: true),
            );
            _log('Updated local user state: isBvnSubmitted=true');
          } else {
            // For NIN or other KYC types
            ref.read(authenticatedUserProvider.notifier).updateUser(
              currentUser.copyWith(isKycSubmitted: true),
            );
            _log('Updated local user state: isKycSubmitted=true');
          }
        }
        
        MessageHandler.showSuccessSnackBar(
          context,
          'Verification submitted successfully. Please wait while we verify your identity.',
        );
        
        // Determine next navigation based on verification type
        if (widget.idType == 'BVN') {
          // After BVN, check if KYC is already submitted
          final isKycSubmitted = currentUser?.isKycSubmitted ?? false;
          final isKycVerified = currentUser?.isKycVerified ?? false;
          
          if (!isKycSubmitted && !isKycVerified) {
            // Navigate to KYC verification (NIN) page
            _log('BVN done, navigating to KYC verification page');
            context.router.replace(const KycVerificationRoute());
          } else {
            // KYC already done, go to completion page
            _log('BVN done, KYC already submitted/verified, going to completion');
            context.router.replace(const KycVerificationCompleteRoute());
          }
        } else {
          // KYC/NIN verification done, go to completion page
          _log('KYC verification done, going to completion');
          context.router.replace(const KycVerificationCompleteRoute());
        }
        
      case UseSmileIDFailure(:final error):
        _logError('FAILURE', error);
        
        String errorMessage = 'Verification failed';
        if (error is UseSmileIDException) {
          errorMessage = error.message;
          _log('UseSmileIDException - errorCode: ${error.errorCode}, suggestedFix: ${error.suggestedFix}');
        }
        
        MessageHandler.showErrorSnackBar(context, errorMessage);
        
        // Pop back to previous screen
        if (context.router.canPop()) {
          context.router.maybePop();
        }
        
      case UseSmileIDCancelled():
        _log('CANCELLED: User cancelled the verification');
        
        // Pop back to previous screen
        if (context.router.canPop()) {
          context.router.maybePop();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    _log('build() called - returning SDK widget');
    _log('  mounted=$mounted, resultHandled=$_resultHandled');
    
    // Per SDK docs: "Return the builder widget bare -- no Scaffold around it,
    // no SafeArea, no added padding."
    // 
    // The SDK applies its own window insets and handles the full screen.
    // We wrap only with MediaQuery to pass the correct brightness to the SDK.
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        platformBrightness: Theme.of(context).brightness,
      ),
      child: _sdkWidget,
    );
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _log('didChangeDependencies() called');
  }
  
  @override
  void dispose() {
    _log('dispose() called - SDK widget being disposed!');
    _log('  resultHandled=$_resultHandled');
    super.dispose();
  }
}

/// Partner icon widget for the consent screen.
/// Per SDK docs: "Supply a square, high-resolution asset so it stays crisp on 2x/3x screens."
class _PartnerIcon extends StatelessWidget {
  const _PartnerIcon();

  @override
  Widget build(BuildContext context) {
    // Use the app's primary color for the icon
    final color = Theme.of(context).colorScheme.primary;
    return Icon(
      Icons.verified_user,
      size: 36,
      color: color,
    );
  }
}
