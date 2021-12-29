
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rmb_admin/repositories/login_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.withOpacity(0.3),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{


        },
      ),
      body: Container(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.grey,),
                      fillColor: Colors.grey.withOpacity(0.3),
                      filled: true,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow)
                      )


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
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)
                        )
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
                      const Text('Remember me'),
                      const Spacer(),
                      Text('Forgot password?')
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
                    LoginRepository().login(email: emailController.text, password: passwordController.text);
                  },
                  child: Text('Login'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
