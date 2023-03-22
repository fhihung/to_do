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

  final _noteController = TextEditingController();

  void submitData() {
    if (_noteController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredNote = _noteController.text;

    if (enteredTitle.isEmpty || enteredNote.isEmpty || _selectedDate == null) {
      return;
    } else {
      widget.addTx(enteredTitle, enteredNote, _selectedDate);
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                onSubmitted: (_) => submitData,
              ),
              TextField(
                controller: _noteController,
                decoration: InputDecoration(
                  labelText: 'Note',
                ),
                onSubmitted: (_) => submitData,
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Choosen'
                          // Vì Flutter có cái null safety sẽ không cho bất kì biến nào rỗng để xảy ra ít lỗi nhất
                          : 'Picked Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}'),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.purple),
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: submitData, child: Text('Add Task'))
            ]),
      ),
    );
  }
}
