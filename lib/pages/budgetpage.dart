import 'package:flutter/material.dart';

class BudgetListPage extends StatefulWidget {
  @override
  BudgetListPageState createState() => new BudgetListPageState();
}

class BudgetListPageState extends State<BudgetListPage> {
  List<String> subjectList = new List<String>();
  // List<String> androidTopic = new List<String>();
  // List<String> javaTopic = new List<String>();
  // List<String> flutterTopic = new List<String>();

  @override
  initState() {
    super.initState();
    subjectList = new List<String>();

    subjectList.add('Food');
    subjectList.add('HouseHold');
    subjectList.add('Utilities');
  }

  @override
  Widget build(BuildContext context) {
    return new ScaffoldWrapper(
      title: 'StickyHeader Flutter Tutorial',
      child: new ListView.separated(
        itemCount: subjectList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(16,0,16,0),
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.00,
              ),
              Text(subjectList[index]),
              SizedBox(
                height: 10.00,
              ),
              LinearProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.indigoAccent,
                ),
                value: 0.8,
              ),
              SizedBox(
                height: 10.00,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
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
          ));
        }, separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },

      ),
    );
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
      appBar: new PreferredSize(
        preferredSize: new Size.fromHeight(kToolbarHeight),
        child: new Hero(
          tag: 'app_bar',
          child: new AppBar(
            title: new Align(
              child: Text(
                "Budget",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Proxima',
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
            elevation: 0.0,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
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
