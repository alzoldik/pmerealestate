import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'MainScreens/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'اطعام',
        navigatorKey: navigator,
        theme: ThemeData(
          fontFamily: "cairo",
          primaryColor: Color.fromRGBO(0, 104, 152, 1),
          accentColor: Color.fromRGBO(229, 240, 245, 1),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            headline2: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 10, color: Colors.grey),
            bodyText2: TextStyle(fontSize: 10, color: Colors.black)
          )
        ),
        home: Home(),
      ),
    );
  }
}
