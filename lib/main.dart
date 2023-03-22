import 'package:flutter/material.dart';
import 'package:todocpy/widgets/new_task.dart';
import './widgets/completed_task.dart';
import 'widgets/task_list.dart';
import 'models/tasks.dart';
import './widgets/homepage.dart';

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
