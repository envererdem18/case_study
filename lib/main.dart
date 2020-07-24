import 'package:flutter/material.dart';
import 'package:profe_case_study/app/providers/task_provider.dart';
import 'package:profe_case_study/app/providers/theme_provider.dart';
import 'package:profe_case_study/core/init/route/route_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:profe_case_study/core/init/route/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => TaskProvider(), lazy: false),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profe Case Study',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale("tr", "TR"),
      supportedLocales: [Locale("tr", "TR"), Locale("en", "US")],
      onGenerateRoute: Router.instance.generateRoute,
      navigatorKey: RouteService.instance.navigatorKey,
      theme: Provider.of<ThemeProvider>(context, listen: false).currentTheme,
    );
  }
}
