import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class IncomevsExpensePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IncomeExpensePageState();
}

class Mylist {
  String number;
  int index;
  Mylist({this.number, this.index});
}

class IncomeExpensePageState extends State {
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
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Container(
              child: new Container(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  width: double.infinity,
                  child: new Card(
                      elevation: 1.0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                        child: Column(
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
                              onTap: (){
                                _displayDialog(context);
                              },
                               decoration: new InputDecoration(
                                hintText: 'Select Account',
                                suffixIcon:Icon(Icons.keyboard_arrow_down)
                              ),
                            ),

                            SizedBox(height: 20),
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        new Row(
                                          children: <Widget>[
                                            Text(
                                              "Income",
                                              style: TextStyle(
                                                fontFamily: 'Proxima',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "\$ ${2463.202.toString()}",
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.blue,
                                            fontFamily: 'Proxima',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Row(
                                            children: <Widget>[
                                              // Image.asset(
                                              //     'assets/images/up-arrow.png',
                                              //     height: 20,
                                              //     width: 20),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Expense",
                                                style: TextStyle(
                                                  fontFamily: 'Proxima',
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(
                                            height: 10,
                                          ),
                                          //SizedBox(height: 10),
                                          Text(
                                            "\$ ${2464.11.toString()}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.lightGreen,
                                                fontFamily: 'Proxima',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])
                                  ],
                                ),
                                new Container(
                                  child: CircularPercentIndicator(
                                    backgroundColor: Colors.lightGreen,
                                    radius: 200.0,
                                    lineWidth: 35.0,
                                    percent: 0.5,
                                    center: Text("Income\n    vs\nExpense"),
                                    progressColor: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
