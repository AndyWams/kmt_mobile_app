import 'package:flutter/material.dart';

import '../styles.dart';

Widget loadingState(context, String msgtitle, String submsgtitle) {
  return Container(
    height: MediaQuery.of(context).size.height,
    color: dark,
    child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              msgtitle,
              style: loaderHeaderText,
            ),
            Text(
              submsgtitle,
              style: loaderSubText,
            )
          ],
        )),
  );
}
