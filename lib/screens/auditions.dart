import 'package:flutter/material.dart';
import 'package:kmt/widgets/feeds_header.dart';
import '../styles.dart';

class AuditionScreen extends StatefulWidget {
  @override
  _AuditionScreenState createState() => _AuditionScreenState();
}

class _AuditionScreenState extends State<AuditionScreen> {
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
                 FeedsHeader('Auditions',  GestureDetector(
                  onTap: (){},
                  child: Icon(
                    Icons.notifications_active,
                    color: black,
                      size: 30,
                    ),)),
                   Text('Audition Page')
                ])),
    ),
    );
  }
    
}