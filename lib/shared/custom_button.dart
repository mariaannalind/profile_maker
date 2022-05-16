import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressFunction, this.buttonText = ''}) : super(key: key);

  final VoidCallback onPressFunction;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
        onPressed: () => onPressFunction(),
        child: Text(buttonText)
    );
  }
}
