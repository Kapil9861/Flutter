import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

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
}
