

import 'package:flutter/material.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class SidebarExpendableItem extends StatefulWidget {
  const SidebarExpendableItem({
    Key? key,
    required this.title,
    required this.icon,
    this.children,
    this.hasArrow = true,
    this.onTap
  }) : super(key: key);

  final String title;
  final IconData icon;
  final List<Widget>? children;
  final bool hasArrow;
  final VoidCallback? onTap;

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

        onTap: () {
          onTap();
        },
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
                 _ArrowWidget(hasArrow: widget.hasArrow, expanded: expanded)
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 150),
                child: expanded ? Column(
                  children: widget.children?? [],
                ): const SizedBox(),
              )
            ],
          )
        )
      ),
    );
  }
}

class _ArrowWidget extends StatelessWidget {
  const _ArrowWidget({
    Key? key,
    required this.hasArrow,
    required this.expanded
  }) : super(key: key);

  final bool hasArrow;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    if(!hasArrow) {
      return const SizedBox();
    }
    return expanded ?
    Icon(
      Icons.arrow_drop_down_sharp,
      color: ColorHelper.dashboardIcon.color,
    ) :
    Icon(
      Icons.arrow_drop_up_sharp,
      color: ColorHelper.dashboardIcon.color
    );
  }
}

