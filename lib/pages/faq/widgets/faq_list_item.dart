


import 'package:flutter/material.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class FAQListItem extends StatefulWidget {
  const FAQListItem({
    Key? key,
    required this.id,
    required this.answer,
    required this.question
  }) : super(key: key);

  final String id;
  final String question;
  final String answer;

  @override
  _FAQListItemState createState() => _FAQListItemState();
}

class _FAQListItemState extends State<FAQListItem> {

  bool tapped = false;

  void onTap() {
    setState(() {
      tapped = !tapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 500,
            child: ExpansionTile(
              backgroundColor: ColorHelper.backgroundColor.color,
              collapsedBackgroundColor: ColorHelper.backgroundColor.color,
              onExpansionChanged: (bool value) => onTap(),
              title: Text(
                widget.question,
                style: TextStyle(
                  fontSize: 26,
                  color: ColorHelper.rmbYellow.color
                ),
              ),
              children: [
                Text(
                  widget.answer,
                  style: TextStyle(
                    fontSize: 22,
                    color: ColorHelper.rmbYellow.color
                  ),
                )
              ],
            ),
          ),

        ),
        const SizedBox(width: 10,),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit, color: ColorHelper.dashboardIcon.color,),
          splashRadius: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete, color: ColorHelper.dangerRed.color,),
          splashRadius: 20,
        )
      ],
    );
  }
}
