import 'package:flutter/material.dart';
import 'package:kmt/screens/landing.dart';
import 'package:kmt/styles.dart';
import 'package:kmt/widgets/curve_clipper.dart';

  Widget slide_1(BuildContext context) {  
    return SingleChildScrollView(
      child:  Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              ClipPath(
                clipper: CurveClipper(),
                    child: Image(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: double.infinity,
                    image: AssetImage('assets/images/img_1.png'),
                    fit: BoxFit.cover,
                    ),
              ),
              Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Discover Creatives', style: h1),
                        SizedBox(height: 10.0),
                        Text('Over 1,00,000 people uses meetup app every day to attend meetups and socialize.', style: p1),
                        SizedBox(height: 18.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          dotsfirst(purple),
                            Text('Swipe to continue', style: small)
                            ],
                        )
                      ],
                    ),
                  ),
                ),
              ],),
      ),
    );
  }
  Widget slide_2(BuildContext context) {  
    return SingleChildScrollView(
      child:  Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              ClipPath(
                clipper: CurveClipper(),
                    child: Image(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: double.infinity,
                    image: AssetImage('assets/images/img_2.png'),
                    fit: BoxFit.cover,
                    ),
              ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Discover Creatives', style: h1),
                        SizedBox(height: 10.0),
                        Text('Over 1,00,000 people uses meetup app every day to attend meetups and socialize.', style: p1),
                        SizedBox(height: 18.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          dotssecond(purple),
                            Text('Swipe to continue', style: small)
                            ],
                        )
                      ],
                    ),
                  ),
                ),
              ],),
      ),
    );
  }
  Widget slide_3(BuildContext context) {  
    return SingleChildScrollView(
      child:  Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              ClipPath(
                clipper: CurveClipper(),
                    child: Image(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: double.infinity,
                    image: AssetImage('assets/images/img_3.png'),
                    fit: BoxFit.cover,
                    ),
              ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Found a match', style: h1),
                        SizedBox(height: 10.0),
                        Text('Once your match is found connect with them in order to take things forward.', style: p1),
                        SizedBox(height: 20.0),
                        GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => LandingScreen(),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                'Get started now',
                                style: button_primary
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],),
      ),
    );
  }
  Widget dotsfirst(color) {
    return Row(children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 8.0, 
            height: 8.0,
            decoration: BoxDecoration(
              color: color, 
              shape: BoxShape.circle),
          ),
          Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 8.0, 
            height: 8.0,
            decoration: BoxDecoration(
              color: purple50, 
              shape: BoxShape.circle),
          ),
          Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 8.0, 
            height: 8.0,
            decoration: BoxDecoration(
              color: purple50, 
              shape: BoxShape.circle),
          ),
        ],
    );
  }
  Widget dotssecond(color) {
  return Row(children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 8.0),
          width: 8.0, 
          height: 8.0,
          decoration: BoxDecoration(
            color: purple50, 
            shape: BoxShape.circle),
        ),
        Container(
          margin: EdgeInsets.only(right: 8.0),
          width: 8.0, 
          height: 8.0,
          decoration: BoxDecoration(
            color: color, 
            shape: BoxShape.circle),
        ),
        Container(
          margin: EdgeInsets.only(right: 8.0),
          width: 8.0, 
          height: 8.0,
          decoration: BoxDecoration(
            color: purple50, 
            shape: BoxShape.circle),
        ),
      ],
  );
}
  Widget dotsthird(color) {
    return Row(children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 8.0, 
            height: 8.0,
            decoration: BoxDecoration(
              color: purple50, 
              shape: BoxShape.circle),
          ),
          Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 8.0, 
            height: 8.0,
            decoration: BoxDecoration(
              color: purple50, 
              shape: BoxShape.circle),
          ),
          Container(
            margin: EdgeInsets.only(right: 8.0),
            width: 8.0, 
            height: 8.0,
            decoration: BoxDecoration(
              color: color, 
              shape: BoxShape.circle),
          ),
        ],
    );
  }
