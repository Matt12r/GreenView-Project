import 'package:flutter/material.dart';

import 'package:greenproject/Screens/welcome_screen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return myAppState();
  }
}

// ignore: camel_case_types
class myAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: welcomePage());
  }
}
