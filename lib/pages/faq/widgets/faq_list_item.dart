

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/models/faq_item.dart';
import 'package:rmb_admin/pages/faq/pages/faq_edit_page.dart';
import 'package:rmb_admin/providers/faq_provider.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class FAQListItem extends StatefulWidget {
  const FAQListItem({
    Key? key,
    required this.faqItem,
  }) : super(key: key);

  final FaqItem faqItem;

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width - 400,
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ExpansionTile(
                  backgroundColor: ColorHelper.backgroundColor.color,
                  collapsedBackgroundColor: ColorHelper.backgroundColor.color,
                  onExpansionChanged: (bool value) => onTap(),
                  title: Text(
                    widget.faqItem.questionBj,
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorHelper.rmbYellow.color
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: SelectableText(
                        widget.faqItem.answerBj,
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorHelper.rmbYellow.color
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10,),
          IconButton(
            onPressed: () {
              context.read<FaqProvider>().onFaqEdit(faqItem: widget.faqItem);
              final Map<String, String> params = {
                'id' : widget.faqItem.id!
              };
              locator.get<NavigationRepo>().navigateTo(FaqEditPage.route, params: params, arguments: context.read<FaqProvider>());
            },
            icon: Icon(Icons.edit, color: ColorHelper.dashboardIcon.color,),
            splashRadius: 20,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: ColorHelper.dangerRed.color,),
            splashRadius: 20,
          )
        ],
      ),
    );
  }
}
