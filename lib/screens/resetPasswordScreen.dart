import 'package:flutter/material.dart';

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
