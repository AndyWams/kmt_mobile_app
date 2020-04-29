import 'package:flutter/material.dart';
import 'package:kmt/widgets/feeds_header.dart';

import '../styles.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: SingleChildScrollView(
        child: Container(
              decoration: BoxDecoration(
                color: offWhite,
            ),
            child: Column(
                children: <Widget>[
                   FeedsHeader('Profile'),
                   Text('Profile Page')
                ])),
    ),
    );
  }
}