import 'package:flutter/material.dart';

class Layer {
  final int id;
  final String url;
  final String title;
  final String  info;

  Layer(this.id, this.url, this.title, this.info);


  static List<Layer> fetchall(){
    return [
      Layer(1, 'https://419e56a7.ngrok.io/geoserver/www/server.html',
          'Current Location', 'A geoserver layer showing an interactive layer of the world map. Including all countries'),

      Layer(5, 'https://google.com', 'Google', 'A geoserver layer showing the various districts in regions on an interactive map of Ghana'),

      Layer(6, 'https://www.google.com/maps/@5.7093742,-0.2240265,14z', 'Google Maps test', 'A geoserver layer showing the various districts in regions on an interactive map of Ghana')
    ];
  }

  static Layer fetchOne(int layerID){
    List<Layer> layers = Layer.fetchall();
    for(var i = 0; i < layers.length; i++){
      if(layers[i].id == layerID) {
        return layers[i];
      }
    }
    return null;
  }


}