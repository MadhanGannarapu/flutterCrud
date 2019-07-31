import 'package:flutter/material.dart';
import '../models/user_date.dart';
import 'package:intl/intl.dart';

class FormOne extends StatefulWidget {
  @override
  _FormOneState createState() => _FormOneState();
}

class _FormOneState extends State<FormOne> {
  final List<UsersData> _userTransaction = [];

  String titleInput;
  String amountInput;
  DateTime _selectedDate;
  int id = 0;

  _addData() {
    id = id + 1;

    final newTx = UsersData(
        id: id,
        name: titleInput,
        amount: double.parse(amountInput),
        date: _selectedDate);

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  Widget bodyData() => DataTable(
        columns: <DataColumn>[
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Amount")),
          DataColumn(label: Text("Date")),
        ],
        rows: _userTransaction
            .map((tx) => DataRow(cells: <DataCell>[
                  DataCell(Text(tx.name)),
                  DataCell(Text(tx.amount.toString())),
                  DataCell(Text(DateFormat.yMMMd().format(tx.date))),
                ]))
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (val) {
                  titleInput = val;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  amountInput = val;
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Choosen'
                        : 'Picked Date : ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      "Choose Joining Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
              RaisedButton(
                child: Text('Add Employee'),
                color: Colors.blue,
                onPressed: _addData,
              ),
              // Container(
              //   child: Column(
              //       children: _userTransaction.map((tx) {
              //     return Card(
              //       elevation: 15,
              //       child: Text(tx == null
              //           ? 'No Data to display'
              //           : '${tx.id} - ${tx.name} - ${tx.amount} - ${DateFormat.yMMMd().format(tx.date)}'),
              //     );
              //   }).toList()),
              // ),
              Container(
                child: bodyData(), // custom widget
              ),
            ],
          ),
        ),
      ),
    );
  }
}
