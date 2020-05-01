import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kmt/screens/final_step.dart';
import 'package:kmt/screens/login.dart';
import 'package:kmt/widgets/header_nav.dart';
import '../styles.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;
  bool leadingIcon = false;
  @override
 Widget build(BuildContext context) {
    return  isLoading ? loadingState(context): Scaffold(
      body:  SingleChildScrollView(
        child: Container(
             decoration: BoxDecoration(
               color: Colors.white,
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.dstATop),
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.scaleDown,
                alignment: Alignment.topRight,
              ),
           ),
           child: Column(
                children: <Widget>[
                  HeaderBar(leadingIcon),
                  welcomeText(),
                  signupForm(context),
                ])),
    ),
      bottomNavigationBar: loginLink(context)
    );
  }


  Widget welcomeText(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 30.0, 50.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Create Account', style: h1,),
          SizedBox(height: 10.0,),
          Text('Enter details below to complete creating your account', style: p2,)
        ],
      ),
    );
  }
  Widget signupForm(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1,color: text_field_border),
                      borderRadius: BorderRadius.circular(6.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(width: 1,color: purple)
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Full Name',
                    ),
                ),
                SizedBox(height: 15.0),
                TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1,color: text_field_border),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1,color: purple)
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Email address',
                    ),
                  ),
                SizedBox(height: 15.0),
                TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1,color: text_field_border),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1,color: purple)
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Password',
                    ),
                  ),
                SizedBox(height: 15.0),
                InputDecorator(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                        labelText: 'Area of Interest',
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1,color: text_field_border),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1,color: purple)
                      ),
                      ),
                    child: DropdownButtonHideUnderline(
                      child:  DropdownButton<String>(
                            items: <String>['Music', 'Dancing', 'Drawing', 'Acting'].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(right: 9.5),
                          child: Text('You hereby agree to our Terms & Conditions guiding this servicea', style: small_span,)) 
                      ,),
                    Switch(
                      value: false,
                      onChanged: (bool value) {},)
                    ]
                     ),
                ),      
                SizedBox(height: 30.0),
                GestureDetector(
                        onTap: () { 
                           setState(() {
                              isLoading = true;
                           });
                          Timer(Duration(seconds: 3), () {
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (_) => FinalStepScreen(),),);
                          });  
                          },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: purple,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Create account',
                            style: button_primary
                          ),
                        ),
                ),
               
        ],
      ),
    );
  }
  Widget loginLink(context) {
    return BottomAppBar(
          child: Container(
            height: 61.0,
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
              ),
              child: Container(
                alignment: Alignment.center,
                color: soft_purple,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already a member? ',
                      style: span_primary,
                    ),
                    Text('Signin',style: span,)
                  ],
                ),
              ),
            ),
          ),
    );
  }
  Widget loadingState(context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: dark,
        child: Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          child:  Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new CircularProgressIndicator(),
              SizedBox(height: 20),
               Text("Creating Account", style: loaderHeaderText,),
                Text("Get ready for what’s in store for you", style: loaderSubText,)
            ],
          )),
      );
  }
}