import 'package:flutter/material.dart';
import '../styles.dart';

class FeedsHeader extends StatelessWidget with PreferredSizeWidget {
  final  String title;
  final  Widget icon;
  @override
  FeedsHeader(this.title, this.icon);
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60.0,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title, style: feedsTitle ),
               icon
            ],
          )),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
