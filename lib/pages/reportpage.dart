import 'package:flutter/material.dart';
import 'package:my_sample_project/pages/incomevsexpensepage.dart';
import 'package:my_sample_project/tab/allcatagorizedpage.dart';
import 'package:my_sample_project/tab/catagorizedpage.dart';
import 'package:my_sample_project/tab/uncatagorizedpage.dart';


class ReportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReportPageState();
}

class ReportPageState extends State with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
       
       title: new Align(
          child: Text(
            "Report",
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Proxima',
              fontWeight: FontWeight.bold
            ),
          ),
          alignment: Alignment.centerLeft,
        ),
        bottom: TabBar(
          unselectedLabelColor: Colors.white54,
          labelColor: Colors.white,
          tabs: [
          new Tab(
            text: "Income vs Expense",
          ),
          new Tab(
           text: "Cash Flow Statement",
          ),
        
        ],
        controller: _tabController,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,),
        bottomOpacity: 1,
      ),
      body: TabBarView(
          children: [
        IncomevsExpensePage(),
       UncatagorizedPage(),
    
      ],
      controller: _tabController,),
    );
  }
}
