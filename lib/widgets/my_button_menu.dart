import 'package:flutter/material.dart';
import 'package:iot_test_project/utils/config.dart';

class MyButtonMenu extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final double? width;
  final double? fontSize;

  const MyButtonMenu({
    super.key,
    required this.text,
    this.onPressed,
    this.color = Config.COLOR_RED,
    this.width = 0.2,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * width!,
            MediaQuery.of(context).size.width * 0.18),
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
