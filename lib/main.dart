import 'package:flutter/material.dart';

import 'assignment_1/assignment_1.dart';
import 'assignment_2/assignment_2.dart';
import 'assignment_3/assignment_3.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Assignment3(),
    );
  }
}

