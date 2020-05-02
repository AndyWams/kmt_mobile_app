import 'package:flutter/material.dart';
import 'package:kmt/screens/home.dart';

import '../styles.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  void onTapBar() {
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (_) => HomeFeeds()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: offWhite,
          ),
          child: Padding(
            padding:
                EdgeInsets.only(top: 20, left: 18.0, right: 18.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/img_10.png'),
                            ),
                          )),
                      SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: TextField(
                          maxLines: 2,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 15),
                            fillColor: Colors.transparent,
                            filled: true,
                            hintText: 'Whats happening?',
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ));
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: onTapBar,
        child: Icon(
          Icons.arrow_back,
          color: black,
          size: 30,
        ),
      ),
      title: Text(
        'New Post',
        style: newPostTitle,
      ),
    );
  }
}
