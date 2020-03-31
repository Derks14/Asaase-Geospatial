import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
   IconData _icon;
   Function _function;
   String _tooltip;


   FloatingButton(this._icon, this._function, this._tooltip);

   @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: _tooltip,
      heroTag: null,
      onPressed: _function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      child: Icon(_icon, size: 36,),
      backgroundColor: Colors.teal,
    );
  }
}
