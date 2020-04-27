import 'package:flutter/material.dart';
import 'package:kmt/screens/login.dart';
import 'package:kmt/widgets/header_nav.dart';
import '../styles.dart';

class SignupScreen extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  HeaderBar(),
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
      padding: const EdgeInsets.fromLTRB(25.0, 40.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
                TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
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
                      border: OutlineInputBorder(),
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
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0))
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
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
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
                            'Create account',
                            style: button_primary
                          ),
                        ),
                ),
                SizedBox(height: 50.0),
               
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
}