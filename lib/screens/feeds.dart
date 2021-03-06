import 'package:flutter/material.dart';
import 'package:kmt/models/feeds-post-model.dart';
import 'package:kmt/services/feeds_service.dart';
import 'package:kmt/widgets/feeds_header.dart';
import 'package:kmt/widgets/feeds_helper_methods.dart';
import '../main.dart';
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
            FeedsHeader(
                'Feeds',
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.notifications_active,
                    color: black,
                    size: 30,
                  ),
                )),
            Expanded(child: _allFeeds()),
          ])),
    );
  }

  Widget feedsPost(String profileimg, String usernamme, String media,
      String post, commentCount, dcomment, commentId) {
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
                statusPost(usernamme, post),
                Container(
                  child: GestureDetector(
                      onTap: () => _showAllComments(context, commentId),
                      child: moreComments('$commentCount')),
                ),
                getTopComments([
                  dComment(dcomment[0].name, dcomment[0].comment),
                  dComment(dcomment[1].name, dcomment[1].comment),
                  dComment(dcomment[2].name, dcomment[2].comment),
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
                var id = snapshot.data[index].id;
                return feedsPost(
                    '${snapshot.data[index].imagePath}',
                    '${snapshot.data[index].name}',
                    '${snapshot.data[index].post.media}',
                    '${snapshot.data[index].post.title}',
                    totalcomments,
                    snapshot.data[index].comments,
                    id);
              },
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }

  _showAllComments(BuildContext context, int postId) {
    Navigator.pushNamed(context, AllCommentsPageRoute, arguments: postId);
  }

  Widget moreOptions() {
    return GestureDetector(
        onTap: () {
          _showModal();
        },
        child: Icon(Icons.more_horiz));
  }

  void _showModal() {
    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
                color: white,
                borderRadius: new BorderRadius.all(Radius.circular(15))),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Repost Post',
                    style: TextStyle(
                        color: red, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('View Profile',
                        style: TextStyle(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  Text('Share to',
                      style: TextStyle(
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(15.0))),
                    child: Text('Cancel',
                        style: TextStyle(
                            color: red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
