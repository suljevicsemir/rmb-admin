

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String route = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorHelper.backgroundColor.color,
        child: Container(
          color: ColorHelper.backgroundColor.color,
          child: SpinKitCircle(
            size: 80.0,
            color: ColorHelper.rmbYellow.color,
          ),
        ),
      ),
    );
  }
}


