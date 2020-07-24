import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:profe_case_study/app/models/task.dart';
import 'package:profe_case_study/app/providers/task_provider.dart';
import 'package:profe_case_study/core/constants/app_constants.dart';
import 'package:profe_case_study/core/extensions/x_context.dart';
import 'package:profe_case_study/core/extensions/x_datetime.dart';
import 'package:profe_case_study/core/extensions/x_enum.dart';
import 'package:profe_case_study/core/init/route/route_service.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddTaskForm extends StatefulWidget {
  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  TextEditingController _descriptionController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Role _role;
  Category _category;
  DateTime _time;
  bool _isValid;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: context.paddingLow,
          children: <Widget>[
            _materialFormField(
              child: TextFormField(
                controller: _descriptionController,
                minLines: 1,
                maxLines: 4,
                validator: (val) => val.trim().length < 5
                    ? "Açıklama 5 karakterden kısa olamaz"
                    : null,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.keyboard),
                    labelText: "Açıklama",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 20),
            _materialFormField(child: _rolePopUp()),
            const SizedBox(height: 20),
            _materialFormField(child: _categoryPopup()),
            const SizedBox(height: 20),
            _materialFormField(
              child: _dateTimePicker(context),
            ),
            const SizedBox(height: 20),
            _materialFormField(
              backgroundColor: Colors.blue,
              child: Center(
                child: _submitButton(context),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  FlatButton _submitButton(BuildContext context) {
    var taskProvider = Provider.of<TaskProvider>(context);
    return FlatButton(
      onPressed: () {
        if (_formKey.currentState.validate() &&
            _role != null &&
            _category != null &&
            _time != null) {
          if (mounted) {
            setState(() {
              _isValid = true;
            });
          }
          Uuid uuid = Uuid();
          String id = uuid.v4();
          Task task = Task(
              id: id,
              description: _descriptionController.text,
              role: _role,
              category: _category,
              time: _time);
          taskProvider.addTask(task);
          RouteService.instance.pop();
        } else {
          if (mounted) {
            setState(() {
              _isValid = false;
            });
          }
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "GÖNDER",
            style: context.textTheme.headline6.copyWith(
              color: Colors.white,
            ),
          ),
          _isValid == null || _isValid
              ? SizedBox.shrink()
              : Text("Lütfen eksik bilgileri tamamlayın",
                  style: context.textTheme.caption
                      .copyWith(color: Colors.red[200])),
        ],
      ),
    );
  }

  ListTile _dateTimePicker(BuildContext context) {
    return ListTile(
      title: Text(_time == null ? "Bitiş Tarihi" : _time.formattedString),
      trailing: Icon(Icons.date_range),
      onTap: () async {
        DateTime date = await DatePicker.showDateTimePicker(context,
            locale: LocaleType.tr,
            maxTime: DateTime(DateTime.now().year + 5),
            minTime: DateTime.now(),
            currentTime: DateTime.now(),
            onConfirm: (val) {},
            theme: DatePickerTheme());
        if (date != null) {
          if (mounted) {
            setState(() {
              _time = date;
            });
          }
        }
      },
    );
  }

  ListTile _categoryPopup() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
          _category == null ? _category.defaultStrLocale : _category.strLocale),
      trailing: PopupMenuButton<Category>(
          icon: Icon(Icons.arrow_drop_down),
          elevation: 4.2,
          onSelected: (val) {
            if (mounted) {
              setState(() {
                _category = val;
              });
            }
          },
          onCanceled: () {},
          itemBuilder: (BuildContext ctx) {
            return Category.values
                .map((c) => PopupMenuItem(
                      child: Text(c.strLocale),
                      value: c,
                    ))
                .toList();
          }),
    );
  }

  ListTile _rolePopUp() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(_role == null ? _role.defaultStrLocale : _role.strLocale),
      trailing: PopupMenuButton<Role>(
          icon: Icon(Icons.arrow_drop_down),
          elevation: 4.2,
          onSelected: (val) {
            if (mounted) {
              setState(() {
                _role = val;
              });
            }
          },
          onCanceled: () {},
          itemBuilder: (BuildContext ctx) {
            return Role.values
                .map((r) => PopupMenuItem(
                      child: Text(r.strLocale),
                      value: r,
                    ))
                .toList();
          }),
    );
  }

  Material _materialFormField(
      {Color color = Colors.blue,
      Color backgroundColor = Colors.white,
      Widget child}) {
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
      child: Container(
        padding: EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
