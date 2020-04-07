import 'package:flutter/material.dart';
import 'package:my_sample_project/pages/navigationpage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpverificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OtpverificationPageState();
}

class OtpverificationPageState extends State {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: new Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
                  child: Text("Verification Code",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Proxima',
                          color: Colors.black)),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 20),
                  child: new Text(
                      "Enter the OTP send to your\nmobile Number XXXXX898590",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 17, fontFamily: 'Proxima')),
                ),
                SizedBox(
                  height: 20,
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.fromLTRB(30,0,30,20),
                        child: PinCodeTextField(
                        length: 4,
                        activeColor: Colors.grey,
                        selectedColor: Colors.grey,
                        selectedFillColor: Colors.grey,
                        obsecureText: false,
                        animationType: AnimationType.fade,
                        shape: PinCodeFieldShape.underline,
                        animationDuration: Duration(milliseconds: 300),
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        onChanged: (value) {

                        },
                      ),

                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NavigationPage()),
                          );         
                       
                    }, //since this is only a UI app
                    child: Text(
                      'VERIFY OTP',
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
        ));
  }
}
