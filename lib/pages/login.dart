import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/pages/login/widgets/login_email_field.dart';
import 'package:rmb_admin/pages/login/widgets/login_password_field.dart';
import 'package:rmb_admin/providers/login_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';


class LoginPage extends StatelessWidget {

  LoginPage({Key? key}) : super(key: key);

  static const String route = '/login';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor.color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 155,
                    child: Column(
                       mainAxisSize: MainAxisSize.max,
                       children: [
                         Center(
                           child: Image.asset(
                             'assets/raiffeisen_logo.jpg',
                             height: 150,
                           ),
                         ),
                         const SizedBox(height: 20,),
                         Center(
                           child: Text(
                             "login.login_headline".tr(),
                             style: const TextStyle(
                               color: Colors.white,
                               fontSize: 30,
                             ),
                           ),
                         ),
                         const SizedBox(height: 20,),
                         const LoginEmailField(),
                         const SizedBox(height: 20,),
                         const LoginPasswordField(),
                         const SizedBox(height: 10,),
                         Row(
                           children: [
                             const Spacer(),
                             RichText(
                               text: TextSpan(
                                 text: 'login.forgot_password'.tr(),
                                 style: const TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                                 recognizer: TapGestureRecognizer()..onTap = () {
                                 }
                                ),
                              )
                           ],
                         ),
                       ],
                     ),
                  ),
                  Container(
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
