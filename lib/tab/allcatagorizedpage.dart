import 'package:flutter/material.dart';

class AllCatagorizedPage extends StatefulWidget {
  @override
  AllCatagorizedApp createState() => new AllCatagorizedApp();
}

class AllCatagorizedApp extends State<AllCatagorizedPage> {
  final List<int> _listData = List<int>.generate(100, (i) => i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.10),
      body: new Container(
        child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, position) {
            return Container(
                child: Column(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.fromLTRB(20, 16, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Feb 26th, 2019",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ),
                Card(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                        child: Text("Bank Account",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Proxima",
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                    ],
                  ),
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}

