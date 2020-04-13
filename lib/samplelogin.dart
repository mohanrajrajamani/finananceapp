import 'package:flutter/material.dart';
import 'package:my_sample_project/utils/authutils.dart';
import 'package:my_sample_project/utils/networkutils.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';




class MyHomePage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage1> {
  TextEditingController _nameController, _passWordController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences _sharedPreferences;
  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    print('callijg-----------------------------');
    _nameController = new TextEditingController(text: 'lebanadmin@littlemaster.com');
    _passWordController = new TextEditingController(text: '!Q2w3e4r');
  }

  void _authenticateUser() async {
    var responseJson = await NetworkUtils.authenticateUser(
        _nameController.text,
        _passWordController.text);
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

  void _loginCommand() {
    String _name = _nameController.text;
    String _password = _passWordController.text;
    SnackBar snackbar;
    // This is just a demo, so no actual login here.
    if (!_name.isEmpty) {
      if (!_password.isEmpty) {
        pr.show();
        _authenticateUser();
      } else {
        snackbar = SnackBar(
          content: Text('Please enter the password'),
        );
      }
    } else {
      snackbar = SnackBar(
        content: Text('Please enter the name'),
      );
    }

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(message: 'Please wait...');

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Login"),
          elevation: 10.0,
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                new Container(
                    padding: EdgeInsets.all(16.0),
                    child: new TextField(
                      controller: _nameController,
                      decoration: new InputDecoration(labelText: 'Name'),
                    )),
                new Container(
                    padding: EdgeInsets.all(16.0),
                    child: new TextField(
                      controller: _passWordController,
                      decoration: new InputDecoration(labelText: 'Password'),
                    )),
                new Container(
                    padding: EdgeInsets.all(16.0),
                    child: new RaisedButton(
                      child: new Text("Login"),
                      textColor: Colors.white,
                      color: Colors.red,
                      onPressed: _loginCommand,
                    )),
              ],
            )
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            ));

//    floatingActionButton: new FloatingActionButton(
//        child: Icon(Icons.access_time),
//        onPressed: () {
//          Navigator.of(context).pushNamed('second');
//        }));
  }
}
