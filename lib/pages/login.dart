
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/pages/home/home.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/theme/color_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor.color,
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          locator.get<NavigationRepo>().navigateTo(HomePage.route);
        },
      ),
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
                style: TextStyle(
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
                  controller: emailController,
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
                  controller: passwordController,
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
                onPressed: () {
                  //LoginRepository().login(email: emailController.text, password: passwordController.text);
                },
                child: Text('login.button_title'.tr()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
