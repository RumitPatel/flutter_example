import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier(tasks: [
    Task(id: 1, label: "Load rocket with supplies"),
    Task(id: 2, label: "Launch rocket"),
    Task(id: 3, label: "Circle the home planet"),
    Task(id: 4, label: "Head out to the first moon"),
    Task(id: 5, label: "Launch moon lander #1"),
  ]);
});

class StateTest extends StatelessWidget {
  const StateTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [ProgressPart(), TaskList()],
        ),
      ),
    );
  }
}

class TaskList extends ConsumerWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tasks = ref.watch(_taskProvider);

    return Column(
      children: tasks
          .map(
            (task) => TaskItem(task: task),
          )
          .toList(),
    );
  }
}

class TaskItem extends ConsumerWidget {
  final Task task;

  TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Checkbox(
            value: task.completed,
            onChanged: (newValue) =>
                ref.read(_taskProvider.notifier).toggle(task.id)),
        Text(task.label)
      ],
    );
  }
}

class ProgressPart extends ConsumerWidget {
  const ProgressPart({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tasks = ref.watch(_taskProvider);

    var numCompletedTasks = tasks.where((task) {
      return task.completed == true;
    }).length;

    return Column(
      children: [
        Text("The progress indicates how far you are completing task"),
        LinearProgressIndicator(value: numCompletedTasks / tasks.length)
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

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier({
    tasks,
  }) : super(tasks);

  void add(Task task) {
    state = [...state, task];
  }

  void toggle(int taskId) {
    state = [
      for (final item in state)
        if (taskId == item.id)
          item.copyWith(completed: !item.completed)
        else
          item
    ];
  }
}
