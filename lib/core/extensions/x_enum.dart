import 'package:profe_case_study/core/constants/app_constants.dart';

extension XRole on Role {
  String get str =>
      this.index == 0 ? "chef" : this.index == 1 ? "worker" : "undefined";
  String get strLocale =>
      this.index == 0 ? "Şef" : this.index == 1 ? "İşçi" : "Diğer";
  String get defaultStrLocale => "Atanacak Rol";
  int get length => this.length;
}

extension XCategory on Category {
  String get str => this.index == 0
      ? "cooler"
      : this.index == 1 ? "janitor" : this.index == 2 ? "stand" : "undefined";
  String get strLocale => this.index == 0
      ? "Soğutucu"
      : this.index == 1 ? "Temizleyici" : this.index == 2 ? "Stand" : "Diğer";
  String get defaultStrLocale => "Kategori";
  int get length => this.length;
}
