import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../models/tasks.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import './completed_task.dart';

class TaskList extends StatefulWidget {
  final List<Tasks> tasks;

  TaskList(this.tasks);

  @override
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  static List<Tasks> completedTasks = [];

  void completeTask(Tasks task) {
    setState(() {
      // sẽ xóa task ở trong List tasks
      //sẽ add thêm task vừa xóa vào List completedTasks
      widget.tasks.remove(task);
      completedTasks.add(task);
    });
    //Khi xóa sẽ hiển thị màn hình những task đã hoàn thành
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
      height: 520,
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
          //listview builder kết hợp singlechildscrollview và column
          // chỉ render khi cái phần tử xuất hiện trên màn hình
          : ListView.builder(
              //độ dài của list
              itemCount: widget.tasks.length,
              //
              itemBuilder: (ctx, index) {
                //gọi đến hàm check quá thời hạn
                bool isOverdue =
                    //nếu ngày mà chọn quá hạn thì sẽ return về true
                    widget.tasks[index].deadline.isBefore(DateTime.now());
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
            ),
    );
  }
}
