import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
var formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie
};

class Expense {
  Expense({
    required this.date,
    required this.amount,
    required this.title,
    required this.category,
  }) : id = uuid
            .v4(); //Usage of the uuid package for the dynamic String id using Initializer list

  final String id; // for dynamic String id using UUID package
  final DateTime date;
  final double amount;
  final String title;
  final Category
      category; //Enums type of category with fixed type/value for enums

  //For accessing the formatted date
  String get formattedDate {
    return formatter.format(date);
  }
}
