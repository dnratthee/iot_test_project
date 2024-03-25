import 'package:flutter/material.dart';
import 'package:iot_test_project/utils/store.dart';
import 'package:iot_test_project/views/login_ui.dart';
import 'package:iot_test_project/widgets/my_appbar.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});
  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return MyAppBar(
        title: 'Home',
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined, color: Colors.white),
            tooltip: 'Sing out',
            onPressed: () {
              Store.delete('user');
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginUI()));
            },
          ),
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome ${Store.getValue('user', 'fullname')}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
