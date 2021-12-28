import 'package:flutter_downloader/flutter_downloader.dart';

import '../../domain/domain.dart';

class DownloadManager extends IDownloadManager {
  final ITasksManager _tasksManager;

  @override
  ITasksManager get tasksManager => _tasksManager;

  DownloadManager(this._tasksManager);

  @override
  Future<void> cancel(TaskInfo task) async {
    return await FlutterDownloader.cancel(taskId: task.taskId!);
  }

  @override
  Future<void> delete(TaskInfo task) async {
    return await FlutterDownloader.remove(taskId: task.taskId!);
  }

  @override
  Future<void> downloadMany(List<TaskInfo> tasks) {
    // TODO: implement downloadMany
    throw UnimplementedError();
  }

  @override
  Future<void> downloadOne(TaskInfo task) async {
    final newId = await FlutterDownloader.enqueue(
      url: task.link!,
      savedDir: task.name!,
      fileName: task.name,
      openFileFromNotification: false,
      requiresStorageNotLow: false,
      showNotification: false,
    );

    task.taskId = newId;
  }

  @override
  Future<void> pause(TaskInfo task) async {
    return await FlutterDownloader.pause(taskId: task.taskId!);
  }

  @override
  Future<void> resume(TaskInfo task) async {
    final newId = await FlutterDownloader.resume(taskId: task.taskId!);
    task.taskId = newId;
  }

  @override
  Future<void> retry(TaskInfo task) async {
    final newId = await FlutterDownloader.retry(taskId: task.taskId!);
    task.taskId = newId;
  }
}
