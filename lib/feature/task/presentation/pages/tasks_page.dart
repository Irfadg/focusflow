import 'package:flutter/material.dart';
import 'package:focusflow/core/core.dart';
import 'package:focusflow/feature/task/presentation/widgets/task_item.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
children: [
  AppSpacing.vL,
  TaskItem(title: 'DO OR DIE'),
  AppSpacing.vM,
    TaskItem(title: 'DO OR DIE'),
  AppSpacing.vM,
    TaskItem(title: 'DO OR DIE'),
  AppSpacing.vM,
    TaskItem(title: 'DO OR DIE'),
  AppSpacing.vM,
],
      ),
    );
  }
}