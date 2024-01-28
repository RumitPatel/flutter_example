import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx_test/my_controller.dart';

class StateTestWithTasks extends StatelessWidget {
  const StateTestWithTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Test State with Getx"),
      ),*/
      body: SafeArea(
        child: Column(
          children: [
            ProgressPart(),
            TaskList(),
          ],
        ),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.put(MyController());
    return Obx(() => Column(
          children: c.tasks
              .map(
                (task) => TaskItem(task: task),
              )
              .toList(),
        ));
  }
}

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var c = Get.put(MyController());
    return Row(
      children: [
        Checkbox(
            value: task.completed,
            onChanged: (newValue) => c.toggleTaskChecked(task.id)),
        Text(task.label)
      ],
    );
  }
}

class ProgressPart extends StatelessWidget {
  const ProgressPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var c = Get.put(MyController());

    return Column(
      children: [
        Text("The progress indicates how far you are completing task"),
        Obx(
          () => LinearProgressIndicator(
              value: c.getCheckedTasks() / c.tasks.length),
        ),
      ],
    );
  }
}

@immutable
class Task {
  final int id;
  final String label;
  final bool completed;

  Task({required this.id, required this.label, this.completed = false});

  Task copyWith({int? id, String? label, bool? completed}) {
    return Task(
        id: id ?? this.id,
        label: label ?? this.label,
        completed: completed ?? this.completed);
  }
}
