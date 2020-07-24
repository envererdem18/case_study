import 'package:flutter/material.dart';

import 'package:profe_case_study/app/models/task.dart';
import 'package:profe_case_study/core/extensions/x_context.dart';
import 'package:profe_case_study/core/extensions/x_datetime.dart';
import 'package:profe_case_study/core/extensions/x_enum.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    Key key,
    @required this.task,
    @required this.backgroundColor,
    @required this.color,
  }) : super(key: key);

  final Color color;
  final Color backgroundColor;
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: color,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: color, width: 2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      elevation: 10,
      child: ListTile(
        title: Text(
          task.description,
          style:
              context.textTheme.bodyText1.copyWith(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          "Görev Türü : ${task.category.strLocale}",
          style: context.textTheme.subtitle1.copyWith(color: color),
        ),
        trailing: Container(
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(width: 2, color: color),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.timer, color: color),
                  Text("${task.time.formattedString}",
                      style: context.textTheme.caption.copyWith(color: color)),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
