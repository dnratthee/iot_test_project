import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget child;

  const MyAppBar({
    super.key,
    required this.title,
    this.actions = const [],
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 156, 26, 37),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: actions,
        ),
        body: child);
  }
}
