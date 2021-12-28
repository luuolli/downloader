import '../domain.dart';

abstract class IDownloadManager {
  ITasksManager get tasksManager;

  Future<void> cancel(TaskInfo task);

  Future<void> delete(TaskInfo task);

  Future<void> downloadOne(TaskInfo task);

  Future<void> downloadMany(List<TaskInfo> tasks);

  Future<void> pause(TaskInfo task);

  Future<void> retry(TaskInfo task);

  Future<void> resume(TaskInfo task);
}
