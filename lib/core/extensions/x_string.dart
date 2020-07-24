import 'package:profe_case_study/core/constants/app_constants.dart';

extension XString on String {
  Role get role {
    switch (this) {
      case "chef":
        return Role.CHEF;
        break;
      case "worker":
        return Role.WORKER;
        break;
      default:
        return Role.UNDEFINED;
    }
  }

  Category get category {
    switch (this) {
      case "cooler":
        return Category.COOLER;
        break;
      case "janitor":
        return Category.JANITOR;
        break;
      case "stand":
        return Category.STAND;
        break;
      default:
        return Category.UNDEFINED;
    }
  }
}
