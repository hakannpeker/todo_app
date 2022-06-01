import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/product/constants/text_constants.dart';
import 'package:todo_app/product/widget/tasks_listview.dart';

import '../../bloc/tasks_bloc/tasks_bloc.dart';
import 'drawer_page.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:  Text(TextConstants().recycleBin),
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
          ),
          drawer: const DrawerPage(),
          body: Column(
            children: [
              Center(
                  child: Chip(
                label: Text("${state.removedTasks.length} Görev"),
              )),
               TaskListview(tasksList: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}
