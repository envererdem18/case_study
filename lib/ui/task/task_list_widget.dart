import 'package:flutter/material.dart';

import 'package:profe_case_study/app/models/task.dart';
import 'package:profe_case_study/app/providers/task_provider.dart';
import 'package:profe_case_study/core/components/task/task_list_tile.dart';
import 'package:profe_case_study/core/extensions/x_context.dart';
import 'package:provider/provider.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    Key key,
    @required this.taskList,
  }) : super(key: key);
  final List<Task> taskList;
  @override
  Widget build(BuildContext context) {
    return taskList != null && taskList.length > 0
        ? ListView.separated(
            separatorBuilder: (BuildContext ctx, index) {
              return SizedBox(
                height: 20,
              );
            },
            padding: context.paddingLow,
            itemCount: taskList.length,
            itemBuilder: (BuildContext ctx, index) {
              return Dismissible(
                key: Key(taskList[index].id),
                direction: DismissDirection.horizontal,
                onDismissed: (val) {
                  var provider =
                      Provider.of<TaskProvider>(context, listen: false);
                  provider.deleteTask(taskList[index]);
                },
                child: TaskListTile(
                  task: taskList[index],
                  color: Colors.blue,
                  backgroundColor: Colors.blue[50],
                ),
              );
            },
          )
        : Center(
            child: Text(
              "Tanımlanmış Görev \nBulunmamaktadır",
              style: context.textTheme.headline6
                  .copyWith(fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          );
  }
}
