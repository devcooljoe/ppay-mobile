import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.dart';
import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/providers/inactivity_provider.dart';
import 'package:ppay_mobile/core/services/app_update_service.dart';
import 'package:ppay_mobile/core/services/firebase_messaging_service.dart';
import 'package:ppay_mobile/core/services/token_service.dart';
import 'package:ppay_mobile/core/widgets/activity_tracker.dart';
import 'package:ppay_mobile/core/widgets/inactivity_handler.dart';
import 'package:ppay_mobile/core/widgets/navigation_handler.dart';
import 'package:ppay_mobile/firebase_options.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:upgrader/upgrader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await getIt<TokenService>().loadToken();

  final messagingService = getIt<FirebaseMessagingService>();
  await messagingService.initialize();

  if (Platform.isAndroid) {
    final updateService = getIt<AppUpdateService>();
    await updateService.checkForUpdate();
  }

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inactivityNotifier = ref.read(inactivityNotifierProvider.notifier);

    useEffect(() {
      inactivityNotifier.startTimer();
      return () => inactivityNotifier.stopTimer();
    }, []);

    return ScreenUtilInit(
      builder: (context, child) {
        return SafeArea(
          right: false,
          left: false,
          top: false,
          bottom: Platform.isAndroid,
          child: Platform.isIOS
              ? UpgradeAlert(
                  upgrader: Upgrader(
                    durationUntilAlertAgain: const Duration(days: 1),
                  ),
                  child: _buildMaterialApp(),
                )
              : _buildMaterialApp(),
        );
      },
      designSize: const Size(440, 920),
      minTextAdapt: true,
    );
  }

  Widget _buildMaterialApp() {
    return MaterialApp.router(
      title: 'Pinnacle Pay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(primary: PPaymobileColors.buttonColor),
      ),
      routerConfig: _appRouter.config(),
      builder: (context, child) {
        return InactivityHandler(
          router: _appRouter,
          child: ActivityTracker(
            child: NavigationHandler(router: _appRouter, child: child!),
          ),
        );
      },
    );
  }
}
