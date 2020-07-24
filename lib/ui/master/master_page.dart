import 'package:flutter/material.dart';
import 'package:profe_case_study/app/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:profe_case_study/core/constants/route_constants.dart';
import 'package:profe_case_study/core/init/route/route_service.dart';
import 'package:profe_case_study/core/components/customer/customer_widget.dart';
import 'package:profe_case_study/core/extensions/x_context.dart';
import 'package:profe_case_study/ui/task/task_list_widget.dart';

class MasterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  var taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Müşteri İşlemleri"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                RouteService.instance
                    .navigateToPage(path: RouteConstants.SETTINGS_PAGE);
              })
        ],
      ),
      body: Consumer<TaskProvider>(
        builder: (_, provider, widget) {
          return Column(
            children: <Widget>[
              CustomerWidget(),
              Expanded(
                  child: provider.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                context.colors.primary),
                          ),
                        )
                      : TaskListWidget(taskList: provider.tasks ?? [])),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RouteService.instance
              .navigateToPage(path: RouteConstants.DETAIL_PAGE);
        },
        backgroundColor: context.colors.primary,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
