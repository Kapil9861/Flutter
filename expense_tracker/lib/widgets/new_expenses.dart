import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});
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
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void _openDatePicker() {
    DateTime now = DateTime.now();
    DateTime first =
        DateTime(now.year - 1, now.month, now.day); //exactly a year
    showDatePicker(
      context: context,
      firstDate: first,
      lastDate: DateTime(now.year, now.month, now.day + 7),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
              const Text("Selected Date:"),
              IconButton(
                  onPressed: _openDatePicker,
                  icon: const Icon(Icons.calendar_month))
            ],
          ),
          Expanded(
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    }, //for manual approach _saveExpense,
                    child: const Text('Add Expense'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
