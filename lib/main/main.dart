
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rmb_admin/main/config/flavor_config.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/pages/splash_page.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
void mainStart() async{
  setupLocator();


  await Future.wait([
    //Hive.initFlutter(),
    EasyLocalization.ensureInitialized(),
  ]);



  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('bs')],
      path: 'assets/translations',
      startLocale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator.get<NavigationRepo>().navigationKey,
      scaffoldMessengerKey: locator.get<NavigationRepo>().scaffoldKey,
      title: FlavorConfig.instance.flavorValues.appName,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: SplashPage.route,
    );
  }
}
