import 'package:flutter/material.dart';
import 'package:profe_case_study/app/models/customer.dart';
import 'package:profe_case_study/core/components/customer/customer_list_tile.dart';
import 'package:profe_case_study/core/components/wave/wave_section.dart';

class CustomerWidget extends StatelessWidget {
  const CustomerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        children: <Widget>[
          WaveSection(
            backgroundColor: Colors.blue,
          ),
          CustomerListTile(
            // Dummy data
            customer: Customer(
                avatar: "T3",
                city: "SAKARYA",
                district: "SERDİVAN",
                fullName: "VEDAT KARATAŞ",
                groceryName: "KÖŞEM BÜFE",
                id: "5003612"),
          ),
        ],
      ),
    );
  }
}
