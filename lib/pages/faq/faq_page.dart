


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rmb_admin/pages/faq/widgets/faq_list_item.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {

  bool tapped = false;

  void onTap() {
    setState(() {
      tapped = !tapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 100),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'assets/raiffeisen_logo.jpg',
                      width: 350,
                      height: 250,
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "faq_page.asked_questions".tr(),
                          style: const TextStyle(
                            fontSize: 45,
                            color: Colors.white
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "faq_page.can't_find".tr(),
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "faq_page.help_center".tr(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () {

                                }
                              )
                            ]
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 100),
                FAQListItem(
                  id: '',
                  answer: "Semir je razuvceni konj",
                  question: "Semir je konj ?",
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 500,
                        child: ExpansionTile(
                          backgroundColor: Colors.yellow,
                          collapsedIconColor: ListTileTheme.of(context).iconColor,
                          //iconColor: ListTileTheme.of(context).iconColor,
                          collapsedBackgroundColor: Colors.yellow,
                          onExpansionChanged: (bool value) => onTap(),
                          collapsedTextColor: Colors.red,
                          textColor: Colors.red,
                          title: Text("Semir je konj" ,),
                          children: [
                            Text("Semir je razvuceni konj", style: TextStyle(
                                color: Colors.red
                            ),),

                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit,),
                      splashRadius: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                      splashRadius: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
