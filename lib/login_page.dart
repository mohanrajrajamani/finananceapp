import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/login_finance.jpg',
                width: double.infinity, 
                colorBlendMode: BlendMode.dstATop,
                fit: BoxFit.fill),
          ),
           Container(
             margin: EdgeInsets.fromLTRB(0, 300.00, 0, 0),
              height: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                margin: EdgeInsets.all(0),
                elevation: 7.0,
                child: new Container(

              child:
                Image.asset(
                  'assets/images/logo.png',
                  height: 100.0,
                  width: 100.0,
                  
                ),


                )
                
           
                
              ),
            ),
          
        ],
      ),
    );
  }
}
