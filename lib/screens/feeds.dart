import 'package:flutter/material.dart';
import 'package:kmt/widgets/feeds_header.dart';
import 'package:kmt/widgets/feeds_helper_methods.dart';
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
                  feedsPost('assets/images/img_5.png', 'Elon Mosk  ', 'assets/images/img_7.png', '   Awesome project, time to move to phase two...'),
                  feedsPost('assets/images/img_8.png', 'Jeremy Reiner  ', 'assets/images/img_6.png', '  Wow, what a great time to be alive.')
                ])),
    ),
    );
  }

  Widget feedsPost(String profileimg, String usernamme,  String media, String postStatus) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 18.0, right: 18.0, bottom: 10.0),
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                userInfo(AssetImage(profileimg), usernamme),
                moreOptions()
              ]
            ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                mediaPost(AssetImage(media), context),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: soft_grey,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))
              ),
              child: Column(
                children: <Widget>[
                panel(),
                 Column(
                   children: <Widget>[
                    statusPost(usernamme, postStatus),
                    moreComments( '200' ),
                    showTopComments(
                      [
                        dComment('Richard Branson ', '  It\'s a lovely day to get inspired and make more moves'),
                        dComment('Mark Zukerberg  ', '  Hello world, its a new day.'),
                      ]
                    ),
                   ],
                 )
                ],
              ),
            )
          ],
          ),
        ),
    );
  }
}