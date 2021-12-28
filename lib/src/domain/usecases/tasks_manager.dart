import '../enities/enities.dart';

abstract class ITasksManager {
  List<TaskInfo>? get tasks;

  Future<void> prepare(List<TaskInfo> tasks, {required Function onLoaded});

  Future<List<TaskInfo>> extraTasks();
}
