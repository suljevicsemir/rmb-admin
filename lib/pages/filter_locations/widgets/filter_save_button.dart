import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class FilterSaveButton extends StatelessWidget {
  const FilterSaveButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ColorHelper.rmbYellow.color,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25)
      ),
      onPressed: onPressed,
      child: Text(
        'filter_locations_page.save_filter'.tr(),
        style: TextStyle(
          color: ColorHelper.backgroundColor.color,
          fontSize: 18,

        ),
      ),
    );
  }
}
