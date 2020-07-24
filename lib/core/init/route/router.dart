import 'package:flutter/material.dart';
import 'package:profe_case_study/core/constants/route_constants.dart';
import 'package:profe_case_study/ui/base/base.dart';
import 'package:profe_case_study/ui/check/check_page.dart';
import 'package:profe_case_study/ui/detail/detail_page.dart';
import 'package:profe_case_study/ui/flight/flight_page.dart';
import 'package:profe_case_study/ui/master/master_page.dart';
import 'package:profe_case_study/ui/settings/settings_page.dart';

class Router {
  static Router _instance = Router._init();
  static Router get instance => _instance;

  Router._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.BASE:
        return normalNavigate(Base());
        break;
      case RouteConstants.MASTER_PAGE:
        return normalNavigate(MasterPage());
        break;
      case RouteConstants.FLIGT_PAGE:
        return normalNavigate(FlightPage());
        break;
      case RouteConstants.CHECK_PAGE:
        return normalNavigate(CheckPage());
        break;
      case RouteConstants.DETAIL_PAGE:
        return normalNavigate(DetailPage());
        break;
      case RouteConstants.SETTINGS_PAGE:
        return normalNavigate(SettingsPage());
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
