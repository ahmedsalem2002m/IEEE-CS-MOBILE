import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/reusable_widget.dart';

class AddTaskScreen extends StatelessWidget {
   AddTaskScreen({super.key, required this.titleController, required this.timeController, required this.dateController, required this.formKey});

  final  TextEditingController titleController;
  final TextEditingController timeController ;
  final TextEditingController  dateController;
  final  GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            defaultTextFormField(
              labelText: "Task Name",
              controller: titleController,
              icon: Icons.title,
              onTap: () {},
              text: "enter your task name",
            ),
            SizedBox(height: 16),
            defaultTextFormField(
              labelText: "Task Time",
              controller: timeController,
              icon: Icons.timer_rounded,
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((value) {
                  timeController.text = value!.format(context);
                });
              },
              text: "enter your task time",
            ),
            SizedBox(height: 16),
            defaultTextFormField(
              labelText: "Task Date",
              controller: dateController,
              icon: Icons.date_range_outlined,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.parse("3025-04-03"),
                ).then((value) {
                  dateController.text = DateFormat.yMMMd().format(value!);
                });
              },
              text: "enter your task date ",
            ),
          ],
        ),
      ),
    );
  }
}
