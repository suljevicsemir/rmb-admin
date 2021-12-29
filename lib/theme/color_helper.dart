
import 'dart:ui';

import 'package:flutter/material.dart';

enum ColorHelper {
  dashboardBlue,
  dashboardIcon,

  white
}

extension ColorHelperExtensions on ColorHelper {
  Color get color {
    switch(this) {
      case ColorHelper.dashboardBlue:
        return const Color(0xff434e68);
      case ColorHelper.dashboardIcon:
        return const Color(0xffa3a6b3);
      default:
        return Colors.white;
    }
  }
}