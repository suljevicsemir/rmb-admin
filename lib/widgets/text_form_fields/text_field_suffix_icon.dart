

import 'package:flutter/material.dart';

class TextFieldSuffixIcon extends StatelessWidget {
  const TextFieldSuffixIcon({
    Key? key,
    required this.onTap,
    required this.visible,
    required this.primaryIcon,
    this.secondaryIcon
  }) : super(key: key);

  final bool visible;
  final VoidCallback onTap;
  final Icon primaryIcon;
  final Icon? secondaryIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: !visible ? primaryIcon : (secondaryIcon == null) ? null : secondaryIcon
      ),
    );
  }
}
