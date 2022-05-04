import 'package:flutter/material.dart';
import 'package:namefeature/welcome.dart';

import 'db/helper.dart';
DBHelper dbHelper = DBHelper();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'नाम से जाने भविष्य',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Welcome(),
    );
  }
}


