import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/providers/login_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: ColorHelper.rmbYellow.color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            padding: EdgeInsets.zero,
            fixedSize: const Size(double.maxFinite, 45,)
        ),
        onPressed: () => context.read<LoginProvider>().login(key: formKey),
        child: Text(
          'login.button_title'.tr(),
          style: TextStyle(
              color: ColorHelper.backgroundColor.color,
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
