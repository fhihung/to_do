import 'package:flutter/material.dart';
import '../main.dart';
import '../models/tasks.dart';
import './completed_task.dart';
import './task_list.dart';
import './new_task.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tasks> completedTasks = [];
  //demo task
  final List<Tasks> _userTasks = [
    Tasks(
      title: 'New Shoes',
      notes: 'Buy a new Nike\'s shoes',
      deadline: DateTime.now(),
    ),
  ];

  void _addNewTask(String txTitle, String txnotes, DateTime chosenDate) {
    final newTx = Tasks(
      title: txTitle,
      notes: txnotes,
      deadline: chosenDate,
    );

    setState(() {
      _userTasks.add(newTx);
    });
  }

  void _startAddNewTask(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTask(_addNewTask),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tasks List',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTask(context),
          ),
        ],
      ),
      //gọi đến Class tasklist biến truyền vào là 1 list tên là userTask
      body: TaskList(
        _userTasks,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.check_box),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CompletedTasksScreen(TaskListState.completedTasks),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTask(context),
      ),
    );
  }
}
