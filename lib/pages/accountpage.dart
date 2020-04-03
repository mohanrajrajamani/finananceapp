import 'package:flutter/material.dart';
import 'package:my_sample_project/pages/transactionspage.dart';

class Accountpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AccountPageState();
}

class AccountPageState extends State {
  int _groupValue = 1;

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
            itemCount: 2,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, position) {
              return GestureDetector(
                  onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransactionsPage()),
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
                          child: Text("Bank Account",
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
