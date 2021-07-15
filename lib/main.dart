import 'package:flutter/material.dart';
import 'home screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit App',

      theme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.blue,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.blue,fontSize: 33))),
      home: HomeScreen(),
    );
  }
}
