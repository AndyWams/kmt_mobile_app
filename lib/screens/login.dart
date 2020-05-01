import 'package:flutter/material.dart';
import 'package:kmt/screens/signup.dart';
import 'package:kmt/widgets/header_nav.dart';
import '../styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool leadingIcon;
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
                  HeaderBar(leadingIcon= false),
                  welcomeText(),
                  loginForm(context),
                ])),
    ),
      bottomNavigationBar: signupLink(context)
    );
  }


  Widget welcomeText(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 30.0, 50.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Login', style: h1,),
          SizedBox(height: 10.0,),
          Text('Sign in with your username or email and password', style: p2,)
        ],
      ),
    );
  }
  Widget loginForm(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 70.0, 25.0, 60.0),
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
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 1,color: purple)
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Email address',
                      suffixIcon: Icon(
                        Icons.alternate_email,
                        size: 30.0,
                      ),
                    ),
                  ),
                SizedBox(height: 20.0),
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
                      labelText: 'Password',
                      suffixIcon: Icon(
                        Icons.lock,
                        size: 30.0,
                      ),
                    ),
                    obscureText: true,
                  ),
                SizedBox(height: 50.0),
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
                            'Login In',
                            style: button_primary
                          ),
                        ),
                ),
                SizedBox(height: 15.0),
                Container(
                  alignment: Alignment.center,
                  child: Text('Forgot Credentials?', style: danger),
                )
        ],
      ),
    );
  }
  Widget signupLink(context) {
    return BottomAppBar(
          child: Container(
            height: 61.0,
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => SignupScreen(),
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
                      'Don\'t have an account? ',
                      style: span_primary,
                    ),
                    Text('Signup',style: span,)
                  ],
                ),
              ),
            ),
          ),
    );
  }
    
}