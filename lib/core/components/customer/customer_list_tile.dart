import 'package:flutter/material.dart';

import 'package:profe_case_study/app/models/customer.dart';
import 'package:profe_case_study/core/extensions/x_context.dart';

class CustomerListTile extends StatelessWidget {
  const CustomerListTile({
    Key key,
    @required this.customer,
  }) : super(key: key);
  final Customer customer;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 6, left: 20),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          "${customer.avatar}",
          style: context.textTheme.headline6,
        ),
      ),
      title: Text(
        customer.title,
        style: context.textTheme.headline6.copyWith(color: Colors.white),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("${customer.groceryName} (<50M2)",
              style: context.textTheme.caption.copyWith(color: Colors.white)),
          Text("${customer.district} / ${customer.city}",
              style: context.textTheme.caption.copyWith(color: Colors.white)),
          SizedBox.shrink(),
        ],
      ),
    );
  }
}
