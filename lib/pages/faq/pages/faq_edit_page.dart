
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/faq/widgets/faq_edit_field.dart';
import 'package:rmb_admin/providers/faq_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';
class FaqEditPage extends StatelessWidget {
  const FaqEditPage({Key? key}) : super(key: key);

  static const String route = '/faq_edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor.color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'faq_edit_page.title'.tr(),
                style: TextStyle(
                  fontSize: 26,
                  color: ColorHelper.rmbYellow.color
                ),
              ),
              FaqEditField(
                controller: context.watch<FaqProvider>().questionBj,
                hintText: 'faq_edit_page.question_bj_hint'.tr(),
                labelText: 'faq_edit_page.question_bj_label'.tr(),
              ),
              FaqEditField(
                controller: context.watch<FaqProvider>().questionEn,
                hintText: 'faq_edit_page.question_en_hint'.tr(),
                labelText: 'faq_edit_page.question_en_label'.tr(),
              ),
              FaqEditField(
                controller: context.watch<FaqProvider>().answerBj,
                hintText: 'faq_edit_page.answer_bj_hint'.tr(),
                labelText: 'faq_edit_page.answer_en_label'.tr(),
              ),
              FaqEditField(
                controller: context.watch<FaqProvider>().answerEn,
                hintText: 'faq_edit_page.answer_en_hint'.tr(),
                labelText: 'faq_edit_page.answer_en_label'.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
