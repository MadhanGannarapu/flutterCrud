import 'package:flutter/material.dart';
import './widgets/displayData.dart';
import './models/user_date.dart';
import './widgets/form1.dart';
import './widgets/form2.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee registration',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool _form1 = false;
  bool _form2 = false;
  _showFormOne() {
    setState(() {
      _form1 = true;
      _form2 = false;
    });
  }

  _showFormTwo() {
    setState(() {
      _form1 = false;
      _form2 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Emp reg"),
        ),
        body: Column(
          children: <Widget>[
            Text(
              'Two ways of passing data',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
            FlatButton(
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Text("First way"),
                  Container(child: _form1 == true ? FormOne() : null),
                ],
              ),
              onPressed: _showFormOne,
            ),
            FlatButton(
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Text("Second way"),
                  Container(child: _form2 == true ? FormTwo() : null),
                ],
              ),
              onPressed: _showFormTwo,
            ),
         
          ],
        ));
  }
}
