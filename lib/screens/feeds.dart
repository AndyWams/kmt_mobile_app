import 'package:flutter/material.dart';
import 'package:kmt/models/feeds-post-model.dart';
import 'package:kmt/services/feeds_service.dart';
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
      body: Container(
          decoration: BoxDecoration(
            color: offWhite,
          ),
          child: Column(children: <Widget>[
            FeedsHeader('Feeds'),
            Expanded(child: _allFeeds()),
          ])),
    );
  }

  Widget feedsPost(
    String profileimg,
    String usernamme,
    String media,
    String post,
    commentCount,
    commenter,
    comment,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 18.0, right: 18.0, bottom: 10.0),
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              userInfo(AssetImage(profileimg), usernamme),
              moreOptions()
            ]),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                mediaPost(AssetImage(media), context),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: soft_grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Column(children: <Widget>[
                panel(),
                Column(children: <Widget>[
                  statusPost(usernamme, post),
                  moreComments('$commentCount'),
                  showTopComments([dComment(commenter, comment)]),
                ])
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _allFeeds() {
    return FutureBuilder(
        future: fetchAllFeeds(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "No Feeds yet!",
                  style: errorMsg,
                ),
              );
            }
            List<Feeds> totalFeeds = snapshot.data ?? [];
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 0),
              itemCount: totalFeeds.length,
              itemBuilder: (BuildContext context, int index) {
                var totalcomments = totalFeeds[index].comments.length;
                var name, dcomment;
                name = totalFeeds[index].comments[index].name;
                dcomment = totalFeeds[index].comments[index].comment;
                 
                return feedsPost(
                    '${snapshot.data[index].imagePath}',
                    '${snapshot.data[index].name}',
                    '${snapshot.data[index].post.media}',
                    '${snapshot.data[index].post.title}',
                    totalcomments,
                    name,
                    dcomment);
              },
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}

 