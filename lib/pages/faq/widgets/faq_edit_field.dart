import 'package:flutter/material.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class FaqEditField extends StatelessWidget {
  const FaqEditField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: TextFormField(
            maxLines: 5,
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              hintText: hintText,
              labelText: labelText,
              labelStyle: const TextStyle(
                fontSize: 18,
                color: Colors.white
              ),
              enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
            ),
          ),
        ),
      ),
    );
  }
}
