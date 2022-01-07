

import 'package:flutter/widgets.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: ColorHelper.dashboardIcon.color
        ),
      ),
    );
  }
}
