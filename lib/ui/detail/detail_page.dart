import 'package:flutter/material.dart';
import 'package:profe_case_study/core/extensions/x_context.dart';
import 'package:profe_case_study/core/components/customer/customer_widget.dart';
import 'package:profe_case_study/ui/task/add_task_form.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Görev Atama"),
        centerTitle: true,
        actions: <Widget>[IconButton(icon: Icon(Icons.edit), onPressed: () {})],
      ),
      body: Column(
        children: <Widget>[
          CustomerWidget(),
          Expanded(child: AddTaskForm()),
        ],
      ),
    );
  }
}
