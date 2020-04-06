import 'package:flutter/material.dart';
import 'package:my_sample_project/model/data.dart';
import 'package:my_sample_project/model/speciality.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

String selectedCategorie = "Adults";

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> items = [
    buildPage("0", Colors.red),
    buildPage("1", Colors.blue),
    buildPage("2", Colors.green),
    buildPage("3", Colors.amber),
    buildPage("4", Colors.deepPurple),
    buildPage("5", Colors.teal),
    buildPage("6", Colors.pink),
    buildPage("7", Colors.brown)
  ];
  List<String> categories = ["Adults", "Childrens", "Womens", "Mens"];
  //PageController _controller = PageController(viewportFraction: 0.8);
  List<SpecialityModel> specialities;

  var dropdownValue = 'test';
  String _value;

  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    //_controller = PageController();
    specialities = getSpeciality();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0), // here the desired height
            child: AppBar(
              elevation: 0.0,
            )),
        body: new Container(
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new Container(
                    height: 130.0,
                    decoration: new BoxDecoration(
                      color: Colors.blue,
                      boxShadow: [new BoxShadow(blurRadius: 40.0)],
                      borderRadius: new BorderRadius.vertical(
                          bottom: new Radius.elliptical(
                              MediaQuery.of(context).size.width, 100.0)),
                    ),
                  ),
                  // Container(
                  //   child: Image.asset('assets/images/circular_image.png',
                  //       width: double.infinity,
                  //       colorBlendMode: BlendMode.dstATop,
                  //       fit: BoxFit.cover,
                  //       alignment: Alignment.center),
                  // ),
                  new Container(
                    child: new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            Expanded(
                              flex: 10,
                              child: ListTile(
                                title: Text(
                                  'Aleena',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Proxima',
                                      color: Colors.white),
                                ),
                                subtitle: Text(
                                  'Good Morning',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/person4.png'),
                                ),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '29 February, Friday',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 180,
                          child: SizedBox(
                            height: 180,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: PageView.builder(
                                     onPageChanged: (int index) {
                                      _currentPageNotifier.value = index;
                                    },
                                     controller: PageController(viewportFraction: 0.9),
                                    itemCount: 2,
                                    physics: ClampingScrollPhysics(),
                                  //  controller: _controller,
                                    scrollDirection: Axis.horizontal,


                                    itemBuilder: (context, i) {


                                            return SpecialistTile(
                                              imgAssetPath: specialities[i]
                                                  .imgAssetPath,
                                              speciality: specialities[i]
                                                  .speciality,
                                              noOfDoctors: specialities[i]
                                                  .noOfDoctors,
                                              backColor: specialities[i]
                                                  .backgroundColor,
                                            );
                                      //     }),





                                    }






                                 //   children: <Widget>[






                                      // ListView.builder(
                                      //     itemCount: specialities.length,
                                      //     //shrinkWrap: true,
                                      //   //  physics: ClampingScrollPhysics(),
                                      //     scrollDirection: Axis.horizontal,
                                      //     itemBuilder: (context, index) {
                                      //       //  _currentPageNotifier.value = index-1;

                                      //       return SpecialistTile(
                                      //         imgAssetPath: specialities[index]
                                      //             .imgAssetPath,
                                      //         speciality: specialities[index]
                                      //             .speciality,
                                      //         noOfDoctors: specialities[index]
                                      //             .noOfDoctors,
                                      //         backColor: specialities[index]
                                      //             .backgroundColor,
                                      //       );
                                      //     }),
                                    //],

                                    // children: items,
                                    // controller: _controller,
                                  ),
                                  
                                ),
                                CirclePageIndicator(
                                  selectedDotColor: Colors.blue,
                                  itemCount: specialities.length,
                                  currentPageNotifier: _currentPageNotifier,
                                )
                              ],
                            ),
                          ),
                          
                        ),
                        new Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            width: double.infinity,
                            child: new Card(
                                elevation: 10.0,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Column(
                                            children: <Widget>[
                                             
                                              new Row(
                                                
                                                children: <Widget>[
                                                  
                                                  Image.asset(
                                                      'assets/images/down-arrow.png',
                                                      height: 20,
                                                      width: 20),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Total Income",
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "\$ ${246.toString()}",
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  fontFamily: 'Proxima',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          new Column(
                                            children: <Widget>[
                                              SizedBox(
                                                child: new Container(
                                                  color: Colors.grey,
                                                ),
                                                height: 70.00,
                                                width: 1.00,
                                              )
                                            ],
                                          ),
                                          new Column(children: <Widget>[
                                            new Row(
                                                children: <Widget>[
                                                  Image.asset(
                                                      'assets/images/up-arrow.png',
                                                      height: 20,
                                                      width: 20),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Total Expense",
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ],
                                              ),
                                            SizedBox(height: 10),
                                            Text(
                                              "\$ ${246.toString()}",
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'Proxima',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ])

                                          // new Expanded(
                                          //   child: Column(
                                          //     mainAxisAlignment:
                                          //         MainAxisAlignment
                                          //             .spaceBetween,
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.center,
                                          //     children: <Widget>[
                                          //       Text(
                                          //         'Total Income',
                                          //         style: TextStyle(
                                          //           fontSize: 18,
                                          //           color: Colors.black,
                                          //           fontWeight: FontWeight.w500,
                                          //         ),
                                          //       ),
                                          //       Text(
                                          //         "${1 > 0 ? "" : "-"} \$ ${200.toString()}",
                                          //         style: TextStyle(
                                          //           fontSize: 22,
                                          //           color: Colors.black,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       )
                                          //     ],
                                          //   ),
                                          // ),
                                          // SizedBox(
                                          //   height: 100,
                                          //   width: 1.0,
                                          //   child: new Container(
                                          //     color: Colors.black38,
                                          //   ),
                                          // ),
                                          // new Expanded(
                                          //   child: Column(
                                          //     mainAxisAlignment:
                                          //         MainAxisAlignment
                                          //             .spaceBetween,
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.center,
                                          //     children: <Widget>[
                                          //       Text(
                                          //         'Total Income',
                                          //         style: TextStyle(
                                          //           fontSize: 18,
                                          //           color: Colors.black,
                                          //           fontWeight: FontWeight.w500,
                                          //         ),
                                          //       ),
                                          //       Text(
                                          //         "${1 > 0 ? "" : "-"} \$ ${200.toString()}",
                                          //         style: TextStyle(
                                          //           fontSize: 22,
                                          //           color: Colors.black,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       )
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))),
                        new Container(
                          margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          width: double.infinity,
                          child: new Card(
                            elevation: 10.0,
                            child: new Column(
                              children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: new Column(
                                      children: <Widget>[
                                        Text(
                                          "Your Spending",
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: DropdownButton<String>(
                                      items: [
                                        DropdownMenuItem<String>(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.filter_1),
                                              Text('Item 1'),
                                            ],
                                          ),
                                          value: 'one',
                                        ),
                                        DropdownMenuItem<String>(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.filter_2),
                                              Text('Item 2'),
                                            ],
                                          ),
                                          value: 'two',
                                        ),
                                        DropdownMenuItem<String>(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.filter_3),
                                              Text('Item 3'),
                                            ],
                                          ),
                                          value: 'three',
                                        ),
                                      ],
                                      isExpanded: false,
                                      onChanged: (String value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      },
                                      hint: Text(
                                        'Last Month               ',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      value: _value,
                                      underline: Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey))),
                                      ),
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      iconEnabledColor: Colors.black,
                                      iconSize: 30.0,
                                      //        iconDisabledColor: Colors.grey,
                                      icon:
                                          new Icon(Icons.keyboard_arrow_down)),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    "\$ ${246.toString()}",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Proxima',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: new Container(
                                      margin:
                                          EdgeInsets.fromLTRB(20, 0, 20, 20),
                                      child: MaterialButton(
                                        onPressed:
                                            () {}, //since this is only a UI app
                                        child: Text(
                                          'See Transactions',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Proxima',
                                          ),
                                        ),
                                        color: Colors.blue,
                                        elevation: 0,
                                        minWidth: 400,
                                        height: 50,
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        new Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            width: double.infinity,
                            child: new Card(
                              elevation: 10.0,
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Total Budget',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Proxima',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "\$ ${400.toString()}",
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.blue,
                                              fontFamily: 'Proxima',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      ),
                                      new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new Column(
                                            children: <Widget>[
                                              Text("Spent"),
                                              SizedBox(height: 10),
                                              Text("350",
                                                  style: TextStyle(
                                                      color: Colors.indigo)),
                                            ],
                                          ),
                                          new Column(
                                            children: <Widget>[
                                              Text("Left"),
                                              SizedBox(height: 10),
                                              Text("50",
                                                  style: TextStyle(
                                                      color: Colors.indigo)),
                                            ],
                                          ),
                                          new Column(
                                            children: <Widget>[
                                              CircularPercentIndicator(
                                                radius: 50.0,
                                                lineWidth: 2.0,
                                                percent: 1.0,
                                                center: new Text("100%"),
                                                progressColor: Colors.green,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            )),
                        new Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            width: double.infinity,
                            child: new Card(
                                elevation: 10.0,
                                color: Colors.lightGreen,
                                child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Total Budget',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Proxima',
                                              ),
                                            ),
                                            Text(
                                              "\$ ${25.toString()}",
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.black,
                                                fontFamily: 'Proxima',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1,
                                          width: double.infinity,
                                          child: new Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 10, 10, 0),
                                            color: Colors.black38,
                                          ),
                                        ),
                                        new Container(
                                            child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '14 March 2020',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Proxima',
                                              ),
                                            ),
                                            Text(
                                              "Credit Card",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Proxima',
                                              ),
                                            ),
                                          ],
                                        )),
                                      ],
                                    )))),
                        new Container(
                            margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            width: double.infinity,
                            child: new Card(
                              elevation: 10.0,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Your Favourite Budget',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Proxima',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${"See All Budget"} \> ",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.blue,
                                            fontFamily: 'Proxima',
                                          ),
                                        ),
                                      ],
                                    ),
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 20.00,
                                        ),
                                        Text("Food"),
                                        SizedBox(
                                          height: 10.00,
                                        ),
                                        LinearProgressIndicator(
                                          backgroundColor: Colors.grey,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Colors.indigoAccent,
                                          ),
                                          value: 0.8,
                                        ),
                                        SizedBox(
                                          height: 10.00,
                                        ),
                                        new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Spent 210',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Proxima',
                                              ),
                                            ),
                                            Text(
                                              "${"Left 30"}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                                fontFamily: 'Proxima',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class ProgressIndicatorDemo extends StatefulWidget {
  @override
  _ProgressIndicatorDemoState createState() =>
      new _ProgressIndicatorDemoState();
}

