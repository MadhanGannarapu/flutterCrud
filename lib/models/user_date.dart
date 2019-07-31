import 'package:flutter/foundation.dart';

class UsersData {
  final int id;
  final String name;
  final double amount;
  final DateTime date;

  UsersData(
      {@required this.id,
      @required this.name,
      @required this.amount,
      @required this.date}); //Constructor
}
