


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/faq/widgets/faq_list_item.dart';
import 'package:rmb_admin/providers/faq_provider.dart';

class FaqPage extends StatelessWidget {

  const FaqPage({Key? key}) : super(key: key);

  static const String route = '/faq';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 100),
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
                if (context.watch<FaqProvider>().faqItems.isEmpty) const CircularProgressIndicator() else
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: context.read<FaqProvider>().faqItems.length,
                    itemBuilder: (ctx, index) => FAQListItem(
                      faqItem: context.read<FaqProvider>().faqItems[index],
                    )
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
