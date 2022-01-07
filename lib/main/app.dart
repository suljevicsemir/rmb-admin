

import 'package:flutter/material.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: locator.get<NavigationRepo>().scaffoldKey,
      navigatorKey: locator.get<NavigationRepo>().navigationKey,
      initialRoute: ''
    );
  }
}
