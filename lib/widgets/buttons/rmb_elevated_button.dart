

import 'package:flutter/material.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class RMBElevatedButton extends StatelessWidget {
  const RMBElevatedButton({
    Key? key,
    required this.onPressed,
    required this.widget
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ColorHelper.rmbYellow.color,
      ),
      onPressed: onPressed,
      child: widget,
    );
  }
}


class RMBElevatedTextButton extends StatelessWidget {
  const RMBElevatedTextButton({
    Key? key,
    required this.onPressed,
    required this.text
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ColorHelper.rmbYellow.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20)
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: ColorHelper.backgroundColor.color,
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

