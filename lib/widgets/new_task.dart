import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTask extends StatefulWidget {
  final Function addTx;

  NewTask(this.addTx);

  @override
  State<NewTask> createState() => _NewTaskState();
}

DateTime? _selectedDate;

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = _amountController.text;

    if (enteredTitle.isEmpty ||
        enteredAmount.isEmpty ||
        _selectedDate == null) {
      return;
    } else {
      widget.addTx(enteredTitle, enteredAmount, _selectedDate);
      Navigator.of(context).pop();
    }
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2030))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: <
            Widget>[
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            onSubmitted: (_) => submitData,
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            onSubmitted: (_) => submitData,
          ),
          Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date Choosen'
                      : 'Picked Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}'),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(foregroundColor: Colors.purple),
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: submitData, child: Text('Add Transaction'))
        ]),
      ),
    );
  }
}
