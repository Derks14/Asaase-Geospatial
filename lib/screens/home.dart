
import 'package:asaase/widgets/customDrawer.dart';
import 'package:asaase/widgets/floatingButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(5.8245745, -0.6169437);

//  variable to store map markers
  final Set<Marker> _markers = {};

//
  LatLng _lastMapPosition = _center;

//  variable to store the current maptype
  MapType _currentMapType = MapType.normal;


//  new position
  static final CameraPosition _position12 = CameraPosition(
    bearing: 192.883,
    target: LatLng(5.651887, -0.186970),
    tilt: 59.440,
    zoom: 11.0,
  );

  Future<void> _goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position12));
  }



//  Methods
//  Method that executes to start map
  
    Future<void> _getCurrentLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

//    New Camera postion
      final CameraPosition _position1 = CameraPosition(
      bearing: 192.883,
      target: LatLng(position.latitude, position.longitude),
      tilt: 59.440,
      zoom: 11.0,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }
  
  void _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position){
    _lastMapPosition = position.target;
  }
  

  void _onMapTypeButtonPressed(){
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.hybrid
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed(){
    setState(() {
      _markers.add(Marker(
//        this marker id can be anything that uniquely identifies each marker
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 star Rating'
        ),
        icon: BitmapDescriptor.defaultMarker,

      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('Google Maps', style: TextStyle(
//          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),),
      ),
      drawer: DrawerC(),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  FloatingButton(Icons.map, _onMapTypeButtonPressed, 'Change Map Type'),
                  SizedBox(
                    height: 16.0,
                  ),
                  FloatingButton(Icons.add_location, _onAddMarkerButtonPressed, 'Put Marker at location'),
                  SizedBox(
                    height: 16.0,
                  ),
                  FloatingButton(Icons.location_searching, _getCurrentLocation, 'Enter Current Location')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
