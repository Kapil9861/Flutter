import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:google_fonts/google_fonts.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.addExpense});
  final Function(Expense expense) addExpense;

  @override
  State<NewExpenses> createState() {
    // done State<StatefulWidget> createState()
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpenses> {
  //This is the traditional or the manual approach to store or manipulate data
  // String expenseTitle = '';

  // void _addNewExpenses(String input) {
  //   expenseTitle = input;
  // }

  // void _saveExpense() {
  //   print(expenseTitle);
  // }
  DateTime? _selectedDate;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void _openDatePicker() async {
    DateTime now = DateTime.now();
    DateTime first =
        DateTime(now.year - 1, now.month, now.day); //exactly a year
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: first,
      lastDate: DateTime(now.year, now.month, now.day + 7),
    );
    setState(
      () => _selectedDate = pickedDate,
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _saveNewExpense() {
    final expenseTitle = titleController.text;
    final amount = double.tryParse(amountController.text);
    if (expenseTitle.isEmpty ||
        amount == null ||
        amount <= 0 ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              "Invalid Input!",
              style: TextStyle(color: kColorScheme.onPrimaryContainer),
            ),
            content: Text(
              "Please provide input with appropriate title and select date with amount greater than 0 Rs.",
              style: GoogleFonts.lato(fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Understood!",
                    style: GoogleFonts.lato(
                      fontSize: 20,
                    )),
              )
            ],
          );
        },
      );
      return;
    }
    widget.addExpense(Expense(
        date: _selectedDate!,
        amount: amount,
        title: expenseTitle,
        category: _selectedItem));
    Navigator.pop(context);
  }

  Category _selectedItem = Category.leisure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        //Used column to allign multiple rows inside it and this imprtant concept that I miss
        children: [
          TextField(
            controller: titleController,
            // onChanged:for manual approach _addNewExpenses,
            autocorrect: false,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$",
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                _selectedDate == null
                    ? "No Date Selected"
                    : formatter.format(_selectedDate!),
              ),
              IconButton(
                  onPressed: _openDatePicker,
                  icon: const Icon(Icons.calendar_month))
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              DropdownButton(
                  value: _selectedItem,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 70, 68, 68)),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedItem = value;
                    });
                  }),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ElevatedButton(
                  onPressed:
                      _saveNewExpense, //for manual approach _saveExpense,
                  child: const Text('Add Expense'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