class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    // controller = AnimationController(
    //     duration: const Duration(milliseconds: 2000), vsync: this);
    // animation = Tween(begin: 0.0, end: 1.0).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //       // the state that has changed here is the animation object’s value
    //     });
    //   });
    //controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      child: LinearProgressIndicator(
        value: animation.value,
      ),
    ));
  }
}

Widget colorCard(
    String text, double amount, int type, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 15, right: 15),
    padding: EdgeInsets.all(15),
    height: 100,
    width: _media.width / 2 - 25,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 16,
              spreadRadius: 0.2,
              offset: Offset(0, 8)),
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "${type > 0 ? "" : "-"} \$ ${amount.toString()}",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}

class SpecialistTile extends StatelessWidget {
  String imgAssetPath;
  String speciality;
  int noOfDoctors;
  Color backColor;
  SpecialistTile(
      {@required this.imgAssetPath,
      @required this.speciality,
      @required this.noOfDoctors,
      @required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 280,
    
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: new ExactAssetImage(imgAssetPath),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Account Balance',
                style: TextStyle(
                    fontSize: 12, fontFamily: 'Proxima', color: Colors.white),
              ),
              Text(
                'Debit Card',
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Proxima', color: Colors.white),
              ),
            ],
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "\$ ${2145.toString()}",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'ProximaBold',
                    color: Colors.white),
              ),
            ],
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                '5123 4567 890 3424',
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Proxima', color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildPage(String text, Color color) {
  return Padding(
    padding: EdgeInsets.all(12),
    child: Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 42, color: Colors.white),
        ),
      ),
    ),
  );
}
