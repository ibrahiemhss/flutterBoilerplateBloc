import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GetCurrentLocation extends StatefulWidget {
  @override
  State<GetCurrentLocation> createState() => CurrentLocationWidgetState();
}

class CurrentLocationWidgetState extends State<GetCurrentLocation> {
  LocationData _startLocation;
  LocationData _currentLocation;
  LatLng centerPosition;

  StreamSubscription<LocationData> _locationSubscription;

  Location _locationService = new Location();
  bool _permission = false;
  String error;

  bool currentWidget = true;

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(0, 0),
    zoom: 4,
  );

  CameraPosition _currentCameraPosition;

  GoogleMap googleMap;

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    centerPosition = position.target;
    setState(() {
      //mapOnzoomValue=position.zoom;
    });
    print("position: " + position.target.toString());
    print("zoom: " + position.zoom.toString());
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    await _locationService.changeSettings(
        accuracy: LocationAccuracy.high, interval: 1000);

    LocationData location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
       // _permission = await _locationService.requestPermission();
        print("Permission: $_permission");
        if (_permission) {
          location = await _locationService.getLocation();

          _locationSubscription = _locationService
              .onLocationChanged
              .listen((LocationData result) async {
            _currentCameraPosition = CameraPosition(
                target: LatLng(result.latitude, result.longitude), zoom: 20);

            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(
                CameraUpdate.newCameraPosition(_currentCameraPosition));

            if (mounted) {
              setState(() {
                _currentLocation = result;
                slowRefresh();
              });
            }
          });
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if (serviceStatusResult) {
          initPlatformState();
        }
      }
    } on PlatformException catch (e) {
      print(e);
      // if (e.code == 'PERMISSION_DENIED') {
      error = e.message;
      // } else if (e.code == 'SERVICE_STATUS_ERROR') {
      //   error = e.message;
      // }
      location = null;
    }

    setState(() {
      _startLocation = location;
    });
  }

  slowRefresh() async {
    _locationSubscription.cancel();
    await _locationService.changeSettings(
        accuracy: LocationAccuracy.balanced, interval: 10000);
    _locationSubscription =
        _locationService.onLocationChanged.listen((LocationData result) {
      if (mounted) {
        setState(() {
          _currentLocation = result;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets;

    googleMap = GoogleMap(
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      initialCameraPosition: _initialCamera,
    );

    widgets = [
      Center(
        child: SizedBox(height: 300.0, child: googleMap),
      ),
    ];

    widgets.add(new Center(
        child: new Text(_startLocation != null
            ? 'Start location: ${_startLocation.latitude} & ${_startLocation.longitude}\n'
            : 'Error: $error\n')));

    widgets.add(new Center(
        child: new Text(
            _currentLocation != null
                ? 'Continuous location: \nlat: ${_currentLocation.latitude} & long: ${_currentLocation.longitude} \nalt: ${_currentLocation.altitude}m\n'
                : 'Error: $error\n',
            textAlign: TextAlign.center)));

    widgets.add(new Center(
        child: new Text(
            _permission ? 'Has permission : Yes' : "Has permission : No")));

    widgets.add(new Center(
        child: new RaisedButton(
            child: new Text("Slow refresh rate and accuracy"),
            onPressed: () => slowRefresh())));

    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: new Text('Location plugin example app'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _locationSubscription.cancel(),
        tooltip: 'Stop Track Location',
        child: Icon(Icons.stop),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }
}
