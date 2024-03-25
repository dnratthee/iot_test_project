import 'package:flutter/material.dart';
import 'package:iot_test_project/utils/config.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
        backgroundColor: Config.COLOR_RED,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child:
          Text(text, style: const TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
