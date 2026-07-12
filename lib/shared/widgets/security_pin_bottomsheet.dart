import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/services/biometric_service.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

/// Shows the security pin bottomsheet and returns [true] if verified
/// (by PIN or biometric), [false] otherwise.
Future<bool> showSecurityPinBottomsheet(BuildContext context) async {
  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    enableDrag: false,
    builder: (_) => const _SecurityPinBottomsheet(),
  );
  return result ?? false;
}

class _SecurityPinBottomsheet extends HookConsumerWidget {
  const _SecurityPinBottomsheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayController = useTextEditingController();
    final realPin = useState('');
    final isVerifying = useState(false);
    final hasError = useState(false);

    final biometricEnabled = useState(false);
    final biometricTypes = useState<List<BiometricType>>([]);

    // Load biometric state on init
    useEffect(() {
      Future(() async {
        final service = getIt<BiometricService>();
        final enabled = await service.isBiometricEnabled();
        final available = await service.isBiometricAvailable();
        if (enabled && available) {
          biometricEnabled.value = true;
          biometricTypes.value = await service.getAvailableBiometrics();
        }
      });
      return null;
    }, []);

    final emptyPinTheme = PinTheme(
      width: 11.w,
      height: 11.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.5),
        color: Colors.transparent,
      ),
    );

    final filledPinTheme = PinTheme(
      width: 11.w,
      height: 11.w,
      textStyle: const TextStyle(color: Colors.transparent),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: PPaymobileColors.buttonColor,
      ),
    );

    Future<void> verifyWithPin(String pin) async {
      isVerifying.value = true;
      hasError.value = false;
      final success = await ref.read(verifyPinProvider.notifier).call(pin: pin);
      isVerifying.value = false;
      if (success) {
        if (context.mounted) Navigator.pop(context, true);
      } else {
        hasError.value = true;
        realPin.value = '';
        displayController.text = '';
      }
    }

    Future<void> verifyWithBiometric() async {
      final service = getIt<BiometricService>();
      final types = biometricTypes.value;
      final reason = types.contains(BiometricType.face)
          ? 'Authenticate with Face ID to confirm transaction'
          : 'Authenticate with fingerprint to confirm transaction';
      final success = await service.authenticate(reason: reason);
      if (success) {
        if (context.mounted) Navigator.pop(context, true);
      } else {
        if (context.mounted) {
          MessageHandler.showErrorSnackBar(context, 'Biometric authentication failed');
        }
      }
    }

    void onKeyTap(String value) {
      if (isVerifying.value) return;
      if (realPin.value.length >= 4) return;
      hasError.value = false;
      realPin.value += value;
      displayController.text = realPin.value;
      if (realPin.value.length == 4) {
        verifyWithPin(realPin.value);
      }
    }

    void onDelete() {
      if (isVerifying.value) return;
      if (realPin.value.isEmpty) return;
      hasError.value = false;
      realPin.value = realPin.value.substring(0, realPin.value.length - 1);
      displayController.text = realPin.value;
    }

    final showBiometric = biometricEnabled.value;
    final types = biometricTypes.value;
    final isFaceId = types.contains(BiometricType.face);
    final biometricAsset = isFaceId
        ? 'assets/images/face_capture.png'
        : 'assets/images/fingerprint_1.png';

    return FractionallySizedBox(
      heightFactor: 0.74,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TouchOpacity(
            onTap: () => Navigator.pop(context, false),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: Center(
                child: SizedBox(
                  height: 18.h,
                  width: 18.h,
                  child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown),
                ),
              ),
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Security Pin',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Enter your security pin to complete transaction',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                  20.verticalSpace,
                  // PIN dots or loading indicator
                  if (isVerifying.value)
                    SizedBox(
                      height: 20.w,
                      width: 20.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          PPaymobileColors.buttonColor,
                        ),
                      ),
                    )
                  else
                    Pinput(
                      controller: displayController,
                      length: 4,
                      readOnly: true,
                      showCursor: false,
                      defaultPinTheme: emptyPinTheme,
                      focusedPinTheme: emptyPinTheme,
                      submittedPinTheme: filledPinTheme,
                      separatorBuilder: (_) => 40.horizontalSpace,
                    ),
                  14.verticalSpace,
                  if (hasError.value)
                    Text(
                      'Incorrect transaction pin. Try again',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: PPaymobileColors.redTextfield,
                      ),
                    )
                  else
                    SizedBox(height: 19.h),
                  14.verticalSpace,
                  _PinKeyboard(
                    onKeyTap: onKeyTap,
                    onDelete: onDelete,
                    showBiometric: showBiometric,
                    biometricAsset: biometricAsset,
                    onBiometricTap: verifyWithBiometric,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PinKeyboard extends StatelessWidget {
  final Function(String) onKeyTap;
  final VoidCallback onDelete;
  final bool showBiometric;
  final String biometricAsset;
  final VoidCallback onBiometricTap;

  const _PinKeyboard({
    required this.onKeyTap,
    required this.onDelete,
    required this.showBiometric,
    required this.biometricAsset,
    required this.onBiometricTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget numKey(String value) {
      return TouchOpacity(
        onTap: () => onKeyTap(value),
        child: Container(
          width: 82.w,
          height: 68.h,
          alignment: Alignment.center,
          child: Text(
            value,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    Widget deleteKey() {
      return TouchOpacity(
        onTap: onDelete,
        child: SizedBox(
          height: 22.h,
          width: 28.w,
          child: SvgPicture.asset('assets/icon/delete.svg', fit: BoxFit.scaleDown),
        ),
      );
    }

    Widget biometricKey() {
      return TouchOpacity(
        onTap: onBiometricTap,
        child: SizedBox(
          height: 46.h,
          width: 44.w,
          child: Image.asset(biometricAsset, fit: BoxFit.contain),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      mainAxisSpacing: 24.h,
      crossAxisSpacing: 48.w,
      children: [
        numKey('1'), numKey('2'), numKey('3'),
        numKey('4'), numKey('5'), numKey('6'),
        numKey('7'), numKey('8'), numKey('9'),
        if (showBiometric) biometricKey() else const SizedBox.shrink(),
        numKey('0'),
        deleteKey(),
      ],
    );
  }
}
