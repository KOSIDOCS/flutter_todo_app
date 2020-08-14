import 'package:flutter/material.dart';
import 'package:todoeyflutter/customWidget/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  final ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TasksTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.removeTask(index);
              },
            );
          },
          itemCount: taskData.taskCount,
          physics: BouncingScrollPhysics(),
          controller: _controller,
        );
      },
    );
  }
}
