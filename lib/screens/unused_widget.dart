import 'package:flutter/material.dart';
import 'package:kmt/screens/message.dart';
import 'package:kmt/styles.dart';
import 'package:kmt/widgets/feeds_bottom_nav.dart';
import 'package:kmt/widgets/feeds_header.dart';
import 'package:kmt/widgets/custom_icons.dart/audition_icon.dart';
import 'package:kmt/widgets/custom_icons.dart/home_feeds_icon.dart';
import 'package:kmt/widgets/custom_icons.dart/plus_icon2.dart';
import 'package:kmt/widgets/custom_icons.dart/profile_icon.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}
class _FeedsScreenState extends State<FeedsScreen> {

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
                ])),
    ),
  
    bottomNavigationBar:FeedsBottomNav(
      getNavWidgets(
            [
              active(),
              navItem(
                    context, 
                    MessageScreen(),
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      BtmIcon(Icons.textsms, 20.0, inactive_feeds),
                      SizedBox(height: 3.0),
                      Text('Messages',)
                    ],
                  )),
              navItem(
                    context, 
                    FeedsScreen(),
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      BtmIcon(PlusIcon2.plus_circle, 50.0,  active_feeds)
                    ],
              )),
              navItem(
                    context, 
                    FeedsScreen(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BtmIcon(CustomIcons3.audition_icon, 20.0,  inactive_feeds),
                        SizedBox(height: 3.0),
                        Text('Auditions')
                      ],
                    )), 
              navItem(
                    context, 
                    FeedsScreen(),
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BtmIcon(CustomIcons2.profile_icon, 20.0,  inactive_feeds),
                        SizedBox(height: 3.0),
                        Text('My profile',)
                      ],
                    ))  
            ]
      ) 
    ));
}


Widget active() {
 return Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    BtmIcon(CustomIcons.home_icon, 20.0, active_feeds),
    SizedBox(height: 3.0),
    Text('Feeds', style: active_title)
  ],
  );
}

Widget getNavWidgets(List<Widget> navitem) {
  List<Widget> myList = new List<Widget>();
  for(var i = 0; i < navitem.length; i++){
      myList.add(navitem[i]);
  }
  return Container(
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: myList),
  );
}

Widget navItem(context,  pageItem, content) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
        MaterialPageRoute(
          builder: (_) => pageItem,
        )),
      child: content);
}
}

