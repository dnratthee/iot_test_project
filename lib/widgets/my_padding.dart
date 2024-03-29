import 'package:flutter/material.dart';

class MyPadding extends StatelessWidget {
  final double size;
  final bool isVertical;
  final Widget? child;
  final bool isFirstChild;
  final bool isLastChild;

  const MyPadding({
    super.key,
    this.size = 0.05,
    this.isVertical = true,
    this.isFirstChild = false,
    this.isLastChild = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return Padding(
        padding: isVertical
            ? isFirstChild
                ? EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * size)
                : isLastChild
                    ? EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * size,
                        bottom: MediaQuery.of(context).size.height * size * 2)
                    : EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * size)
            : isFirstChild
                ? EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * size)
                : EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * size),
        child: child,
      );
    }
    if (isVertical) {
      return SizedBox(height: MediaQuery.of(context).size.height * size);
    } else {
      return SizedBox(width: MediaQuery.of(context).size.width * size);
    }
  }
}
