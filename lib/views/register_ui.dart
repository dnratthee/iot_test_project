import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterUI extends StatefulWidget {
  const RegisterUI({super.key});

  @override
  State<RegisterUI> createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 156, 26, 37),
        title: Text(
          'Register IoT SAU 2024',
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
              Text(
                'Enter your information to register',
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
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
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
                  textInputAction: TextInputAction.next),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                  keyboardType: TextInputType.emailAddress,
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
                    hintText: 'Email',
                    labelText: 'Email',
                    hintStyle: GoogleFonts.kanit(),
                    labelStyle: GoogleFonts.kanit(),
                    border: const OutlineInputBorder(),
                  ),
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
                child: const Text('Register',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
