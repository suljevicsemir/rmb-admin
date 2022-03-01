import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    required this.controller,
    this.enabledBorder = const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    this.focusedBorder = const OutlineInputBorder(borderSide: BorderSide(color: Color(0xfff7cf29))),
    this.filled,
    this.fillColor,
    this.hintStyle,
    this.hintText,
    this.style = const TextStyle(color: Colors.white),
    this.prefixIcon,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged
  }) : super(key: key);

  final TextEditingController controller;
  final Icon? prefixIcon;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final bool? filled;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String? hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: style,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: hintStyle ?? TextStyle(color: Colors.white.withOpacity(0.5)),
        fillColor: fillColor ?? Colors.grey.withOpacity(0.3),
        filled: filled,
        hintText: hintText,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
      ),
      validator: validator,
    );
  }
}
