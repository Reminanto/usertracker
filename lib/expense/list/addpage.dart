import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:usertracker/expense/expense.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? pickedDate;
  Category _selectedCategory = Category.travel;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  void _datepicker(BuildContext context) async {
    final now = DateTime.now();
    final lastYear = DateTime(now.year - 1, now.month, now.day);

    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: lastYear,
      lastDate: now,
    );

    if (selectedDate != null) {
      setState(() {
        pickedDate = selectedDate;
      });
    }
  }

  void _submitData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final isValidAmount = enteredAmount != null && enteredAmount > 0;

    if (_nameController.text.trim().isEmpty ||
        !isValidAmount ||
        pickedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid details"),
          content: const Text('Please enter a valid name, date, and amount.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(Expense(
      name: _nameController.text,
      amount: enteredAmount,
      date: pickedDate!,
      category: _selectedCategory,
    ));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          height: constraints.maxHeight,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
              child: Column(
                children: [
                  if (width >= 600)
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _nameController,
                            maxLength: 50,
                            decoration: const InputDecoration(labelText: 'Name'),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            maxLength: 8,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Amount', prefixText: 'RS'),
                          ),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        TextField(
                          controller: _nameController,
                          maxLength: 50,
                          decoration: const InputDecoration(labelText: 'Name'),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _amountController,
                          maxLength: 8,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Amount', prefixText: 'RS'),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
if(width>=600)Row(

  children: [

Expanded(
                  child: DropdownButton<Category>(
  value: _selectedCategory,
items: Category.values.map((category) {
                                                         return DropdownMenuItem(
                                                           value: category,
                                                           child: Text(category.name.toUpperCase()),
                                                         );
                                                       }).toList(),
                                                       onChanged: (value) {
                                                         if (value != null) {
                                                           setState(() {
                                _selectedCategory = value;
                                                           });
                                                         }
                                                       },
                                                     ),
                             ),

    Text(pickedDate == null
                                ? 'No date selected'
                                : formatter.format(pickedDate!)),
                            Expanded(
                              child: IconButton(
                                onPressed: () => _datepicker(context),
                                icon: const Icon(Icons.calendar_month),
                              ),
                            ),
                            
  ],
)

           else       Row(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        
                          children: [

                             DropdownButton<Category>(
                        value: _selectedCategory,
                        items: Category.values.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedCategory = value;
                            });
                          }
                        },
                      ),
                       Row(  children: [Text(pickedDate == null
                                ? 'No date selected'
                                : formatter.format(pickedDate!)),
                            IconButton(
                              onPressed: () => _datepicker(context),
                              icon: const Icon(Icons.calendar_month),
                            ),] 
                       )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
if(width>=600)Row(children: [
    ElevatedButton(
                        onPressed: _submitData,
                        child: const Text('ADD'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('CANCEL'),
                      ),
],)

           else       Row(
                    children: [
                     
                      ElevatedButton(
                        onPressed: _submitData,
                        child: const Text('ADD'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('CANCEL'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
