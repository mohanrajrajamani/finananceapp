import 'package:flutter/material.dart';

class CashFlowStatementPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CashFlowStatementStatePage();
}

class Mylist {
  String number;
  int index;
  Mylist({this.number, this.index});
}

class CashFlowStatementStatePage extends State {
  List<Subject> subjectList = new List<Subject>();
  List<String> androidTopic = new List<String>();
  List<String> javaTopic = new List<String>();
  List<String> flutterTopic = new List<String>();

  @override
  initState() {
    super.initState();
    subjectList = new List<Subject>();
    androidTopic = new List<String>();
    javaTopic = new List<String>();
    flutterTopic = new List<String>();

    androidTopic.add('Sea Cafe Restaurant');
    androidTopic.add('New Mart');

    javaTopic.add('Metro Restaurant');
    javaTopic.add('The Wegas');

    flutterTopic.add('Payment Received');

    subjectList.add(Subject('Feb 26th, 2019', androidTopic));
    subjectList.add(Subject('Feb 27th, 2019', javaTopic));
    subjectList.add(Subject('Feb 28th, 2019', flutterTopic));
  }

  List<Mylist> nList = [
    Mylist(
      index: 1,
      number: "Bank account",
    ),
    Mylist(
      index: 2,
      number: "Credit Card account",
    ),
  ];

  List<Mylist> month = [
    Mylist(
      index: 1,
      number: "Last Month",
    ),
    Mylist(
      index: 2,
      number: "Last 3 Month",
    ),
    Mylist(
      index: 2,
      number: "Last 6 Month",
    ),
  ];

  int _currentIndex = 1;

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Account'),
            content: Container(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(8.0),
                //map List of our data to the ListView
                children: nList
                    .map((data) => RadioListTile(
                          title: Text("${data.number}"),
                          groupValue: _currentIndex,
                          value: data.index,
                          onChanged: (val) {
                            setState(() {
                              // radioItemHolder = data.number;
                              _currentIndex = data.index;
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  //Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _displayMonth(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Account'),
            content: Container(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(8.0),
                //map List of our data to the ListView
                children: month
                    .map((data) => RadioListTile(
                          title: Text("${data.number}"),
                          groupValue: _currentIndex,
                          value: data.index,
                          onChanged: (val) {
                            setState(() {
                              // radioItemHolder = data.number;
                              _currentIndex = data.index;
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  //Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
      children: <Widget>[
        Card(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 10),
       
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Account",
                        style: TextStyle(
                            fontSize: 18.00,
                            color: Colors.blue,
                            fontFamily: 'Proximabold')),
                    TextField(
                      readOnly: true,
                      // enableInteractiveSelection: false,
                      focusNode: FocusNode(),
                      onTap: () {
                        _displayDialog(context);
                      },
                      decoration: new InputDecoration(
                          hintText: 'Select Account',
                          suffixIcon: Icon(Icons.keyboard_arrow_down)),
                    ),
                    SizedBox(height: 20),
                    Text("Month",
                        style: TextStyle(
                            fontSize: 18.00,
                            color: Colors.blue,
                            fontFamily: 'Proximabold')),
                    TextField(
                      readOnly: true,
                      // enableInteractiveSelection: false,
                      focusNode: FocusNode(),
                      onTap: () {
                        _displayMonth(context);
                      },
                      decoration: new InputDecoration(
                          hintText: 'Select Month',
                          suffixIcon: Icon(Icons.keyboard_arrow_down)),
                    ),
                  ]),
            ),

        ),
       
        Expanded(
            child: ListView.builder(
                itemCount: subjectList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(children: <Widget>[
                      new Container(
                        margin: EdgeInsets.fromLTRB(20, 16, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(subjectList[index].subjectName,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.blue,
                                )),
                          ],
                        ),
                      ),
                      new Column(
                          children: getContestsSubList(
                              subjectList[index].topicNameList))
                    ]),
                  );
                }))
      ],

      //  margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      // width: double.infinity,
    ));
  }

