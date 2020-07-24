import 'package:flutter/material.dart';
import 'package:profe_case_study/core/extensions/x_context.dart';

class CheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Check",
          style: context.textTheme.headline6.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("Check"),
        ),
      ),
    );
  }
}
