import 'package:flutter/material.dart';
import '../widgets/onboarding_slides.dart';

class Onboading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    return Scaffold(
        body: PageView(
          controller:  controller,
          children: [
            slide_1(context),
            slide_2(context),
            slide_3(context),
          ],
        ),
    );
  }

}
