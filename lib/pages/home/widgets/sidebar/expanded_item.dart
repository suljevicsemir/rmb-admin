import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class ExpandedSidebarItem extends StatelessWidget {
  const ExpandedSidebarItem({
    Key? key,
    required this.title,
    required this.icon
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Icon(icon, color: ColorHelper.dashboardIcon.color,),
              const SizedBox(width: 10,),
              Text(
                title,
                style: TextStyle(
                  color: ColorHelper.white.color
                ),
              ),
              const Spacer()

            ],
          ),
        ),
      ),
    );
  }
}
