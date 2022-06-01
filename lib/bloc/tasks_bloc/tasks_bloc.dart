import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../feature/model/tasks_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        allTasks: List.from(state.allTasks)..add(event.tasks),
        removedTasks: state.removedTasks
      ),
    );
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.tasks;
    final int index = state.allTasks.indexOf(task);

    List<Tasks> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false ? allTasks.insert(index, task.copyWith(isDone: true)) : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TasksState(allTasks: allTasks,removedTasks: state.removedTasks));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
      allTasks: List.from(state.allTasks)..remove(event.tasks),
      removedTasks: List.from(state.removedTasks)..add(event.tasks.copyWith(isDeleted: true)),
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
      allTasks: state.allTasks,
      removedTasks: List.from(state.removedTasks)..remove(event.tasks)
    ));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
