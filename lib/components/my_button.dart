//import

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      //bigger button, bolder text
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }
}