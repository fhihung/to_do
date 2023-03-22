// // Hiển thị các tasks cần làm
// class TaskList extends StatefulWidget {
//   final List<Tasks> tasks;
//   final Function deleteTx;

//   TaskList(this.tasks, this.deleteTx);

//   @override
//   State<TaskList> createState() => _TaskListState();
// }

// class _TaskListState extends State<TaskList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 400,
//         child: widget.tasks.isEmpty
//             ? Column(
//                 children: [
//                   Text(
//                     'No tasks added yet',
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               )
//             : ListView.builder(
//                 itemBuilder: (ctx, index) {
//                   bool isOverdue =
//                       widget.tasks[index].deadline.isBefore(DateTime.now());
//                   return Card(
//                     elevation: 5,
//                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//                     child: Container(
//                       height: 80,
//                       child: ListTile(
//                         title: Container(
//                           margin: EdgeInsets.only(top: 5),
//                           child: Text(
//                             widget.tasks[index].title,
//                             style: Theme.of(context).textTheme.titleMedium,
//                           ),
//                         ),
//                         subtitle: Container(
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${widget.tasks[index].notes}',
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                                 Text(
//                                   DateFormat('dd/MM/yyyy')
//                                       .format(widget.tasks[index].deadline),
//                                   style: TextStyle(
//                                     color: isOverdue ? Colors.red : Colors.grey,
//                                   ),
//                                 ),
//                               ]),
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(Icons.delete),
//                           color: Theme.of(context).errorColor,
//                           onPressed: () {
//                             widget.deleteTx(widget.tasks[index].title);
//                           },
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: widget.tasks.length,
//               )
//         // hàm map biến đổi cách phần tử trong tasks thnàh Card, sau đó trả về các phần tử được biến đổi
//         );
//   }
// }