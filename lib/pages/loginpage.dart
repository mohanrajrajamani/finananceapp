import 'package:flutter/material.dart';
import 'package:my_sample_project/utils/authutils.dart';
import 'package:my_sample_project/utils/networkutils.dart';
import 'package:my_sample_project/utils/validators/emailvalidator.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignInOneState();
}

class SignInOneState extends State {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _userEmailController;
  TextEditingController _passWordController;
  SharedPreferences _sharedPreferences;
  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    _userEmailController = new TextEditingController();
    _passWordController = new TextEditingController();
  }

  void _authenticateUser() async {
    var responseJson = await NetworkUtils.authenticateUser(
        _userEmailController.text, _passWordController.text);
    print(responseJson);
    pr.hide();
    if (responseJson == null) {
      NetworkUtils.showSnackBar(scaffoldKey, 'Something went wrong!');
    } else if (responseJson == 'NetworkError') {
      NetworkUtils.showSnackBar(scaffoldKey, null);
    } else if (responseJson['errors'] != null) {
      NetworkUtils.showSnackBar(scaffoldKey, 'Invalid Email/Password');
    } else {
      AuthUtils.save(responseJson);
      Navigator.of(context).pushNamed('second');
    }
  }

  

  void _validateUser() {
    String _emailId = _userEmailController.text;
    String _password = _passWordController.text;
    SnackBar snackbar;
    // This is just a demo, so no actual login here.
    if (_emailId.isNotEmpty) {
      if (EmailValidator.isEmail(_emailId)) {
        if (_password.isNotEmpty) {
          pr.show();
          _authenticateUser();
        } else {
          snackbar = SnackBar(
            content: Text('Please enter the password'),
          );
        }
      } else {
        snackbar = SnackBar(
          content: Text('Please enter the valid email ID'),
        );
      }
    } else {
      snackbar = SnackBar(
        content: Text('Please enter the email ID'),
      );
    }

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(message: 'Please wait...');
    return new Scaffold(
      key: scaffoldKey,
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
                      style: TextStyle(
                          fontSize: 32,
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
                        controller: _userEmailController,
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Proxima'),
                        decoration: InputDecoration(
                            labelText: 'Email ID',
                            prefixIcon: Icon(Icons.person_outline),
                            labelStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      controller: _passWordController,
                      obscureText: true,
                      style:
                          TextStyle(color: Colors.black, fontFamily: 'Proxima'),
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 20),
                  //   child: Center(
                  //     child: Container(
                  //       padding: EdgeInsets.symmetric(vertical: 10),
                  //       alignment: Alignment.centerRight,
                  //       child: Text('Forgot Password ?',
                  //           style: TextStyle(
                  //               color: Colors.deepPurpleAccent,
                  //               fontSize: 14,
                  //               fontFamily: 'Proxima',
                  //               fontWeight: FontWeight.w500)),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      onPressed: () {
                        _validateUser();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => MobileNumberVerification()),
                        //   );
                      }, //since this is only a UI app
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
