import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/onboarding/splash_page.dart';
import 'package:ppay_mobile/firebase_options.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Pinnacle Pay',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.light(primary: PPaymobileColors.buttonColor),
        ),
        home: SplashPage(),
      ),
      designSize: const Size(440, 920),
      minTextAdapt: true,
    );
  }
}
