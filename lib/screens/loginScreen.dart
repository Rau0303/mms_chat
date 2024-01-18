import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mms_chat/screens/registerScreen.dart';
import 'package:mms_chat/screens/resetPasswordScreen.dart';
import 'package:mms_chat/services/authService.dart';
import 'package:mms_chat/widgets/passwordTextField.dart';
import 'package:mms_chat/widgets/saveElevatedButton.dart';
import 'package:mms_chat/widgets/usernameTextField.dart';
import 'package:provider/provider.dart';

import '../widgets/customTextButton.dart';
import '../widgets/labelText.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var logger = Logger(
    printer: PrettyPrinter(),
  );


  void login(){
    try
    {
      String username = usernameController.text.trim();
      String password = passwordController.text.trim();

    final ap = Provider.of<AuthService>(context,listen: false);
    ap.signInWithEmailAndPassword(context, username, password);

    logger.i("аутентификация прошла успешно!");
    }
    catch(e){
      logger.e("Что-то пошло не так! $e");
    }
  }


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
                      textInputAction: TextInputAction.done),
                  SaveElevatedButton(
                      height: 50,
                      text: "Войти",
                      onPressed: login),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: CustomTextButton(
                          text: "Зарегистрироваться",
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterScreen()),
                                  (route) => false,
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 16), // Добавляем промежуток между кнопками
                      Flexible(
                        flex: 1,
                        child: CustomTextButton(
                          text: "Забыли пароль",
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                                  (route) => false,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
          ,),
      )
    );
  }
}
