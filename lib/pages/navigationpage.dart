import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_sample_project/pages/accountpage.dart';
import 'package:my_sample_project/pages/budgetaccountspage.dart';
import 'package:my_sample_project/pages/dashboardpage.dart';
import 'package:my_sample_project/pages/reportpage.dart';



class NavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NavigationPageState();
}

class NavigationPageState extends State {

  final GlobalKey<State> _key = GlobalKey();
  
  int _selectedTabIndex = 0;
  

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: _selectedTabIndex != 0,
            child: new TickerMode(
              enabled: _selectedTabIndex == 0,
              child: new MaterialApp(home: new DashboardPage(
                  key: _key,
                function: methodInParent,
              )),
            ),
          ),
          new Offstage(
            offstage: _selectedTabIndex != 1,
            child: new TickerMode(
              enabled: _selectedTabIndex == 1,
              child: new MaterialApp(home: new Accountpage()),
            ),
          ),
           new Offstage(
            offstage: _selectedTabIndex != 2,
            child: new TickerMode(
              enabled: _selectedTabIndex == 2,
              child: new MaterialApp(home: new BudgetAccountpage()),
            ),
          ),
           new Offstage(
            offstage: _selectedTabIndex !=3,
            child: new TickerMode(
              enabled: _selectedTabIndex == 3,
              child: new MaterialApp(home: new ReportPage()),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/dashboard_icon.png"),
                color: _selectedTabIndex == 0 ? Colors.white : Colors.white54,
              ),
              title: Text(
                'Dashboard',
                style: TextStyle(
                    fontSize: 10.0,
                    color:
                        _selectedTabIndex == 0 ? Colors.white : Colors.white54),
              )),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/account_icon.png"),
                color: _selectedTabIndex == 1 ? Colors.white : Colors.white54,
              ),
              title: Text(
                'Account',
                style: TextStyle(
                    fontSize: 10.0,
                    color:
                        _selectedTabIndex == 1 ? Colors.white : Colors.white54),
              )),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/budget_icon.png"),
                  color:
                      _selectedTabIndex == 2 ? Colors.white : Colors.white54),
              title: Text(
                'Budget',
                style: TextStyle(
                    fontSize: 10.0,
                    color:
                        _selectedTabIndex == 2 ? Colors.white : Colors.white54),
              )),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/report_icon.png"),
                color: _selectedTabIndex == 3 ? Colors.white : Colors.white54,
              ),
              title: Text(
                'Report',
                style: TextStyle(
                    fontSize: 10.0,
                    color:
                        _selectedTabIndex == 3 ? Colors.white : Colors.white54),
              ))
        ],
      ),
    );
  }

   methodInParent() => _changeIndex(1);
  
}

