
import 'package:easy_localization/easy_localization.dart';
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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SizedBox(
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
                        padding: const EdgeInsets.only(bottom: 10, left: 15),
                        child: Text(
                          widget.faqItem.answerBj,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorHelper.rmbYellow.color
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<FaqProvider>().selectFaq(faqItem: widget.faqItem);
                              locator.get<NavigationRepo>().navigateTo(FaqEditPage.route, arguments: context.read<FaqProvider>());
                            },
                            icon: Icon(Icons.edit, color: ColorHelper.dashboardIcon.color,),
                            splashRadius: 20,
                          ),
                          IconButton(
                            onPressed: () => onDelete(context, context.read<FaqProvider>(), widget.faqItem),
                            icon: Icon(Icons.delete, color: ColorHelper.dangerRed.color,),

                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// dialog is shown with a different context than the widget above it
// so we need to pass the provider as well
void onDelete(BuildContext context, FaqProvider provider, FaqItem faqItem) {
  provider.selectFaq(faqItem: faqItem);
  showDialog(context: context, builder: (_) {
    return AlertDialog(
      title: Text('faq_edit_page.dialog_title'.tr()),
      content: Text("faq_edit_page.dialog_message".tr()),
      actions: [
        TextButton(
          onPressed: () async{
            final String? error = await provider.deleteFaqItem();
            Navigator.of(context).pop();
          },
          child: Text('faq_edit_page.dialog_yes'.tr())
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('faq_edit_page.dialog_no'.tr())
        )
      ],
    );
  });
}



