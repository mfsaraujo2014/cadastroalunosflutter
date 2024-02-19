
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context){
     Modular.setInitialRoute('/');
    return MaterialApp.router(
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}