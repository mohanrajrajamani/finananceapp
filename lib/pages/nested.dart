import 'package:flutter/material.dart';

class Nested extends StatelessWidget {


 List<String> subjectList = new List<String>();
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              child: ListView(
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
                  // _displayDialog(context);
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
                  // _displayMonth(context);
                },
                decoration: new InputDecoration(
                    hintText: 'Select Month',
                    suffixIcon: Icon(Icons.keyboard_arrow_down)),
              ),
              ListView.builder(
                                itemCount: 100,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: Column(children: <Widget>[
                                      new Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 16, 20, 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Text("w wswjsbwbdwbdjbwjdbw",
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.blue,
                                                )),
                                          ],
                                        ),
                                      ),
                                      // new Column(
                                      //     children: getContestsSubList(
                                      //         subjectList[index].topicNameList))
                                    ]),
                                  );
                                })
            ],
          ))
        ],
      ),
      // child: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: <Widget>[
      //     Expanded(
      //       child: ListView.builder(
      //           shrinkWrap: true,
      //           itemCount: 123,
      //           itemBuilder: (BuildContext context, int index) {
      //             return Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: <Widget>[
      //                 Text('Parent'),
      //                 ListView.builder(
      //                     itemCount: 2,
      //                     physics: ClampingScrollPhysics(),
      //                     shrinkWrap: true,
      //                     itemBuilder: (BuildContext context, int index) {
      //                       return Text('Child');
      //                     }),
      //               ],
      //             );
      //           }),
      //     )
      //   ],
      // ),
    );
  }
}
