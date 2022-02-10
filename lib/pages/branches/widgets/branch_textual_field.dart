import 'package:flutter/material.dart';
import 'package:rmb_admin/theme/color_helper.dart';


class BranchTextualField extends StatelessWidget {
  const BranchTextualField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final String hintText;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white
              ),
            ),
          ),
          SizedBox(
            width: 400,
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  fillColor: Colors.grey.withOpacity(0.3),
                  filled: true,
                  hintText: hintText,
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
              ),
            ),
          )
        ],
      ),
    );
  }
}