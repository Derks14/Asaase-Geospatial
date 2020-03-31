import 'package:asaase/models/layers.dart';
import 'package:asaase/screens/home.dart';
import 'package:asaase/screens/web_view_container.dart';
import 'package:asaase/widgets/customDrawer.dart';
import 'package:flutter/material.dart';

class OGC extends StatefulWidget {
  @override
  _OGCState createState() => _OGCState();
}

class _OGCState extends State<OGC> {

  final layers = Layer.fetchall();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('OGS WMS'),
      ),
      backgroundColor: Colors.teal[50],
      drawer: DrawerC(
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemCount: layers.length,
              itemBuilder: (context, index) => _urlbutton(context, layers[index])
          ),
      ),
    );
  }

  Widget _urlbutton(BuildContext context,Layer layer){
    return Card(
      child:  ListTile(
        title: Text(layer.title),
        subtitle: Text(layer.info),
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WebViewContainer(layer.url))
          );
        },

      ),
    );
  }
}
