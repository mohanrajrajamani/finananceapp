
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_sample_project/pages/accountpage.dart';
import 'package:my_sample_project/pages/budgetaccountspage.dart';
import 'package:my_sample_project/pages/dashboardpage.dart';


class BottomNavigationPage extends StatefulWidget {
  @override
  BottomNavigationPageState createState() => new BottomNavigationPageState();
}

class BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentIndex = 0;

  final List<Widget> viewContainer = [
    DashboardPage(),
    Accountpage(),
    BudgetAccountpage(),
    BudgetAccountpage(),
  ];

  @override
  Widget build(BuildContext context) {

    void onTabTapped(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return new Scaffold(
     
     body: viewContainer[currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
                  onTap: onTabTapped, // new
          currentIndex: currentIndex,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
          icon:new Icon(Icons.photo),
          title: Text("Photo"),
        ),
        BottomNavigationBarItem(
          icon:new Icon(Icons.video_library),
          title: Text("Video"),
        ),
        BottomNavigationBarItem(
            icon:new Icon(Icons.photo_library),
          title: Text("Album"),
        ), BottomNavigationBarItem(
            icon:new Icon(Icons.photo_library),
          title: Text("Report"),
        )
      ]),
    );
  


  }
}

