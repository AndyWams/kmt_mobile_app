import 'package:flutter/material.dart';
import 'package:kmt/screens/all_comments.dart';
import 'package:kmt/screens/home.dart';
import 'package:kmt/screens/onboading.dart';
import 'package:kmt/styles.dart';

const _onboarding = '/';
const AllCommentsPageRoute = '/all_comments';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Social App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: purple,
        ),
        onGenerateRoute: _routes());
  }

  RouteFactory _routes() {
    return (settings) {
      final int arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case _onboarding:
          screen = HomeFeeds();
          break;
        case AllCommentsPageRoute:
          screen = AllComments(arguments);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
