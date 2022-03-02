import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/providers/login_provider.dart';
import 'package:rmb_admin/utils/password_validator.dart';
import 'package:rmb_admin/widgets/text_form_fields/app_form_field.dart';


class LoginEmailField extends StatelessWidget {
  const LoginEmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: context.watch<LoginProvider>().emailController,
      prefixIcon: const Icon(Icons.person, color: Colors.white,),
      filled: true,
      hintText: 'login.email_hint_text'.tr(),
      validator: (String? input) {
        if(input == null || input.isEmpty) {
          return 'errors.email_empty'.tr();
        }
        return locator.get<CredentialsValidator>().isEmailValid(email: input) ? null : 'errors.email_invalid'.tr();
      },
    );
  }
}
