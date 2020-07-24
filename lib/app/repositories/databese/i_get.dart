import 'package:profe_case_study/app/repositories/databese/i_database.dart';

abstract class IGet<T> implements IDatabase {
  Future<T> getT(T model);
  Future getList({List<String> columns, String query});
}
