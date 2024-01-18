import 'package:flutter/material.dart';

import '../widgets/customTextButton.dart';
import '../widgets/labelText.dart';
import '../widgets/passwordTextField.dart';
import '../widgets/saveElevatedButton.dart';
import '../widgets/usernameTextField.dart';
import 'loginScreen.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height * 0.5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.0),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),

                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]

            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const LabelText(text: "Войти"),
                  UsernameTextField(
                      usernameController: usernameController,
                      hint: 'username'),
                  PasswordTextField(
                      passwordController: passwordController,
                      hint:'password',
                      textInputAction: TextInputAction.next),
                  PasswordTextField(
                      passwordController: rePasswordController,
                      hint: 'password',
                      textInputAction: TextInputAction.done),
                  SaveElevatedButton(
                      height: 50,
                      text: "Войти",
                      onPressed: (){}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("уже есть аккаунт? "),
                      CustomTextButton(
                        text: "Войти",
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        ),
      ),
    );
  }
}
