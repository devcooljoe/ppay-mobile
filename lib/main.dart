import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/app/router/app_router.dart';
import 'package:ppay_mobile/firebase_options.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        title: 'Pinnacle Pay',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.light(primary: PPaymobileColors.buttonColor),
        ),
        routerConfig: _appRouter.config(),
      ),
      designSize: const Size(440, 920),
      minTextAdapt: true,
    );
  }
}
