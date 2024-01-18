import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mms_chat/services/authService.dart';
import 'package:mms_chat/services/customSnackBar.dart';
import 'package:provider/provider.dart';

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

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  void register(){
    try{
      String username = usernameController.text.trim();
      String password = passwordController.text.trim();
      String rePassword = rePasswordController.text.trim();
      final ap = Provider.of<AuthService>(context,listen: false);

      if(password == rePassword){
        ap.createUserWithEmailAndPassword(context, username, password);
        logger.i("пользователь успешно создан username=> $username password=> $password ");
      }
      else{
        logger.e("пароли не совпадают!");
        CustomSnackBar.showSnackBar(context, "пароли не совпадают!", true);
      }
    }
    catch(e)
    {
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
                      textInputAction: TextInputAction.next),
                  PasswordTextField(
                      passwordController: rePasswordController,
                      hint: 'password',
                      textInputAction: TextInputAction.done),
                  SaveElevatedButton(
                      height: 50,
                      text: "Зарегистрироваться",
                      onPressed: register),
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
