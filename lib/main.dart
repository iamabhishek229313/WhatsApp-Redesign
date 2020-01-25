import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/Screens/HomePage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.deepOrange,
        cardColor: Colors.blueGrey.shade600,
      ),
      home : HomePage()
    );
  }
}
