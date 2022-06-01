import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/product/constants/padding_constants.dart';

import '../../bloc/tasks_bloc/tasks_bloc.dart';
import '../../product/constants/text_constants.dart';
import 'recycle_bin.dart';
import 'tasks_screen.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _drawerView(context),
    );
  }

  Drawer _drawerView(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: PaddingConstans().drawerPadding,
            color: Colors.transparent,
            child: Text(
              TextConstants().tasksDrawer,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return _tasksButton(context, state);
            },
          ),
          const Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return _binButton(context, state);
            },
          ),
        ],
      ),
    );
  }

  GestureDetector _tasksButton(BuildContext context, TasksState state) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const TasksScreen(),
        ));
      },
      child: ListTile(
        leading: const Icon(Icons.folder_special_outlined),
        title:  Text(TextConstants().myTasks),
        trailing: Text("${state.allTasks.length}"),
      ),
    );
  }

  GestureDetector _binButton(BuildContext context, TasksState state) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const RecycleBin(),
        ));
      },
      child: ListTile(
        leading: const Icon(Icons.delete),
        title:  Text(TextConstants().binTitle),
        trailing: Text("${state.removedTasks.length}"),
      ),
    );
  }
}
