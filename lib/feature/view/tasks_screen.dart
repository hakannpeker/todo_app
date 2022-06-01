import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/switch_bloc/switch_bloc_bloc.dart';
import '../../bloc/tasks_bloc/tasks_bloc.dart';
import '../../product/constants/text_constants.dart';
import '../../product/widget/add_tasks_widget.dart';
import '../../product/widget/tasks_listview.dart';
import '../model/tasks_model.dart';
import 'drawer_page.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  final String fabToolTip = "Add Task";

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddTasksSheet(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Tasks> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: Text(TextConstants().mainAppTitle),
            actions: [
              BlocBuilder<SwitchBlocBloc, SwitchBlocState>(builder: (context, state) {
                return _switchButton(state, context);
              })
            ],
          ),
          drawer: const DrawerPage(),
          body: _bodyColumn(state, tasksList),
          floatingActionButton: _floatingActionButton(context),
        );
      },
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _addTask(context),
      tooltip: fabToolTip,
      child: const Icon(Icons.add),
    );
  }

  Column _bodyColumn(TasksState state, List<Tasks> tasksList) {
    return Column(
      children: [
        Center(
            child: Chip(
          label: Text("${state.allTasks.length} Görev"),
        )),
        TaskListview(tasksList: tasksList),
      ],
    );
  }

  Switch _switchButton(SwitchBlocState state, BuildContext context) {
    return Switch(
        value: state.switchValue,
        onChanged: (changedValue) {
          changedValue ? context.read<SwitchBlocBloc>().add(SwitchOnEvent()) : context.read<SwitchBlocBloc>().add(SwitchOffEvent());
        });
  }
}
