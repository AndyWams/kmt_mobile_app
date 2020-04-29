import 'package:flutter/material.dart';
import 'package:kmt/widgets/feeds_header.dart';

import '../styles.dart';

class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
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
                   FeedsHeader('Friends'),
                   Text('Friends Page')
                ])),
    ),
    );
  }
}