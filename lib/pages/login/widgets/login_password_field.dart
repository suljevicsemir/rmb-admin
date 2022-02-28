
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/providers/login_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';
import 'package:rmb_admin/utils/password_validator.dart';
import 'package:rmb_admin/widgets/text_form_fields/app_form_field.dart';
import 'package:rmb_admin/widgets/text_form_fields/text_field_suffix_icon.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: context.watch<LoginProvider>().passwordController,
      suffixIcon: TextFieldSuffixIcon(
        onTap: () => context.read<LoginProvider>().changeObscurity(),
        visible: context.read<LoginProvider>().obscurePassword,
        primaryIcon: Icon(Icons.visibility, color: ColorHelper.rmbYellow.color,),
        secondaryIcon: Icon(Icons.visibility_off, color: ColorHelper.rmbYellow.color,),
      ),
      prefixIcon: const Icon(Icons.lock, color: Colors.white),
      filled: true,
      hintText: 'login.password_hint_text'.tr(),
      validator: (String? input) {
        if(input == null || input.isEmpty) {
          return 'errors.password_empty'.tr();
        }
        return locator.get<CredentialsValidator>().isPasswordValid(input) ? null : 'errors.password_invalid'.tr();
      },
      obscureText: context.watch<LoginProvider>().obscurePassword,
    );
  }
}
