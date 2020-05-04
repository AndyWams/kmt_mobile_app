import 'package:flutter/material.dart';
import 'package:kmt/screens/add_new_post.dart';
import 'package:kmt/screens/auditions.dart';
import 'package:kmt/screens/feeds.dart';
import 'package:kmt/screens/message.dart';
import 'package:kmt/screens/profile.dart';
import 'package:kmt/widgets/custom_icons.dart/home_feeds_icon.dart';
import 'package:kmt/widgets/custom_icons.dart/audition_icon.dart';
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
    AddPostScreen(),
    AuditionScreen(),
    ProfileScreen()
  ];
  void onTapBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    if (_currentIndex == 2) {
      return Scaffold(
        body: PageStorage(
          child: _children[_currentIndex],
          bucket: bucket,
        ),
      );
    } else {
      return Scaffold(
        bottomNavigationBar:
            _bottomNavigationBar(context, _currentIndex, onTapBar),
        body: PageStorage(
          child: _children[_currentIndex],
          bucket: bucket,
        ),
      );
    }
  }
}

Widget _bottomNavigationBar(context, index, fn) {
  return Theme(
    data: Theme.of(context).copyWith(
        //  canvasColor: Colors.green,
        // primaryColor: Colors.red,
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: light_grey))),
    child: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        onTap: fn,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: BtmIcon(CustomIcons.home_icon, 20.0),
            title: Text(
              "Home",
            ),
          ),
          BottomNavigationBarItem(
            icon: BtmIcon(Icons.textsms, 20.0),
            title: Text(
              "Messages",
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: active_feeds,
              size: 50,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: BtmIcon(CustomIcons3.audition_icon, 20.0),
            title: Text(
              "Auditions",
            ),
          ),
          BottomNavigationBarItem(
            icon: BtmIcon(CustomIcons2.profile_icon, 20.0),
            title: Text("My Profile"),
          ),
        ]),
  );
}

class BtmIcon extends StatelessWidget {
  final IconData _name;
  final double _size;
  BtmIcon(this._name, this._size);
  Widget build(context) {
    return Icon(_name, size: _size);
  }
}
