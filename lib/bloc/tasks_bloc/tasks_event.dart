part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Tasks tasks;

  const AddTask({
    required this.tasks,
  });
  @override
  List<Object> get props => [tasks];

}

class UpdateTask extends TasksEvent {
  final Tasks tasks;

  const UpdateTask({
    required this.tasks,
  });
  @override
  List<Object> get props => [tasks];

}

class RemoveTask extends TasksEvent {
  final Tasks tasks;

  const RemoveTask({
    required this.tasks,
  });
  @override
  List<Object> get props => [tasks];

}

class DeleteTask extends TasksEvent {
  final Tasks tasks;

  const DeleteTask({
    required this.tasks,
  });
  @override
  List<Object> get props => [tasks];

}