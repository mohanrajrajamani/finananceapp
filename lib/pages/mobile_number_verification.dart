import 'package:flutter/material.dart';
import 'package:my_sample_project/pages/otp_verification_page.dart';


class MobileNumberVerification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MobileNumberVerificationState();
}

class MobileNumberVerificationState extends State {
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
                  //  mainAxisSize:MainAxisSize.min, // <-- notice 'min' here. Important
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset('assets/images/mobile_otp.png'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Text('Enter Your Mobile Number For Verification',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'ProximaBold',
                              color: Colors.black)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 20, 30),
                      child: new Text(
                          "We will send you OTP on this\nPhone Number",
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontSize: 17, fontFamily: 'Proxima')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    new Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 20, 20),
                      child: new Text("Enter Mobile Number",
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontSize: 17, fontFamily: 'Proxima')),
                    ),
                    new Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "+91",
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Flexible(
                            flex: 8,
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "Phone Number",
                              ),
                              onChanged: (value) {
                                // this.phoneNo=value;
                                print(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),Padding(
                    padding: EdgeInsets.fromLTRB(25,20,25,20),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OtpverificationPage()),
                          );         
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
            ));
  }
}