  // @override
  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     body: new Container(
  //       child: Container(
  //         margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
  //         width: double.infinity,
  //         child: new Card(
  //             elevation: 1.0,
  //             child: Padding(
  //                 padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
  //                 child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: <Widget>[
  //                       Text("Account",
  //                           style: TextStyle(
  //                               fontSize: 18.00,
  //                               color: Colors.blue,
  //                               fontFamily: 'Proximabold')),
  //                       TextField(
  //                         readOnly: true,
  //                         // enableInteractiveSelection: false,
  //                         focusNode: FocusNode(),
  //                         onTap: () {
  //                           _displayDialog(context);
  //                         },
  //                         decoration: new InputDecoration(
  //                             hintText: 'Select Account',
  //                             suffixIcon: Icon(Icons.keyboard_arrow_down)),
  //                       ),
  //                       SizedBox(height: 20),
  //                       Text("Month",
  //                           style: TextStyle(
  //                               fontSize: 18.00,
  //                               color: Colors.blue,
  //                               fontFamily: 'Proximabold')),
  //                       TextField(
  //                         readOnly: true,
  //                         // enableInteractiveSelection: false,
  //                         focusNode: FocusNode(),
  //                         onTap: () {
  //                           _displayMonth(context);
  //                         },
  //                         decoration: new InputDecoration(
  //                             hintText: 'Select Month',
  //                             suffixIcon: Icon(Icons.keyboard_arrow_down)),
  //                       ),
  //                       // new ListView.builder(
  //                       //     itemCount: subjectList.length,
  //                       //     itemBuilder: (context, index) {
  //                       //       return Container(
  //                       //         child: Column(children: <Widget>[
  //                       //           new Container(
  //                       //             margin: EdgeInsets.fromLTRB(20, 16, 20, 10),
  //                       //             child: Row(
  //                       //               mainAxisAlignment:
  //                       //                   MainAxisAlignment.spaceBetween,
  //                       //               mainAxisSize: MainAxisSize.max,
  //                       //               children: <Widget>[
  //                       //                 Text(subjectList[index].subjectName,
  //                       //                     style: TextStyle(
  //                       //                       fontSize: 14.0,
  //                       //                       color: Colors.blue,
  //                       //                     )),
  //                       //               ],
  //                       //             ),
  //                       //           ),
  //                       //           // new Column(
  //                       //           //     children: getContestsSubList(
  //                       //           //         subjectList[index].topicNameList))
  //                       //         ]),
  //                       //       );
  //                       //     })
  //                     ]))),
  //       ),
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return new ScaffoldWrapper(
  //     title: 'StickyHeader Flutter Tutorial',
  //     child: new ListView.builder(
  //       itemCount: subjectList.length,
  //       itemBuilder: (context, index) {
  //         return Container(
  //             child: Column(
  //           children: <Widget>[
  //             new Container(
  //               margin: EdgeInsets.fromLTRB(20, 16, 20, 10),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: <Widget>[
  //                   Text(subjectList[index].subjectName,
  //                       style: TextStyle(
  //                         fontSize: 14.0,
  //                         color: Colors.blue,
  //                       )),
  //                 ],
  //               ),
  //             ),
  //             //  new Card(
  //             // color: Colors.white,
  //             new Column(
  //                 children: getContestsSubList(subjectList[index].topicNameList)
  //                 // ],

  //                 // )

  //                 )
  //           ],
  //         ));
  //       },
  //     ),
  //   );
  // }

  List<Widget> getContestsSubList(List<String> studentList) {
    var listWidget = List<Widget>();
    studentList.forEach((listData) {
      listWidget.add(Container(
          child: Card(
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
                margin: EdgeInsets.fromLTRB(20, 16, 20, 10),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      listData,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontFamily: 'Proxima',
                      ),
                    ),
                    Text(
                      "Expense",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Proxima',
                      ),
                    ),
                  ],
                )),
            new Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Food',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Proxima',
                      ),
                    ),
                    Text(
                      "\$ ${246.toString()}",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Proxima',
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 10.0),
            // Divider(color: Colors.grey),
          ],
        ),
      )));
    });
    return listWidget;
  }
}

class ScaffoldWrapper extends StatelessWidget {
  final Widget child;
  final String title;
  const ScaffoldWrapper({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new PreferredSize(
      //   preferredSize: new Size.fromHeight(kToolbarHeight),
      //   // child: new Hero(
      //   //   tag: 'app_bar',
      //   //   child: new AppBar(
      //   //    // title: new Text(title),
      //   //     elevation: 0.0,
      //   //   ),
      //   // ),
      // ),
      body: child,
    );
  }
}

class Subject {
  String subjectName;
  List<String> topicNameList;
  Subject(String subjectName, List<String> topicNameList) {
    this.subjectName = subjectName;
    this.topicNameList = topicNameList;
  }
}
