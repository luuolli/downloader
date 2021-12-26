import '../enities/enities.dart';

abstract class ITasksManager {
  List<TaskInfo>? get tasks;

  void prepare(List<TaskInfo> tasks);

  List<TaskInfo> extraTasks();
}
