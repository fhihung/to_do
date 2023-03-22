import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../models/tasks.dart';
import 'package:intl/intl.dart';
import '../main.dart';

class CompletedTasksScreen extends StatelessWidget {
  final List<Tasks> completedTasks;

  CompletedTasksScreen(this.completedTasks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Completed Tasks',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: 400,
        child: completedTasks.isEmpty
            ? Column(
                children: [
                  Text(
                    'No completed tasks yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: Container(
                      height: 80,
                      child: ListTile(
                        title: Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            completedTasks[index].title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        subtitle: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${completedTasks[index].notes}',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                DateFormat('dd/MM/yyyy')
                                    .format(completedTasks[index].deadline),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: completedTasks.length,
              ),
      ),
    );
  }
}
