import 'package:flutter/material.dart';
import 'package:my_sample_project/tab/allcatagorizedpage.dart';


class TransactionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransactionsPageState();
}

class TransactionsPageState extends State with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
       title: new Align(
          child: Text(
            "Transactions",
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
            text: "All",
          ),
          new Tab(
           text: "Uncategorized",
          ),
          new Tab(
           text: "Categorize",
          )
        ],
        controller: _tabController,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,),
        bottomOpacity: 1,
      ),
      body: TabBarView(
          children: [
        AllCatagorizedPage(),
        new Text("This is chat Tab View"),
        new Text("This is notification Tab View"),
      ],
      controller: _tabController,),
    );
  }
}
