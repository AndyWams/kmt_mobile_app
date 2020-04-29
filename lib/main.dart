import 'package:flutter/material.dart';
import 'package:kmt/screens/feeds.dart';
import 'package:kmt/screens/home.dart';
import 'package:kmt/screens/signup.dart';
import 'package:kmt/styles.dart';
import 'screens/onboading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp( 
      title: 'Social App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: purple,
      ),
      home: Onboading(),
    );
  }
}