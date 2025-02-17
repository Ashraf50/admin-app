import 'package:admin_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    super.key,
    required this.appRouter,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          builder: FlutterSmartDialog.init(),
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          routerConfig: appRouter.router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
