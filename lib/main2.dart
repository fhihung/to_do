import 'package:flutter/material.dart';
import 'package:todocpy/widgets/new_task.dart';
import './widgets/completed_task.dart';
import 'widgets/task_list2.dart';
import 'models/tasks.dart';

void main() => runApp(MyApp());

// Class ban đầu
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks List',
      theme: ThemeData(
        useMaterial3: true,
        // primarySwatch: Colors.purple,
        // accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        // textTheme: ThemeData.light().textTheme.copyWith(
        //     // headline6: TextStyle(
        //     //   fontFamily: 'OpenSans',
        //     //   fontWeight: FontWeight.bold,
        //     //   fontSize: 18,
        //     // ),
        //     button: TextStyle(color: Colors.black)),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tasks> completedTasks = [];
  final List<Tasks> _userTasks = [
    Tasks(
      title: 'New Shoes',
      notes: 'mothaiba456ákddkkkskaksak',
      deadline: DateTime.now(),
    ),
    // Tasks(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   notes: 16.53,
    //   deadline DateTime.now(),
    // ),
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

  void _startAddNewTransaction(BuildContext ctx) {
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

  // void _deleteTransaction(String title) {
  //   setState(() {
  //     _userTasks.removeWhere((tx) {
  //       return tx.title == title;
  //     });
  //   });
  // }

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
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Chart(_recentTransactions),
            TaskList(
              _userTasks,
            ),
          ],
        ),
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
                    builder: (context) => CompletedTasksScreen(_userTasks),
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
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
