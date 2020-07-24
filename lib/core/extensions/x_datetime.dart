import 'package:profe_case_study/core/utils/datetime.dart';

extension XDatetime on DateTime {
  String get formattedString =>
      '${this.day}.${this.month}.${this.year} - ${DateTimeUtils().hour(this)}:${DateTimeUtils().minute(this)}';
}
