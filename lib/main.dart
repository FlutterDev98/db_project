import 'dart:io';

import 'package:db_project/pages/account_task1.dart';
import 'package:db_project/pages/accunt_task2.dart';
import 'package:db_project/pages/user_task1.dart';
import 'package:db_project/pages/user_task2.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('db_project');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserTask2(),
      routes: {
        UserTask1.id: (context) => UserTask1(),
        AccountTask1.id: (context) => AccountTask1(),
        UserTask2.id: (context) => UserTask2(),
        AccountTask2.id: (context) => AccountTask2(),
      },
    );
  }
}
