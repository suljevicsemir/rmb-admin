


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff23272a),
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
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.white
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "faq_page.can't_find".tr(),
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: "faq_page.help_center".tr(),
                                style: TextStyle(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
