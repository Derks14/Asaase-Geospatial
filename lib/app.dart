import 'package:asaase/main.dart';
import 'package:asaase/screens/home.dart';
import 'package:asaase/screens/ogc.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: OGC(),
      home: HomePage(),
      title: "Asaase GPS",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

    );
  }
}