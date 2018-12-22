import 'package:flutter/material.dart';
import 'package:le_sorcier/pages/auth.dart';
import 'package:le_sorcier/pages/home.dart';
import 'package:le_sorcier/pages/unknown-route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Sorcier',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.yellow,
          buttonColor: Colors.black),
      routes: {
        //'/': (BuildContext context) => AuthPage(), // Home page
        '/': (BuildContext context) => Home(), // Home page
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => UnknownRoute());
      },
    );
  }
}
