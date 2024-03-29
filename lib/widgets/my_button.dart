import 'package:flutter/material.dart';
import 'package:iot_test_project/utils/config.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final double? width;
  final double? fontSize;

  const MyButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color = Config.COLOR_RED,
    this.width = 0.8,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * width!, 50),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(text,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
          textAlign: TextAlign.center),
    );
  }
}
