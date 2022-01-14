import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/providers/login_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';
import 'package:rmb_admin/utils/password_validator.dart';
import 'package:rmb_admin/widgets/text_form_fields/text_field_suffix_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String route = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor.color,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 50,),
                Center(
                  child: Image.asset(
                    'assets/raiffeisen_logo.jpg',
                    height: 250,
                    width: 400,
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
                Center(
                  child: SizedBox(
                    width: 400,
                    child: TextFormField(
                      controller: context.watch<LoginProvider>().emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person, color: Colors.white,),
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        hintText: 'login.email_hint_text'.tr(),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                      ),
                      validator: (String? input) {
                        if(input == null || input.isEmpty) {
                          return 'errors.email_empty'.tr();
                        }
                        return locator.get<CredentialsValidator>().isEmailValid(email: input) ? null : 'errors.email_invalid'.tr();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    width: 400,
                    child: TextFormField(
                      controller: context.watch<LoginProvider>().passwordController,
                      style: const TextStyle(color: Colors.white),
                      obscureText: context.watch<LoginProvider>().obscurePassword,
                      decoration: InputDecoration(
                        suffixIcon: TextFieldSuffixIcon(
                          onTap: () => context.read<LoginProvider>().changeObscurity(),
                          visible: context.read<LoginProvider>().obscurePassword,
                        ),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        hintText: 'login.password_hint_text'.tr(),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                      ),
                      validator: (String? input) {
                        if(input == null || input.isEmpty) {
                          return 'errors.password_empty'.tr();
                        }
                        return locator.get<CredentialsValidator>().isPasswordValid(input) ? null : 'errors.password_invalid'.tr();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Center(
                  child: SizedBox(
                    width: 400,
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: ColorHelper.rmbYellow.color,
                          checkColor: ColorHelper.backgroundColor.color,
                          side: const BorderSide(color: Colors.white, width: 2),
                          value: context.watch<LoginProvider>().rememberMe,
                          onChanged: (bool? value) => context.read<LoginProvider>().rememberMe = value!,
                          splashRadius: 0,
                        ),

                        Text(
                          'login.remember_checkbox'.tr(),
                          style: const TextStyle(
                            color: Colors.white
                          ),
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            text: 'login.forgot_password'.tr(),
                            style: const TextStyle(color: Colors.white),
                            recognizer: TapGestureRecognizer()..onTap = () {
                            }
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorHelper.rmbYellow.color,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      fixedSize: const Size(400, 40),
                      padding: EdgeInsets.zero
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
    );
  }
}
