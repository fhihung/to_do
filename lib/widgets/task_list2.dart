import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../models/tasks.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import './completed_task.dart';

class TaskList extends StatefulWidget {
  final List<Tasks> tasks;
  // final Function deleteTx;

  TaskList(this.tasks);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Tasks> completedTasks = [];

  void completeTask(Tasks task) {
    setState(() {
      widget.tasks.remove(task);
      completedTasks.add(task);
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompletedTasksScreen(completedTasks),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: widget.tasks.isEmpty
          ? Column(
              children: [
                Text(
                  'No tasks added yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                bool isOverdue =
                    widget.tasks[index].deadline.isBefore(DateTime.now());
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Container(
                    height: 80,
                    child: ListTile(
                      title: Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          widget.tasks[index].title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      subtitle: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.tasks[index].notes}',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              DateFormat('dd/MM/yyyy')
                                  .format(widget.tasks[index].deadline),
                              style: TextStyle(
                                color: isOverdue ? Colors.red : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.check),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          completeTask(widget.tasks[index]);
                        },
                      ),
                    ),
                  ),
                );
              },
              itemCount: widget.tasks.length,
            ),
    );
  }
}
