


import 'package:flutter/material.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class TextFieldSuffixIcon extends StatelessWidget {
  const TextFieldSuffixIcon({
    Key? key,
    required this.onTap,
    required this.visible
  }) : super(key: key);

  final bool visible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: !visible ?  Icon(Icons.visibility, color: ColorHelper.rmbYellow.color, ) :  Icon(Icons.visibility_off, color: ColorHelper.rmbYellow.color,),
        ),
      ),
    );
  }
}
