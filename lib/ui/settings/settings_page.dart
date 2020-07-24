import 'package:flutter/material.dart';
import 'package:profe_case_study/app/providers/task_provider.dart';
import 'package:profe_case_study/core/extensions/x_context.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Ayarlar")),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Column(
          children: <Widget>[
            Text(
              "Toplam kayıtlı görev sayısı : ${taskProvider.tasks.length}",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyText1,
            ),
            Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: context.colors.primary)),
                    onPressed: () {
                      taskProvider.deleteAll();
                    },
                    child: Text(
                      "Tüm görevleri sil",
                      style: context.textTheme.caption
                          .copyWith(color: context.colors.primary),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
