import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/product/constants/padding_constants.dart';

import '../../bloc/tasks_bloc/tasks_bloc.dart';
import '../../feature/model/tasks_model.dart';
import '../constants/text_constants.dart';

class AddTasksSheet extends StatelessWidget {
  const AddTasksSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    FocusNode focusNodeTitle = FocusNode();
    FocusNode focusNodeDescription = FocusNode();
    return Container(
      padding: PaddingConstans().containerPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              TextConstants().addTask,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            _minHeight(),
            TextFieldWidget(
              focusNode: focusNodeTitle,
              controller: titleController,
              labelText: TextConstants().title,
            ),
            _minHeight(),
            TextFieldWidget(
              focusNode: focusNodeDescription,
              controller: descriptionController,
              labelText: TextConstants().description,
            ),
            _rowButtons(context, titleController, descriptionController),
            
          ],
        ),
      ),
    );
  }

  Row _rowButtons(BuildContext context, TextEditingController titleController, TextEditingController descriptionController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: () => Navigator.pop(context), child: Text(TextConstants().cancel)),
        ElevatedButton(
            onPressed: () {
              var tasks = Tasks(title: titleController.text, description: descriptionController.text);
              context.read<TasksBloc>().add(AddTask(tasks: tasks));
            },
            child: Text(TextConstants().add))
      ],
    );
  }

  SizedBox _minHeight() {
    return const SizedBox(
      height: 10,
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({Key? key, required this.focusNode, required this.controller, required this.labelText}) : super(key: key);

  FocusNode? focusNode;
  TextEditingController? controller;
  String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      scrollPadding: PaddingConstans().scrollPadding,
      focusNode: focusNode,
      autofocus: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(labelText: labelText, border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
