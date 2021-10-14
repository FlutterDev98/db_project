// ignore_for_file: prefer_const_declarations, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:db_project/pages/accunt_task2.dart';
import 'package:db_project/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

class UserTask2 extends StatefulWidget {
  static final String id = 'UserTask2';
  @override
  _UserTask2State createState() => _UserTask2State();
}

class _UserTask2State extends State<UserTask2> {
  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin() {
    String email = userEmailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    //Store user
    var user1 = User(email: email, password: password);
    var box = Hive.box('db_project');
    box.put('user', user1.toJson());

    //Load User
    var user2 = User.fromJson(box.get('user'));
    print('Username: ${user2.email}');
    print('Password: ${user2.password}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff077f7b),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //TOP PART
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 70, 0, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //User Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        height: 55,
                        width: 55,
                        image: AssetImage('assets/images/ic_image.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Welcome Text
                    Text(
                      'Welcome',
                      style: TextStyle(color: Color(0xff27a6a2), fontSize: 20),
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ],
                ),
              ),
            ),
            //Bottom PART
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40, 60, 40, 20),
                      child: Column(
                        children: [
                          //Email
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: userEmailController,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200),
                                      ),
                                      hintText: 'Enter email',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //Password
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200),
                                      ),
                                      hintText: 'Enter password',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //Forget Password
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forget Password ?',
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //Sign In
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff077f7b),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                _doLogin();
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //OR
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width / 3,
                                  color: Colors.grey.shade300,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'OR',
                                  style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width / 3,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.facebookF,
                                color: Colors.blueAccent,
                                size: 20,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                FontAwesomeIcons.twitter,
                                color: Colors.lightBlueAccent,
                                size: 20,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                FontAwesomeIcons.instagramSquare,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AccountTask2.id);
                                },
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: Color(0xff077f7b),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
