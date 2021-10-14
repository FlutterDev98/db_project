// ignore_for_file: prefer_const_declarations, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

class AccountTask1 extends StatefulWidget {
  static final String id = 'AccountTask1';
  @override
  _AccountTask1State createState() => _AccountTask1State();
}

class _AccountTask1State extends State<AccountTask1> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  void _doSignUp() {
    String userName = userNameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String email = emailController.text.toString().trim();

    var box = Hive.box('db_project');
    box.put('username', userName);
    box.put('password', password);
    box.put('phone', phone);
    box.put('email', email);

    String user_id = box.get('username');
    String user_pw = box.get('password');
    String user_phone = box.get('phone');
    String user_email = box.get('email');
    print('Username: $user_id');
    print('Password: $user_pw');
    print('Phone: $user_phone');
    print('Email: $user_email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1e38),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Title
              Text(
                'Create\nAccount',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              SizedBox(
                height: 60,
              ),
              //TextFields
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    //User name
                    Container(
                      child: TextField(
                        controller: userNameController,
                        style: TextStyle(color: Colors.white54),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            hintText: 'User name',
                            hintStyle: TextStyle(color: Colors.white54),
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.white54,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Email name
                    Container(
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white54),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            hintText: 'E-Mail',
                            hintStyle: TextStyle(color: Colors.white54),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.white54,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Phone name
                    Container(
                      child: TextField(
                        controller: phoneController,
                        style: TextStyle(color: Colors.white54),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            hintText: 'Phone',
                            hintStyle: TextStyle(color: Colors.white54),
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.white54,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //User Password
                    Container(
                      child: TextField(
                        controller: passwordController,
                        style: TextStyle(color: Colors.white54),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            fillColor: Colors.white54,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white54),
                            prefixIcon: Icon(
                              FontAwesomeIcons.paintBrush,
                              color: Colors.white54,
                              size: 20,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                onPressed: () {
                  _doSignUp();
                },
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      colors: [
                        Colors.blue,
                        Colors.blueAccent,
                        Colors.lightBlue,
                      ],
                    ),
                  ),
                  child: Icon(
                    FontAwesomeIcons.arrowRight,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
