import 'package:flutter/material.dart';

class AppBarC extends StatelessWidget {
  String _title;


  AppBarC(this._title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.teal,
      title: Text(_title, style: TextStyle(
//          fontWeight: FontWeight.bold,
        fontSize: 24,
      ),),
    );
  }
}
