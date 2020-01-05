import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 99.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "Gasoline", amount: 54.99, date: DateTime.now()),
//    Transaction(
//        id: "t3", title: "House expenses", amount: 53.99, date: DateTime.now())
  ];
  final titleController = TextEditingController();
  final amountController = TextEditingController();
//  String titleInput;
//  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Card(
              elevation: 5,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(labelText: 'Title'),
                          controller: titleController,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Amount'),
                          controller: amountController,
                        ),
                        FlatButton(
                            child: Text('Add Transaction'),
                            textColor: Colors.purple,
                            onPressed: () {
                              print(titleController.text);
                            })
                      ]))),
          Column(
              children: transactions.map((tx) {
            return Card(
                child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purpleAccent, width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text('\$ ${tx.amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(color: Colors.blueGrey),
                    )
                  ],
                )
              ],
            ));
          }).toList())
        ],
      ),
    );
  }
}
