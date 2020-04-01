import 'package:flutter/material.dart';
import 'package:my_sample_project/data.dart';
import 'package:my_sample_project/speciality.dart';

String selectedCategorie = "Adults";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["Adults", "Childrens", "Womens", "Mens"];

  List<SpecialityModel> specialities;

  var dropdownValue = 'test';
  String _value;

  @override
  void initState() {
    super.initState();

    specialities = getSpeciality();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(10.0), // here the desired height
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
                          height: 200,
                          child: ListView.builder(
                              itemCount: specialities.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return SpecialistTile(
                                  imgAssetPath:
                                      specialities[index].imgAssetPath,
                                  speciality: specialities[index].speciality,
                                  noOfDoctors: specialities[index].noOfDoctors,
                                  backColor:
                                      specialities[index].backgroundColor,
                                );
                              }),
                        ),
                        new Container(
                            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                            width: double.infinity,
                            child: new Card(
                                elevation: 10.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          new Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'Total Income',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "${1 > 0 ? "" : "-"} \$ ${200.toString()}",
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 100,
                                            width: 1.0,
                                            child: new Container(
                                              color: Colors.black38,
                                            ),
                                          ),
                                          new Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'Total Income',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "${1 > 0 ? "" : "-"} \$ ${200.toString()}",
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // new Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.start,
                                      //   children: <Widget>[
                                      //     Text(
                                      //       'Account Balance',
                                      //       style: TextStyle(
                                      //           fontSize: 12,
                                      //           fontFamily: 'Proxima',
                                      //           color: Colors.blue),
                                      //     ),
                                      //     Text(
                                      //       'Total Expenses',
                                      //       style: TextStyle(
                                      //           fontSize: 12,
                                      //           fontFamily: 'Proxima',
                                      //           color: Colors.blue),
                                      //     ),
                                      //   ],
                                      // ),
                                      // new Column(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.center,
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.center,
                                      //   children: <Widget>[
                                      //     SizedBox(
                                      //       height: 50.00,
                                      //       width: 10.00,
                                      //       child: Container(
                                      //         color: Colors.red,
                                      //       ),
                                      //     )
                                      //   ],
                                      // ),
                                      // new Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.start,
                                      //   children: <Widget>[
                                      //     Text(
                                      //       "345",
                                      //       style: TextStyle(
                                      //           fontSize: 26,
                                      //           fontFamily: 'ProximaBold',
                                      //           color: Colors.black),
                                      //     ),
                                      //     Text(
                                      //       "345",
                                      //       style: TextStyle(
                                      //           fontSize: 26,
                                      //           fontFamily: 'ProximaBold',
                                      //           color: Colors.black),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ))),
                        new Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                                        DropdownButton<String>(
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
                                                'Last Month               '),
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
                                            icon: new Icon(
                                                Icons.keyboard_arrow_down)),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        )
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
      width: 320,
      margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: new ExactAssetImage(imgAssetPath),
          fit: BoxFit.none,
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
                "2145",
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

      // Text(
      //   speciality,
      //   style: TextStyle(color: Colors.white, fontSize: 20),
      // ),
      // SizedBox(
      //   height: 1,
      // ),
      // Text(
      //   "$noOfDoctors Doctors",
      //   style: TextStyle(color: Colors.white, fontSize: 13),
      // ),
      // Image.asset(
      //   imgAssetPath,
      //   height: 50,
      //   fit: BoxFit.fitHeight,
      // )
    );
  }
}
