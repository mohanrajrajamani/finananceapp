
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>DashboardPageState();
  
}

class DashboardPageState extends State {
  int _selectedTabIndex = 0; 

  List _pages = [
    Text("Home"), 
    Text("Search"), 
    Text("Cart"), 
    Text("Account"), 
  ]; 

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index; 
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("codesundar"), backgroundColor: Colors.lightBlue[900]), 
      body: Center(child: _pages[_selectedTabIndex]), 
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _selectedTabIndex, 
        onTap: _changeIndex,  
        type: BottomNavigationBarType.fixed, 
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
           title: Text("Home")), 
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")), 
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text("Cart")), 
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("My Account")), 
        ], 
      ), 
    ); 
  }
}