import 'package:flutter/material.dart';
import 'package:iot_test_project/utils/store.dart';
import 'package:iot_test_project/views/login_ui.dart';
import 'package:iot_test_project/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      if (Store.has('user')) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const HomeUI();
        }));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const LoginUI();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
              image: const AssetImage('assets/images/logo.png'),
              width: MediaQuery.of(context).size.width * 0.75),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          const CircularProgressIndicator(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          const Text(
            'IoT SAU 2024',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
