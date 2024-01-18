import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mms_chat/screens/loginScreen.dart';
import 'package:mms_chat/services/authService.dart';
import 'package:mms_chat/services/customSnackBar.dart';
import 'package:provider/provider.dart';

import '../widgets/labelText.dart';
import '../widgets/saveElevatedButton.dart';
import '../widgets/usernameTextField.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    var logger = Logger(
      printer: PrettyPrinter(),
    );

    void resetPassword(){
      try{
        String username = usernameController.text.trim();
        final ap = Provider.of<AuthService>(context,listen: false);
        ap.resetPassword(username, context);

        logger.i("Сообщение успешно было отправлено! $username");
        CustomSnackBar.showSnackBar(context, "Сообщение успешно было отправлено!", false);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LoginScreen()), (route) => false);
      }
      catch(e){
        logger.e("Что-то пошло не так! $e");
      }

    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.02),

                const LabelText(text: "Сбросить пароль"),

                SizedBox(height: screenHeight * 0.02),

                UsernameTextField(
                  usernameController: usernameController,
                  hint: "username",
                ),

                SizedBox(height: screenHeight * 0.02),

                SaveElevatedButton(
                  height: screenHeight * 0.07,
                  text: 'Сбросить пароль',
                  onPressed: (){},
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
