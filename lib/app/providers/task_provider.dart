import 'package:flutter/material.dart';
import 'package:profe_case_study/app/models/task.dart';
import 'package:profe_case_study/app/repositories/task/task_repository.dart';

class TaskProvider extends ChangeNotifier {
  final _taskRepository = TaskRepository();

  List<Task> _tasks = List<Task>();
  bool _isLoading;

  TaskProvider() {
    _tasks = [];
    _isLoading = false;
    _load();
  }

  // Getters
  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;

  // Setters
  void setTasks(List<Task> values) {
    _tasks = values;
    notifyListeners();
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _load() async {
    setIsLoading(true);
    setTasks(await _taskRepository.getList());
    setIsLoading(false);
  }

  Future<int> addTask(Task model) async {
    int result = await _taskRepository.addT(model);
    _load();
    return result;
  }

  Future<int> deleteAll() async {
    int result = await _taskRepository.deleteAll();
    _load();
    return result;
  }

  Future<int> deleteTask(Task model) async {
    int result = await _taskRepository.deleteT(model);
    _load();
    return result;
  }

  Future<List<Task>> getList({List<String> columns, String query}) async {
    List<Task> result =
        await _taskRepository.getList(columns: columns, query: query);
    _load();
    return result;
  }

  Future<Task> getTask(Task model) async {
    Task result = await _taskRepository.getT(model);
    _load();
    return result;
  }

  Future<int> updateTask(Task model) async {
    int result = await _taskRepository.updateT(model);
    _load();
    return result;
  }
}
