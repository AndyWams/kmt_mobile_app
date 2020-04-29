import 'package:flutter/material.dart';
import 'package:kmt/styles.dart';
import 'package:kmt/widgets/feeds_header.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
                   FeedsHeader('Messages'),
                   Text('Message Page')
                ])),
    ),
    );
  }
}

