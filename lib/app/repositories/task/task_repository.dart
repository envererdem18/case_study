import 'package:profe_case_study/app/models/task.dart';
import 'package:profe_case_study/app/repositories/databese/i_add.dart';
import 'package:profe_case_study/app/repositories/databese/i_delete.dart';
import 'package:profe_case_study/app/repositories/databese/i_get.dart';
import 'package:profe_case_study/app/repositories/databese/i_update.dart';
import 'package:profe_case_study/app/services/task/task_service.dart';

class TaskRepository
    implements IAdd<Task>, IGet<Task>, IDelete<Task>, IUpdate<Task> {
  final taskService = TaskService();
  @override
  Future<int> addT(Task model) => taskService.addTask(model);

  @override
  Future<int> deleteAll() => taskService.deleteAll();

  @override
  Future<int> deleteT(Task model) => taskService.deleteTask(model);

  @override
  Future<List<Task>> getList({List<String> columns, String query}) =>
      taskService.getTaskList(columns: columns, query: query);

  @override
  Future<Task> getT(Task model) => taskService.getTask(model);

  @override
  Future<int> updateT(Task model) => taskService.updateTask(model);
}
