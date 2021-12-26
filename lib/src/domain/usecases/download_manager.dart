import '../domain.dart';

abstract class IDownloadManager {
  ITasksManager get tasksManager;

  Future<void> cancel(TaskInfo task);

  Future<void> delete(TaskInfo task);

  Future<void> downloadOne(
    TaskInfo taskInfo, {
    Function? onComplete,
    Function? onError,
  });

  Future<void> downloadMany(
    TaskInfo taskInfo, {
    Function? onComplete,
    Function(List<TaskInfo> tasks)? onError,
  });

  Future<void> pause(TaskInfo task);

  Future<void> retry(TaskInfo task);

  Future<void> resume(TaskInfo task);
}
