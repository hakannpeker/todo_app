import 'package:flutter/material.dart';

import '../../feature/model/tasks_model.dart';
import 'tasks_card.dart';

class TaskListview extends StatelessWidget {
  const TaskListview({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Tasks> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          var task = tasksList[index];
          return TasksCard(tasksList: tasksList, task: task);
        },
      ),
    );
  }
}

