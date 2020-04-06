import 'package:flutter/material.dart';

class AllCatagorizedPage extends StatefulWidget {
  @override
  AllCatagorizedApp createState() => new AllCatagorizedApp();
}

class AllCatagorizedApp extends State<AllCatagorizedPage> {
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

  @override
  Widget build(BuildContext context) {
    return new ScaffoldWrapper(
      title: 'StickyHeader Flutter Tutorial',
      child: new ListView.builder(
          itemCount: subjectList.length,
          itemBuilder: (context, index) {
            return Container(
                child: Column(
              children: <Widget>[
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
              //  new Card(
              // color: Colors.white,
                  new Column(
                     children:
                        getContestsSubList(subjectList[index].topicNameList)
                    // ],

                   // )

                  )
                   
              
              ],
            ));
          },),
    );
  }

  List<Widget> getContestsSubList(List<String> studentList) {
    var listWidget = List<Widget>();
    studentList.forEach((listData) {
      listWidget.add(
        Container(
          child:Card(
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
          )
                
        )
      );
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
