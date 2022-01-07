

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/providers/home_page_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class SidebarExpendableItem extends StatefulWidget {
  const SidebarExpendableItem({
    Key? key,
    required this.title,
    required this.icon
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  _SidebarExpendableItemState createState() => _SidebarExpendableItemState();
}

class _SidebarExpendableItemState extends State<SidebarExpendableItem> {

  bool expanded = false;

  void onTap() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(widget.icon, color: ColorHelper.dashboardIcon.color,),
                  const SizedBox(width: 10,),
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: ColorHelper.white.color
                    ),
                  ),
                  const Spacer(),
                  if (expanded)
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: ColorHelper.dashboardIcon.color,
                    )
                  else Icon(
                      Icons.arrow_drop_up_sharp,
                      color: ColorHelper.dashboardIcon.color
                  )
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 50),
                child: expanded ? Container(height: 20, width: 50, color: Colors.green,) : const SizedBox(),
              )
            ],
          )
        )
      ),
    );
  }
}
