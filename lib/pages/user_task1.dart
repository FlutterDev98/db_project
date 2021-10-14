// ignore_for_file: prefer_const_declarations, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace
// @dart=2.9
import 'package:db_project/pages/account_task1.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

class UserTask1 extends StatefulWidget {
  static final String id = 'UserTask1';
  @override
  _UserTask1State createState() => _UserTask1State();
}

class _UserTask1State extends State<UserTask1> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin() {
    String userName = userNameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var box = Hive.box('db_project');
    box.put('username', userName);
    box.put('password', password);

    String user_id = box.get('username');
    String user_pw = box.get('password');
    print('Username: $user_id');
    print('Password: $user_pw');
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
              //Cover Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: AssetImage('assets/images/ic_image.jpeg'),
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //Title
              Text(
                'Welcome Back!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              ),
              //SubTitle
              Text(
                'Sign in to continue',
                style: TextStyle(color: Colors.white, fontSize: 25),
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
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
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
                child: GestureDetector(
                  onTap: () {
                    _doLogin();
                  },
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
                    "Don't have an account?",
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
                      Navigator.of(context).pushNamed(AccountTask1.id);
                    },
                    child: Text(
                      "SIGN UP",
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
