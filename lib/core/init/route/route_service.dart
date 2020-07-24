import 'package:flutter/material.dart';
import 'package:profe_case_study/core/init/route/i_route_service.dart';

class RouteService implements IRouteService {
  static RouteService _instance = RouteService._init();
  static RouteService get instance => _instance;

  RouteService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String path, Object data}) async {
    await navigatorKey.currentState.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({String path, Object data}) async {
    await navigatorKey.currentState
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }

  @override
  Future<void> pop({Object data}) {
    navigatorKey.currentState.pop([data]);
  }
}
