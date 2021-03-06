import 'package:flutter/material.dart';
import 'package:my_sample_project/pages/budgetpage.dart';
import 'package:my_sample_project/pages/transactionspage.dart';

class BudgetAccountpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BudgetAccountPageState();
}

class BudgetAccountPageState extends State {
  int _groupValue = 1;
  List<String> bankDetails = new List<String>();

  @override
  initState() {
    super.initState();
    bankDetails = new List<String>();

    bankDetails.add('Bank Account');
    bankDetails.add('Credit Card Account');
  
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Align(
          child: Text(
            "Accounts",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'ProximaBold',
            ),
          ),
          alignment: Alignment.centerLeft,
        ),
      ),
      body: new Container(
        child: ListView.builder(
            itemCount: bankDetails.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, position) {
              return GestureDetector(
                  onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BudgetListPage()),
                        )
                      },
                  child: Card(
                    elevation: 10.00,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          padding: EdgeInsets.fromLTRB(24, 10, 24, 0),
                          child: Text(bankDetails[position],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Proxima",
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 10.0),
                        Divider(color: Colors.grey),
                        _myRadioButton(
                          title: "51234 6789 0939 77",
                          value: 1,
                          onChanged: (newValue) =>
                              setState(() => _groupValue = newValue),
                        ),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Proxima',
        ),
      ),
    );
  }
}
