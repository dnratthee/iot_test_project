import 'package:flutter/material.dart';
import 'package:iot_test_project/views/register_ui.dart';
import 'package:iot_test_project/views/home_ui.dart';
import 'package:iot_test_project/services/call_api.dart';
import 'package:iot_test_project/widgets/my_appbar.dart';
import 'package:iot_test_project/widgets/my_button.dart';
import 'package:iot_test_project/widgets/my_loading.dart';
import 'package:iot_test_project/widgets/my_padding.dart';
import 'package:iot_test_project/widgets/my_alert.dart';
import 'package:iot_test_project/widgets/my_textfield.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool _isLoading = false;
  bool _isHidden = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void doLogin() async {
    setState(() {
      _isLoading = true;
    });
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const MyAlert(
                title: 'Login',
                content: 'Please fill in all information.',
              ));
      setState(() {
        _isLoading = false;
      });
      return;
    }

    await CallApi.login(usernameController.text, passwordController.text)
        .then((response) {
      if (response != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const HomeUI();
        }));
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const MyAlert(
                  title: 'Login',
                  content: 'Invalid username or password.',
                ));
      }
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyLoading(
        isLoading: _isLoading,
        child: MyAppBar(
          title: 'IoT SAU 2024',
          child: SingleChildScrollView(
            child: MyPadding(
              size: 0.1,
              isVertical: false,
              isFirstChild: true,
              child: Column(
                children: <Widget>[
                  MyPadding(
                      size: 0.03,
                      isFirstChild: true,
                      child: Image(
                        image: const AssetImage('assets/images/logo.png'),
                        width: MediaQuery.of(context).size.width * 0.5,
                      )),
                  const MyPadding(
                      size: 0.05,
                      child: Text(
                        'Login to your account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 156, 26, 37)),
                      )),
                  MyPadding(
                    size: 0.05,
                    child: MyTextField(
                        controller: usernameController,
                        label: 'Username',
                        hint: 'Username'),
                  ),
                  MyPadding(
                      size: 0.05,
                      child: MyTextField(
                          controller: passwordController,
                          label: 'Password',
                          hint: 'Password',
                          inputAction: TextInputAction.done,
                          isHidden: _isHidden,
                          suffixIcon: IconButton(
                              onPressed: () =>
                                  setState(() => _isHidden = !_isHidden),
                              icon: Icon(_isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility)))),
                  MyPadding(
                      size: 0.05,
                      child:
                          MyButton(onPressed: () => doLogin(), text: 'Login')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const RegisterUI();
                        })),
                        child: const Text('Register',
                            style: TextStyle(
                                color: Color.fromARGB(255, 156, 26, 37))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
