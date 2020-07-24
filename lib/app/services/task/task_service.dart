import 'package:profe_case_study/app/models/task.dart';
import 'package:profe_case_study/core/constants/app_constants.dart';
import 'package:profe_case_study/core/init/database/database_helper.dart';

class TaskService {
  final dbHelper = DatabaseHelper();

  Future<int> addTask(Task model) async {
    final db = await dbHelper.db;
    var result = db.insert(taskTable, model.toMap());
    return result;
  }

  Future<int> deleteAll() async {
    final db = await dbHelper.db;
    var result = await db.delete(taskTable);
    return result;
  }

  Future<int> deleteTask(Task model) async {
    final db = await dbHelper.db;
    var result =
        await db.delete(taskTable, where: "id = ?", whereArgs: [model.id]);
    return result;
  }

  Future<Task> getTask(Task model) async {
    final db = await dbHelper.db;
    List<Map> list =
        await db.rawQuery('SELECT * FROM $taskTable WHERE id = ${model.id}');
    List<Task> tasks = List();
    for (var item in list) {
      var task = Task(
          id: item["id"],
          description: item["description"],
          role: item["role"],
          category: item["category"],
          time: item["time"]);
      tasks.add(task);
    }
    return tasks.first;
  }

  Future<List<Task>> getTaskList({List<String> columns, String query}) async {
    final db = await dbHelper.db;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty) {
        result = await db.query(taskTable,
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
      }
    } else {
      result = await db.query(taskTable, columns: columns);
    }
    List<Task> tasks =
        result.isNotEmpty ? result.map((r) => Task.fromMap(r)).toList() : [];
    return tasks;
  }

  Future<int> updateTask(Task model) async {
    final db = await dbHelper.db;

    var result = await db.update(taskTable, model.toMap(),
        where: "id = ?", whereArgs: [model.id]);

    return result;
  }
}
