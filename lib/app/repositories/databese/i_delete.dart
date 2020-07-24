import 'package:profe_case_study/app/repositories/databese/i_database.dart';

abstract class IDelete<T> implements IDatabase {
  Future<int> deleteT(T model);
  Future<int> deleteAll();
}
