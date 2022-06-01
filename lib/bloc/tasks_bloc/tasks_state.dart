part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Tasks> allTasks;
  final List<Tasks> removedTasks;
  const TasksState({
    this.allTasks = const <Tasks>[],
    this.removedTasks = const <Tasks>[],
  });

  @override
  List<Object> get props => [allTasks,removedTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),

    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Tasks>.from(map['allTasks']?.map((x) => Tasks.fromMap(x))),
      removedTasks: List<Tasks>.from(map['removedTasks']?.map((x) => Tasks.fromMap(x))),

    );
  }
}
