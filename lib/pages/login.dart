import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rmb_admin/providers/login_provider.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String route = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor.color,
      body: Container(
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
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    fillColor: Colors.grey.withOpacity(0.3),
                    filled: true,
                    hintText: 'login.password_hint_text'.tr(),
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorHelper.rmbYellow.color))
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 400,
                child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? value) {}, splashRadius: 0,),
                    const SizedBox(width: 10,),
                    Text('login.remember_checkbox'.tr()),
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  fixedSize: const Size(400, 40),
                  padding: EdgeInsets.zero
                ),
                onPressed: () => context.read<LoginProvider>().login(),
                child: Text('login.button_title'.tr()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
