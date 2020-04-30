import 'package:flutter/material.dart';
import 'package:kmt/widgets/custom_icons.dart/comment_icon.dart';
import '../styles.dart';
import 'custom_icons.dart/share_icon.dart';

  Widget userInfo(ImageProvider image, String name) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: image,
              ),
          )),
          SizedBox(width: 10.0,),
          Text(name)
          ]
    );
  }
  Widget moreOptions() {
    return GestureDetector(
      onTap: (){},
      child: Icon(Icons.more_horiz));
  }
  Widget mediaPost(ImageProvider media, context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: media,
          ),
        )
      ),
   );
  }
  Widget panel() {
    return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.favorite, size: 18, color: Colors.red,),
                            SizedBox(width: 5.0,),
                            Text('1.1M'),
                            SizedBox(width: 20.0,),
                            Icon(CustomCommentIcon.comment_icon, size: 18, color: black,),
                              SizedBox(width: 5.0,),
                            Text('300k'),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(CustomShareIcon.share, size: 18, color: black,),
                            SizedBox(width: 5.0,),
                            Text('Share')
                          ],
                        ),
                      ],
                    ),
                    ),
              ),
            ],
          );
  }
  Widget statusPost(String author, String post) { 
    return Padding(
            padding: const EdgeInsets.only(top: 10, left: 12.0, right: 12.0, bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                     child: Container(
                    child: 
                    Text.rich(
                        TextSpan(text: author, style: TextStyle(color: black),// default text style
                          children:[TextSpan(text: post,style: TextStyle(color: dark,height: 1.4),),],
                        ),
                  )),
                ),
              ],
            ),
    );
  }
  Widget moreComments(String totalComment) {
    return GestureDetector(
          onTap: (){},
          child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text('View all $totalComment comments',  style: TextStyle(color: dark))),
                ],
              ),
            ),
    );
  }
  Widget showTopComments(List<Widget> eachitem) {
    List<Widget> commentList = new List<Widget>();
    for(var i = 0; i < eachitem.length; i++){
        commentList.add(eachitem[i]);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: commentList),
            ),
          ],
        ),
      ),
    );
  }
  Widget dComment(String commentauthor, String comment) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
             child: Text.rich(TextSpan(text: commentauthor, style: TextStyle(color: black),
                      children:[TextSpan(text: comment,style: TextStyle(color: dark, height: 1.4),),],
                    ),
      )),
    );
  }
