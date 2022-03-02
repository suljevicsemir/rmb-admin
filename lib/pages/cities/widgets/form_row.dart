

import 'package:flutter/material.dart';
import 'package:rmb_admin/widgets/text_form_fields/app_form_field.dart';

import '../../../theme/color_helper.dart';

class CitiesFormRow extends StatelessWidget {
  const CitiesFormRow({
    Key? key,
    required this.textFormField,
    required this.label,
    required this.icons
  }) : super(key: key);

  final String label;
  final AppTextFormField textFormField;
  final Widget icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: TextStyle(
                color: ColorHelper.rmbYellow.color,
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              child: textFormField
            ),
          ),
          icons
        ],
      ),
    );
  }
}
