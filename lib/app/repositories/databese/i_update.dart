import 'package:profe_case_study/app/repositories/databese/i_database.dart';

abstract class IUpdate<T> implements IDatabase {
  Future<int> updateT(T model);
}
