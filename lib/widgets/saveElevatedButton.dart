import "package:flutter/material.dart";
class SaveElevatedButton extends StatelessWidget {
  const SaveElevatedButton({
    required this.height,
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final double height;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }
}