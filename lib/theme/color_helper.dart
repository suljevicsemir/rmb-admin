
import 'dart:ui';

import 'package:flutter/material.dart';

enum ColorHelper {
  dashboardBlue,
  dashboardIcon,
  backgroundColor,
  dangerRed,
  rmbYellow,
  white
}

extension ColorHelperExtensions on ColorHelper {
  Color get color {
    switch(this) {
      case ColorHelper.rmbYellow:
        return const Color(0xfff7cf29);
      case ColorHelper.dangerRed:
        return const Color.fromRGBO(255, 14, 14, 1);
      case ColorHelper.backgroundColor:
        return const Color(0xff23272a);
      case ColorHelper.dashboardBlue:
        return const Color(0xff434e68);
      case ColorHelper.dashboardIcon:
        return const Color(0xffa3a6b3);
      default:
        return Colors.white;
    }
  }
}