



import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/pages/faq/pages/faq_edit_page.dart';
import 'package:rmb_admin/pages/faq/widgets/faq_list_item.dart';
import 'package:rmb_admin/providers/faq_provider.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class FaqPage extends StatefulWidget {

  const FaqPage({Key? key}) : super(key: key);

  static const String route = '/faq';

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {

  bool isVisible = false;

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
      if(!isVisible) {
        locator.get<NavigationRepo>().showActionSuccessSnackBar('Bravooooooo');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeVisible();
        },
      ),
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(150, 100, 150, 0),
            child: Stack(
              children: <Widget>[
                Column(
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
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: context.watch<FaqProvider>().faqItems.length,
                          itemBuilder: (ctx, index) => FAQListItem(faqItem: context.read<FaqProvider>().faqItems[index],)
                      ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<FaqProvider>().onFaqCreate();
                        locator.get<NavigationRepo>().navigateTo(FaqEditPage.route, params: {
                          'id' : 'create'
                        }, arguments: context.read<FaqProvider>());
                      },
                      child: Text('ADD'),
                    )

                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: FlyingIndicator(isVisible: isVisible),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}




class FlyingIndicator extends StatelessWidget {

  const FlyingIndicator({
    Key? key,
    required this.isVisible
  }): super(key: key);

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 150),
      padding: isVisible ? const EdgeInsets.only(bottom: 50) : const EdgeInsets.only(bottom: 0),
      child: isVisible ? SpinKitCircle(
        color: ColorHelper.rmbYellow.color,
        size: 80,
      ): const SizedBox()
    );
  }
}

