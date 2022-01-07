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
          padding: const EdgeInsets.fromLTRB(16, 16, 6, 0),
          child: Row(
            children: <Widget>[
              Icon(icon, color: ColorHelper.dashboardIcon.color,),
              const SizedBox(width: 10,),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: ColorHelper.white.color
                  ),
                ),
              ),
              Icon(Icons.arrow_forward, color: ColorHelper.dashboardIcon.color, size: 16,)
            ],
          ),
        ),
      ),
    );
  }
}
