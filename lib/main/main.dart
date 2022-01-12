
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rmb_admin/main/config/flavor_config.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/pages/home/home.dart';
import 'package:rmb_admin/pages/login.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/repositories/secure_storage_repo.dart';
void mainStart() async{
  setupLocator();


  await Future.wait([
    Hive.initFlutter(),
    EasyLocalization.ensureInitialized(),
    locator.get<SecureStorageRepo>().websiteStart()
  ]);

  bool isLoggedIn = locator.get<SecureStorageRepo>().isLoggedIn;
  if(isLoggedIn) {
    locator.get<NavigationRepo>().setInitialRoute(initialRoute: HomePage.route);
  }
  else {
    locator.get<NavigationRepo>().setInitialRoute(initialRoute: LoginPage.route);
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('bs')],
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
    return MaterialApp.router(
      routeInformationParser: locator<NavigationRepo>().router.routeInformationParser,
      routerDelegate: locator.get<NavigationRepo>().router.routerDelegate,
      scaffoldMessengerKey: locator.get<NavigationRepo>().scaffoldKey,
      title: FlavorConfig.instance.flavorValues.appName,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
