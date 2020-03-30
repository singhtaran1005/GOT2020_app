import 'package:flutter/material.dart';
import 'package:got_2020/got_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: Got1(),
    );
  }
}
