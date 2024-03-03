import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register_ui.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 156, 26, 37),
        title: Text(
          'IoT SAU 2024',
          style: GoogleFonts.kanit(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Image(
                image: const AssetImage('assets/images/logo.png'),
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                'Login to your account',
                style: GoogleFonts.kanit(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 156, 26, 37)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              TextField(
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
                    hintText: 'Username',
                    labelText: 'Username',
                    hintStyle: GoogleFonts.kanit(),
                    labelStyle: GoogleFonts.kanit(),
                    border: const OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
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
                      hintText: 'Password',
                      labelText: 'Password',
                      hintStyle: GoogleFonts.kanit(),
                      labelStyle: GoogleFonts.kanit(),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isHidden = !_isHidden;
                            });
                          },
                          icon: Icon(_isHidden
                              ? Icons.visibility_off
                              : Icons.visibility))),
                  obscureText: _isHidden,
                  textInputAction: TextInputAction.done),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                  backgroundColor: const Color.fromARGB(255, 156, 26, 37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text('Login',
                    style:
                        GoogleFonts.kanit(fontSize: 20, color: Colors.white)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Don\'t have an account?', style: GoogleFonts.kanit()),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RegisterUI();
                      }));
                    },
                    child: Text('Register',
                        style: GoogleFonts.kanit(
                            color: Color.fromARGB(255, 156, 26, 37))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
