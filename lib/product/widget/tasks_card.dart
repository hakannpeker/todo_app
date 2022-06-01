import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/tasks_bloc/tasks_bloc.dart';
import '../../feature/model/tasks_model.dart';

class TasksCard extends StatelessWidget {
  const TasksCard({
    Key? key,
    required this.tasksList,
    required this.task,
  }) : super(key: key);

  final List<Tasks> tasksList;
  final Tasks task;

  void _removeOrDeleteTask(BuildContext context, Tasks tasks) {
    tasks.isDeleted! ? context.read<TasksBloc>().add(DeleteTask(tasks: tasks)) : context.read<TasksBloc>().add(RemoveTask(tasks: tasks));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(
            task.title,
            style: TextStyle(decoration: task.isDone! ? TextDecoration.lineThrough : null),
          ),
          subtitle: Text(task.description),
          trailing: _checkBoxButton(context),
          onLongPress: () => _removeOrDeleteTask(context, task)),
    );
  }

  Checkbox _checkBoxButton(BuildContext context) {
    return Checkbox(
        value: task.isDone,
        onChanged: (value) {
          context.read<TasksBloc>().add(UpdateTask(tasks: task));
        });
  }
}
