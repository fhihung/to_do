import 'package:flutter/foundation.dart';

class Tasks {
  // String id;
  String title;
  String notes;
  DateTime deadline;

  Tasks({
    // required this.id,
    required this.title,
    required this.notes,
    required this.deadline,
  });
  bool isOverdue() {
    return deadline.isBefore(DateTime.now());
  }
}
