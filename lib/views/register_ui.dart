import 'package:flutter/material.dart';
import 'package:iot_test_project/utils/config.dart';
import 'package:iot_test_project/views/home_ui.dart';
import 'package:iot_test_project/models/user.dart';
import 'package:iot_test_project/services/call_api.dart';
import 'package:iot_test_project/widgets/my_alert.dart';
import 'package:iot_test_project/widgets/my_appbar.dart';
import 'package:iot_test_project/widgets/my_button.dart';
import 'package:iot_test_project/widgets/my_loading.dart';
import 'package:iot_test_project/widgets/my_padding.dart';
import 'package:iot_test_project/widgets/my_textfield.dart';

class RegisterUI extends StatefulWidget {
  const RegisterUI({super.key});

  @override
  State<RegisterUI> createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  bool _isHidden = true;
  bool _isLoading = false;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  showMessage(context, msg) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => MyAlert(
              title: 'Register',
              content: msg,
            ));
    setState(() {
      _isLoading = false;
    });
  }

  void onRegister() {
    setState(() {
      _isLoading = true;
    });

    if (fullNameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        ageController.text.isEmpty ||
        emailController.text.isEmpty) {
      showMessage(context, 'Please fill in all information');
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      showMessage(context, 'Password and Confirm Password do not match');
      return;
    }

    User user = User(
        fullname: fullNameController.text,
        username: usernameController.text,
        password: passwordController.text,
        age: int.parse(ageController.text),
        email: emailController.text);

    CallApi.register(user).then((user) {
      if (user.token != null) {
        showMessage(context, 'Register successfully');
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return const HomeUI();
          }), (Route<dynamic> route) => false);
        });
      } else {
        showMessage(context, 'Register failed');
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
            title: 'Register IoT SAU 2024',
            child: SingleChildScrollView(
                child: MyPadding(
                    size: 0.1,
                    isVertical: false,
                    isFirstChild: true,
                    child: Column(children: <Widget>[
                      const MyPadding(
                        size: 0.03,
                        isFirstChild: true,
                        child: Text(
                          'Enter your information to register',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Config.COLOR_RED),
                        ),
                      ),
                      MyPadding(
                        size: 0.03,
                        child: MyTextField(
                            controller: fullNameController,
                            label: 'Full Name',
                            hint: 'Full Name'),
                      ),
                      MyPadding(
                        size: 0.03,
                        child: MyTextField(
                            controller: usernameController,
                            label: 'Username',
                            hint: 'Username'),
                      ),
                      MyPadding(
                        size: 0.03,
                        child: MyTextField(
                            controller: passwordController,
                            label: 'Password',
                            hint: 'Password',
                            isHidden: _isHidden,
                            suffixIcon: IconButton(
                                onPressed: () =>
                                    setState(() => _isHidden = !_isHidden),
                                icon: Icon(_isHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                      ),
                      MyPadding(
                        size: 0.03,
                        child: MyTextField(
                            controller: confirmPasswordController,
                            label: 'Confirm Password',
                            hint: 'Confirm Password',
                            isHidden: _isHidden,
                            suffixIcon: IconButton(
                                onPressed: () =>
                                    setState(() => _isHidden = !_isHidden),
                                icon: Icon(_isHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                      ),
                      MyPadding(
                        size: 0.03,
                        child: MyTextField(
                            controller: ageController,
                            label: 'Age',
                            hint: 'Age',
                            inputType: TextInputType.number),
                      ),
                      MyPadding(
                        size: 0.03,
                        child: MyTextField(
                            controller: emailController,
                            label: 'Email',
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.done),
                      ),
                      MyPadding(
                        size: 0.1,
                        child: MyButton(
                            onPressed: () => onRegister(), text: 'Register'),
                      )
                    ])))));
  }
}
