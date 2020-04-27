import 'package:flutter/material.dart';
import 'package:kmt/screens/login.dart';
import 'package:kmt/screens/signup.dart';
import '../styles.dart';


class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
           decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage("assets/images/img_4.png"),
                fit: BoxFit.scaleDown,
                alignment: Alignment.topRight,
              ),
           ),
          child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 30.0, 0.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Stack(
                    overflow: Overflow.visible,
                      children: <Widget>[
                              Container(
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(  
                                        padding: const EdgeInsets.only(top: 40.0),
                                        child: Container(
                                          child: Image.asset('assets/images/logo.png', height: 80,),),
                                        ),
                                      welcomeText(),
                                  ],)
                              ),
                      ],
                  ),
                actionButton(context),
                signuplink()
              ],),
          ),)
        ),
    );
  }

   Widget welcomeText() {
    return Padding(
       padding: const EdgeInsets.fromLTRB(20.0, 40.0, 0.0, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Welcome to', style: h2,),
          SizedBox(height: 5.0,),
          Text('Know my talents', style: h1,),
          SizedBox(height: 10.0,),
          Text('Over 1,00,000 people uses meetup app every day to attend meetups and socialize.', style: p2,)
        ],
      ),
    );
  }
   Widget actionButton(context) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 90.0, 20.0, 10.0),
           child:  Column(
              children: <Widget>[
                  GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginScreen(),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 20.0),
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                                BoxShadow(
                                  color: grey,
                                  blurRadius: 3, // soften the shadow
                                  spreadRadius: 0.5, //extend the shadow
                                  offset: Offset(
                                    0.0, // Move to right 10  horizontally
                                    4.0, // Move to bottom 10 Vertically
                                  ),
                                )
                            ]
                        ),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/google_icon.png'),
                            SizedBox(width: 10.0,),
                            Text(
                              'Continue with Google',
                              style: button_secondary
                            ),
                          ],
                        ),
                      ),
                ),
                  GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SignupScreen(),
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
                          'I\'m New',
                          style: button_primary
                        ),
                      ),
                ),
              ],
            )
        );
   }
   Widget signuplink() {
      return   Expanded(
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              height: 80.0,
              child: Text(
                'Signup with Email',
                style: p1,
              ),
            ),
          ),
        ),
        );
   }

}