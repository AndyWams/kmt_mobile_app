import 'package:flutter/material.dart';
import 'package:kmt/screens/auditions.dart';
import 'package:kmt/screens/feeds.dart';
import 'package:kmt/screens/friends.dart';
import 'package:kmt/screens/message.dart';
import 'package:kmt/screens/profile.dart';
import 'package:kmt/widgets/custom_icons.dart/home_feeds_icon.dart';
import 'package:kmt/widgets/custom_icons.dart/audition_icon.dart';
import 'package:kmt/widgets/custom_icons.dart/plus_icon2.dart';
import 'package:kmt/widgets/custom_icons.dart/profile_icon.dart';
import '../styles.dart';

class HomeFeeds extends StatefulWidget {
  @override
  _HomeFeedsState createState() => _HomeFeedsState();
}

class _HomeFeedsState extends State<HomeFeeds> {
   int _currentIndex = 0;
  final List<Widget> _children = [
    FeedsHome(),
    MessageScreen(),
    FriendsScreen(),
    AuditionScreen(),
    ProfileScreen()
  ];
  void onTapBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar:BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTapBar,
          currentIndex: _currentIndex,
      items: [
          BottomNavigationBarItem(
            icon:   BtmIcon(CustomIcons.home_icon, 20.0),
            title: Text("Home", ),
          ),
          BottomNavigationBarItem(
            icon:  BtmIcon(Icons.textsms, 20.0),
            title: Text("Messages", ),
          ),
          BottomNavigationBarItem(
            icon:  Icon(PlusIcon2.plus_circle, color: active_feeds, size: 50,),
            title: Text(''),
          ),
            BottomNavigationBarItem(
            icon:  BtmIcon(CustomIcons3.audition_icon, 20.0),
            title: Text("Auditions", ),
          ),
              BottomNavigationBarItem(
            icon: BtmIcon(CustomIcons2.profile_icon, 20.0),
            title: Text("My Profile"),
          ),

        ]
      
    )
    );
  }
}

class BtmIcon extends StatelessWidget {
  final IconData _name;
  final double _size;
  BtmIcon(this._name, this._size);
  Widget build(context) {
    return Icon(
      _name,
      size: _size
    );
  }
}