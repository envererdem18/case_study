import 'package:profe_case_study/app/repositories/databese/i_database.dart';

abstract class IAdd<T> implements IDatabase {
  Future<int> addT(T model);
}
