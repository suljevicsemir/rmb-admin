

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/main/main.dart';
import 'package:url_strategy/url_strategy.dart';

void mainCommon() async {

  setupLocator();
  setPathUrlStrategy();


  runApp(
    const MyApp()
  );

}