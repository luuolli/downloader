import 'package:flutter_downloader/flutter_downloader.dart';

import '../../domain/domain.dart';

class TasksManager implements ITasksManager {
  List<TaskInfo>? _tasks;

  @override
  List<TaskInfo>? get tasks => _tasks;

  @override
  Future<List<TaskInfo>> extraTasks() async {
    final taskStoraged = await FlutterDownloader.loadTasksWithRawQuery(
      query: '',
    );
    return [];
  }

  @override
  Future<void> prepare(
    List<TaskInfo> tasks, {
    required Function onLoaded,
  }) async {
    final _tasksStoraged = await FlutterDownloader.loadTasks();

    if (_tasksStoraged?.isNotEmpty == true) {
      for (var task in tasks) {
        for (var taskStoraged in _tasksStoraged!) {
          if (task.link == taskStoraged.url) {
            task.taskId = taskStoraged.taskId;
            task.progress = taskStoraged.progress;
            task.status = taskStoraged.status;
          }
        }
      }
    }
    onLoaded();
  }
}
