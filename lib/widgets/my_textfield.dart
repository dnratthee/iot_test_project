import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? isHidden;
  final Widget? suffixIcon;

  const MyTextField({
    super.key,
    this.controller,
    required this.label,
    this.hint,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.isHidden = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 156, 26, 37),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 156, 26, 37),
              ),
            ),
            hintText: hint ?? label,
            labelText: label,
            border: const OutlineInputBorder(),
            suffixIcon: suffixIcon),
        obscureText: isHidden ?? false,
        keyboardType: inputType,
        textInputAction: inputAction);
  }
}
