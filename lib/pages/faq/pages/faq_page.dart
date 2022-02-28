



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
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.black,
        title: const Text(
          "FAQ",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child:  context.watch<FaqProvider>().faqItems.isEmpty ? const Center(child: CircularProgressIndicator(),) :
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: context.watch<FaqProvider>().faqItems.length,
              itemBuilder: (ctx, index) => FAQListItem(faqItem: context.read<FaqProvider>().faqItems[index],)
            ),
        ),
      ),
    );
  }
}
