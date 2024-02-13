import 'package:flutter/material.dart';
import 'package:mustlist/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Must List',
      theme: ThemeData(),
      home: const MainScreen(),
    );
  }
}
