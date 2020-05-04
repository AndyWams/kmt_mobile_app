import 'package:flutter/material.dart';
import 'package:kmt/models/feeds-post-model.dart';
import 'package:kmt/screens/home.dart';
import 'package:kmt/services/feeds_service.dart';
import 'package:kmt/widgets/loadingState.dart';

import '../styles.dart';

class AllComments extends StatefulWidget {
  final int postId;
  AllComments(this.postId);

  @override
  _AllCommentsState createState() => _AllCommentsState();
}

class _AllCommentsState extends State<AllComments> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getByID(widget.postId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                height: MediaQuery.of(context).size.height,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: _appBar(context),
                  body: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            fit: StackFit.expand,
                            overflow: Overflow.clip,
                            children: <Widget>[
                              SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 60),
                                  child: Column(
                                    children: []
                                      ..addAll(commentSections(snapshot.data)),
                                  ),
                                ),
                              ),
                              postComment()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          } else
            return loadingState(
                context, "Hmm...", "Sommething seems to be wrong here");
        });
  }

  List<Widget> commentSections(Feeds item) {
    return item.comments
        .map((item) =>
            allCommentsWrap(item.avatar, item.name, item.comment, item.time))
        .toList();
  }

  Widget _appBar(context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeFeeds()));
        },
        child: Icon(
          Icons.arrow_back,
          color: black,
          size: 30,
        ),
      ),
      title: Text(
        'Comments',
        style: newPostTitle,
      ),
    );
  }

  Widget allCommentsWrap(
      String avatar, String author, String comment, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
      child: Row(children: [
        Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(avatar),
              ),
            )),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  text: author,
                  style: TextStyle(color: black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "  " + comment,
                      style: TextStyle(
                          color: black,
                          height: 1.4,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                time,
                style: TextStyle(color: dark, fontSize: 10),
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget postComment() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 61,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: soft_grey),
          ),
          color: Colors.white,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: TextField(
              maxLines: 2,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                fillColor: Colors.transparent,
                filled: true,
                hintText: 'Write your comment',
              ),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              'Post',
              style: TextStyle(color: black, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}
