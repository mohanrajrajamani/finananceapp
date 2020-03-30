import 'package:flutter/material.dart';

class SignInOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage('assets/images/login_finance.jpg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topRight)),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                        child: Text('Welcome Back',
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            style:
                                TextStyle(fontSize: 32, 
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ProximaBold',
                                color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text('Login to your account',
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'Proxima',
                               fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      )
              ],
            ),
            height: 350.0,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.blue.withOpacity(0.2),
                      Colors.blue,
                    ],
                    stops: [
                      0.0,
                      1.0
                    ])),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 270),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(23, 0, 23, 23),
              child: ListView(
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: 165,
                      height: 165,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Proxima'),
                        decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.person_outline),
                            labelStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      obscureText: true,
                      style:
                          TextStyle(color: Colors.black, fontFamily: 'Proxima'),
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password ?',
                            style: TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontSize: 14,
                                fontFamily: 'Proxima',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      onPressed: () {}, //since this is only a UI app
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Proxima',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.blue,
                      elevation: 0,
                      minWidth: 400,
                      height: 60,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
