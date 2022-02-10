
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/providers/branches_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class ATMPosition extends StatelessWidget {
  const ATMPosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BranchesProvider branchesProvider = context.watch<BranchesProvider>();
    return Row(
      children: [
        Text(
          "branches_page.atm_type".tr(),
          style: const TextStyle(
            color: Colors.white
          ),
        ),
        const SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Radio(
                  value: branchesProvider.atmValidator.inside,
                  groupValue: branchesProvider.atmValidator.groupedValue,
                  onChanged: (bool? value) => branchesProvider.setATMInside(),
                  fillColor: MaterialStateProperty.all(ColorHelper.rmbYellow.color),
                ),
                const SizedBox(width: 5,),
                Text(
                  "branches_page.atm_inside".tr(),
                  style: TextStyle(color: ColorHelper.white.color),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: branchesProvider.atmValidator.outside,
                  groupValue: branchesProvider.atmValidator.groupedValue,
                  onChanged: (bool? value) => branchesProvider.setATMOutside(),
                  fillColor: MaterialStateProperty.all(ColorHelper.rmbYellow.color),
                ),
                const SizedBox(width: 5),
                Text(
                  "branches_page.atm_outside".tr(),
                  style: TextStyle(color: ColorHelper.white.color),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
