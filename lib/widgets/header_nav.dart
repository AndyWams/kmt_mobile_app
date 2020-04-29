import 'package:flutter/material.dart';

import '../styles.dart';

class HeaderBar extends StatelessWidget with PreferredSizeWidget {
  final bool showLeadingIcon;
  HeaderBar(this.showLeadingIcon);
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
      child: Container(
        child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: showLeadingIcon ? null :Builder(
              builder: (BuildContext context) {
                return leadingIcon(context);
              },
            ),
            actions: <Widget>[
              Container(
                width: 55.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover,
                    )),
              ),
            ])),
    );
  }

  Widget leadingIcon(context) {
     return GestureDetector(
       onTap: () => Navigator.pop(context),
       child: Container(
          alignment: Alignment.centerLeft,
            child: Icon(Icons.arrow_back, color: purple, size: 40,),));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
