import 'package:asaase/screens/home.dart';
import 'package:asaase/screens/ogc.dart';
import 'package:flutter/material.dart';

class DrawerC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Asaase GPS', style: TextStyle(fontSize: 20.0),),
            arrowColor: Colors.black,
            accountEmail: Text('A Mobile App that helps you with Navigation'),
            decoration: BoxDecoration(
                color: Colors.teal
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.teal
                  : Colors.white,
              child: Text('A', style: TextStyle(fontSize: 40.0,color: Colors.teal),),
            ),
          ),
          ListTile(
            title: Text('Google Maps'),
            subtitle: Text('Servving of Web Maps using Google Maps'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
            ,

          ),
          ListTile(
            title: Text('OGC WMS'),
            subtitle: Text('Visualizing data from OGC web services'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OGC()),
              );
            }
            ,
          ),
        ],
      ),
    );
  }
}
