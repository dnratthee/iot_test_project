import 'package:flutter/material.dart';

class MyLoading extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const MyLoading({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      if (isLoading)
        const Opacity(
          opacity: 0.8,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
      if (isLoading)
        const Center(
          child: CircularProgressIndicator(),
        ),
    ]);
  }
}
