import 'package:flutter/material.dart';
import 'package:kmt/widgets/feeds_header.dart';

import '../styles.dart';

class FeedsHome extends StatefulWidget {
  @override
  _FeedsHomeState createState() => _FeedsHomeState();
}

class _FeedsHomeState extends State<FeedsHome> {
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
                  FeedsHeader('Feeds'),
                   Text('Feeds Page')
                ])),
    ),
    );
  }
}