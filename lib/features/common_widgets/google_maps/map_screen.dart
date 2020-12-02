import 'dart:async';
import 'dart:math' show cos, sqrt, asin;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;
import 'package:geocoder/geocoder.dart' ;
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart' as geolocator ;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart'  as permission_handler;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'map_items.dart';
//To show all wanted map in app
class MapeScreen extends StatefulWidget {

  final int map_switch;
  final String warningLocationSetting;
  final bool hideOpenFullScreen,isLogedIn;

  final String locale;
  final double lat,long;
  void Function(double lat,double long, String locationDetails,
      bool isHaveValue) getCoordinates =
      (lat,long, locationDetails,isHaveValue) {};

  MapeScreen(
      this.locale,{
    @required this.hideOpenFullScreen,
   @required this.warningLocationSetting,
    @required this.map_switch,
    @required this.lat,
    @required this.long,
    @required this.getCoordinates,
    @required this.isLogedIn

  });
  @override
  State<MapeScreen> createState() => MapeScreenState();
}

class MapeScreenState extends State<MapeScreen> {




  permission_handler.PermissionStatus _permissionStatus = permission_handler.PermissionStatus.unknown;

  LocationData _currentLocation;
  bool _isStartLocationFound=false;
  CameraPosition _currentCameraPosition;
  GoogleMap googleMap;
  int mainDatatIndex=0;
  bool isSelectedIndex=false;

  StreamSubscription<LocationData> _locationSubscription;

  Location _locationService  = new Location();
  bool _permission = false;
  String error;
  bool currentWidget = true;
  bool _isloading=true;
  var location = new Location();
  Completer<GoogleMapController> _controller = Completer();
  static  LatLng _center=LatLng(34.43967, 43.796825);
  Set<Marker> _markers = Set();
  MapType _currentMapType = MapType.normal;
  LatLng centerPosition=LatLng(34.43967, 43.796825);
  LatLng listCenterPosition=LatLng(34.43967, 43.796825);

  InfoWindow infoWindow =
  InfoWindow(title: "مكان العمل");
  double zoomValue=16.0;
  double mapOnzoomValue;

  @override
  void dispose() {
    if(widget.map_switch==LocationWidgetCases.REGISTER_LOCATIN){
      if(!_permission){
        widget.getCoordinates(null,null,null,true);

      }
    }

    super.dispose();


  }
  @override
void initState() {
    // TODO: implement initState
    super.initState();


switch(widget.map_switch){

  case LocationWidgetCases.ONE_MARKER_DETAILS:

    break;
  case LocationWidgetCases.FULL_SCREEN:
    setState(() {
      _isloading=false;
      _isStartLocationFound=true;

    });
    break;

  case LocationWidgetCases.REGISTER_LOCATIN:

    zoomValue=8.0;
    initPlatformState();

    break;


  case LocationWidgetCases.SHOW_LIST:


    initPlatformState();


    break;

  case LocationWidgetCases.SHOW_DIALOG:
    setState(() {
      _isloading=false;
      _isStartLocationFound=true;

    });
    break;

   }


  }

  @override
  Widget build(BuildContext context) {

    switch(widget.map_switch) {
//==============================================================================
    //return screen details of one marker
//==============================================================================
      case LocationWidgetCases.ONE_MARKER_DETAILS:
        zoomValue=10.0;

        if(widget.lat!=null&&widget.long!=null){
          _center=LatLng(widget.lat, widget.long);
          _onAddOneMarker(new LatLng(widget.lat, widget.long));

        }else{
          _onAddOneMarker(new LatLng(34.43967, 43.796825));

        }
        googleMap = GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: _currentMapType,
          myLocationEnabled: true,
          markers: _markers,
          onCameraMove: _onCameraMove,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: zoomValue,
          ),
        );
        return
        widget.hideOpenFullScreen?
        MapWidget.fullScreen (
          widget.locale,
            googleMap: googleMap,
            showDetails: false,
            context: context,
            isStartLocationFound: true
        ):
          MapWidget.partOfScreen (
              googleMap: googleMap,
              context: context,
            onMapTypeButtonPressed: (){
              _onMapTypeButtonPressed();

            },
            onTap: (){
              showDialog<bool>(
                  context: context,
                  builder: (BuildContext context) {
                    return  MapWidget.fullScreen (
                        widget.locale,
                      googleMap: googleMap,
                      showDetails: false,
                      context: context,
                      isStartLocationFound: true
                    );
                  });
            },
          );
        break;

//==============================================================================
    //return full screen
//==============================================================================
      case LocationWidgetCases.FULL_SCREEN:
        break;

//==============================================================================
    //return  register location screen
//==============================================================================
      case LocationWidgetCases.REGISTER_LOCATIN:
      googleMap = GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        mapType: _currentMapType,
          onCameraMove: _onCameraMove,
          initialCameraPosition:
          CameraPosition(
          target: _center,
          zoom: zoomValue,
        ),
        myLocationEnabled: true,
          onTap: (latlang){

              if(_markers.length>=1)
              {
                _markers.clear();
               // _markers.remove()
              }else{
                _onAddOneMarker(latlang);

              }
            }
      );

        return  MapWidget.registerMarker(
          context: context,
          googleMap: googleMap,
          isStartLocationFound: _isStartLocationFound,
          onMapTypeButtonPressed: (){
            _onMapTypeButtonPressed();

          }
        );
        break;

//==============================================================================
    //return  list of markers
//==============================================================================
      case LocationWidgetCases.SHOW_LIST:
        zoomValue=3.0;


        googleMap = GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: MapType.terrain,
          myLocationEnabled: true,
          markers: _markers,
          onCameraMove: _onCameraMove,
          initialCameraPosition: CameraPosition(
            target: centerPosition,
            zoom: zoomValue,
          ),
        );
        return
          MapWidget.fullScreen (
              widget.locale,
            googleMap: googleMap,
          isLogedIn: widget.isLogedIn,
          showDetails:isSelectedIndex ,
          context: context,
             isStartLocationFound: _isStartLocationFound
        );
        break;

//==============================================================================
    //return  dialog
//==============================================================================
      case LocationWidgetCases.SHOW_DIALOG:
        googleMap = GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: _currentMapType,
          myLocationEnabled: true,
          markers: _markers,
          onCameraMove: _onCameraMove,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: zoomValue,
          ),
        );
        return
          MapWidget.dialoge (
              googleMap:googleMap,
              onMapTypeButtonPressed:(){
                _onMapTypeButtonPressed();
              },
            onTap: (){
              showDialog<bool>(
                  context: context,
                  builder: (BuildContext context) {
                    return  MapWidget.fullScreen (
                      widget.locale,
                      googleMap: googleMap,
                      context: context,
                    );
                  });
            },
            context: context,
             isStartLocationFound: true

         );
        break;
    }
  }


  //----------------------------------------------------------------------------
  //change type of map.
  //----------------------------------------------------------------------------
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.satellite
          ? MapType.hybrid
          : MapType.normal;
      print("MapType" + _currentMapType.toString());
    });
  }
  //----------------------------------------------------------------------------
  //set map controller.
  //----------------------------------------------------------------------------
  void _onMapCreated(GoogleMapController controller) {
    try{
      _controller.complete(controller);

    }catch(Exception){

    }
  }
  //----------------------------------------------------------------------------
  //when camera move.
  //----------------------------------------------------------------------------
  void _onCameraMove(CameraPosition position) {
    centerPosition = position.target;
    setState(() {
      mapOnzoomValue=position.zoom;
    });
    print("position: " + position.target.toString());
    print("zoom: " + position.zoom.toString());
  }


  //----------------------------------------------------------------------------
  //Platform messages are asynchronous, so we initialize in an async method.
  //----------------------------------------------------------------------------
  initPlatformState() async {
    await _locationService.changeSettings( accuracy:LocationAccuracy.high,interval: 1000);

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        Future<Map<permission_handler.PermissionGroup, permission_handler.PermissionStatus>> status = permission_handler.PermissionHandler()
            .requestPermissions([permission_handler.PermissionGroup.location,permission_handler.PermissionGroup.locationAlways,permission_handler.PermissionGroup.locationWhenInUse]);
        status.then(([PermissionGroup, PermissionStatus]) async{

          _listenForPermissionStatus();//listen for permission status

        });

      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if(serviceStatusResult){
          initPlatformState();
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        _permission=false;
        Navigator.pop(context,false);
        setState(() {
          _isloading=false;
        });
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        _permission=false;
        Navigator.pop(context,false);
        setState(() {
          _isloading=false;
        });
      }

    }


  }


  //----------------------------------------------------------------------------
  //listening for ststus of permission.
  //----------------------------------------------------------------------------
  void _listenForPermissionStatus() {
    var status = permission_handler.PermissionHandler()
        .checkPermissionStatus(permission_handler.PermissionGroup.location);
    status.then((permission_handler.PermissionStatus status) async{
      setState(() {
        _permissionStatus=status;
      });

      if(_permissionStatus == permission_handler.PermissionStatus.granted) {
        _permission =true;
        _getMyLocation(_permission);
      }else{
        _permission= false;
        setState(() {
          _isloading=true;
          showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                /*return  SettingDialog (
                    widget.warningLocationSetting==null
                        ? AppLocalizations.of(context).warning_allow_locate_txt
                        :widget.warningLocationSetting
                    ,(){

                  Navigator.pop(context,false);
                });*/
              });

        });
      }
    });
  }

  //----------------------------------------------------------------------------
  //get device location.
  //----------------------------------------------------------------------------
  _getMyLocation(bool isAccess) async{

    if(isAccess){
      LocationData location;
      location = await _locationService.getLocation();

      _locationSubscription = _locationService.onLocationChanged.listen((LocationData result) async {
        if(widget.map_switch==LocationWidgetCases.REGISTER_LOCATIN){
          _currentCameraPosition = CameraPosition(
            //add result isteade of location
              target: LatLng(location.latitude, location.longitude),
              zoom: 8

          );

        }


        if(mounted) {

          if(widget.map_switch==LocationWidgetCases.REGISTER_LOCATIN){

            setState(() {

                _center=LatLng(location.latitude, location.longitude);
                centerPosition=LatLng(location.latitude, location.longitude);


            });

              widget.getCoordinates(result.latitude,result.longitude,await _getUserLocationDetails(result.latitude,result.longitude,),true);


            setState(() {
              centerPosition=LatLng(result.latitude, result.longitude);
              _currentLocation=result;
            });
            _getUserLocationDetails(_currentLocation.latitude,_currentLocation.longitude);
            _onAddOneMarker(LatLng(_currentLocation.latitude,_currentLocation.longitude));

          }
          setState(() {
            _currentLocation = result;
            _isloading=false;


          });
        }
      });

      if(widget.map_switch==LocationWidgetCases.REGISTER_LOCATIN){

        setState(() {

          _center=LatLng(location.latitude, location.longitude);
          centerPosition=LatLng(location.latitude, location.longitude);


        });}
      setState(() {
        _currentLocation = location;
        _isStartLocationFound=true;
        _isloading=false;
        print('start location lat=${_currentLocation.latitude}'
            ',,,,long='
            '${ _currentLocation.longitude}');
      });

      if(widget.map_switch==LocationWidgetCases.SHOW_LIST){
        _addList_markers(isAccess);

      }else  if(widget.map_switch==LocationWidgetCases.REGISTER_LOCATIN){
        widget.getCoordinates(_currentLocation.latitude,_currentLocation.longitude,await _getUserLocationDetails(_currentLocation.latitude,_currentLocation.longitude,),true);
        _getUserLocationDetails(_currentLocation.latitude,_currentLocation.longitude);
        _onAddOneMarker(LatLng(_currentLocation.latitude,_currentLocation.longitude));
      }else if(widget.map_switch==LocationWidgetCases.ONE_MARKER_DETAILS){
        _onAddOneMarker(LatLng(widget.lat,widget.long));

      }

    }else{
      setState(() {
        _isloading=false;

      });
      if(widget.map_switch==LocationWidgetCases.SHOW_LIST){
        _addList_markers(isAccess);

      }
    }

  }


  //----------------------------------------------------------------------------
  //if want refresh value of current location.
  //----------------------------------------------------------------------------
  slowRefresh() async {
    _locationSubscription.cancel();
    await _locationService.changeSettings(accuracy:LocationAccuracy.balanced , interval: 10000);
    _locationSubscription = _locationService.onLocationChanged.listen((LocationData result) {
      if(mounted){
        setState(() {
          _currentLocation = result;
        });
      }
    });
  }



  //----------------------------------------------------------------------------
  //add one marker on click map.
  //----------------------------------------------------------------------------

  void _onAddOneMarker(LatLng latlang) async {

    if(widget.map_switch==LocationWidgetCases.ONE_MARKER_DETAILS){
      Marker marker = Marker(
        markerId: MarkerId(_markers.length.toString()),
        infoWindow: infoWindow,
        position: latlang,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );
      setState(() {
        _markers.add(marker);
      });
    }   else if(widget.map_switch==LocationWidgetCases.SHOW_LIST){
      Marker marker = Marker(
        markerId: MarkerId(_markers.length.toString()),
        infoWindow: InfoWindow(title: AppLocalizations.of(context).my_location_txt),
        position: centerPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      );
      setState(() {
        _markers.add(marker);
      });
    }




    else{
      if(_locationSubscription!=null){
        _locationSubscription.cancel();

      }

      Marker marker = Marker(
        markerId: MarkerId(_markers.length.toString()),
        infoWindow: infoWindow,
        position: latlang,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      );
      widget.getCoordinates(latlang.latitude,latlang.longitude,await _getUserLocationDetails(latlang.latitude,latlang.longitude),true);

      setState(() {
        _markers.add(marker);
        _getUserLocationDetails(latlang.latitude,latlang.longitude);
      });
    }

  }


  //----------------------------------------------------------------------------
  //get location detail.
  //----------------------------------------------------------------------------

  Future<String> _getUserLocationDetails(double lat,double long) async {
    try{
     // geolocator.Position position = await geolocator.Geolocator().getCurrentPosition(desiredAccuracy: geolocator.LocationAccuracy.high);
    //  debugPrint('location: ${position.latitude}');
      final coordinates = new Coordinates(lat, long);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      //  print("${first.featureName} : ${first.addressLine}");
      return "${first.featureName} : ${first.addressLine}";
    }catch(e){
      print("getCoordinates Exception= ${e.toString()}");
      return null;
    }

  }


  //----------------------------------------------------------------------------
  //show list of marker from list details.
  //----------------------------------------------------------------------------
  void _addList_markers(bool isAcess) async{
    //add default camera position on iraq to show most position on iraq
    _center =  LatLng(34.43967, 43.796825);

    _onAddOneMarker(centerPosition);
  }

  //----------------------------------------------------------------------------
  //icon marker from asset.
  //----------------------------------------------------------------------------

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }
  //----------------------------------------------------------------------------
  //get String distance between current location and service location.
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  //get String distance between current location and service location.
  //----------------------------------------------------------------------------
  String getStringDistance( lat2, lon2){
    if(lat2!=null&&lon2!=null){

      print('start location lat=${_currentLocation.latitude}'
          ',,,,long='
          '${ _currentLocation.longitude}');


      int distance = calculateDistance(
          _currentLocation.latitude, _currentLocation.longitude,
          lat2, lon2).round();
      return  "Km: ${distance.toString()}";
    }else return '';



  }

  //----------------------------------------------------------------------------
  //calculate distance between current location and service location.
  //----------------------------------------------------------------------------
  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }


  //----------------------------------------------------------------------------
  //if want to change marker veiw to image of user.
  //----------------------------------------------------------------------------
  Future<Uint8List> getBytesFromCanvas(int width, int height,String url) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = AppTheme.primary;
    final Radius radius = Radius.circular(20.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: 'Hello world',

      style: TextStyle(fontSize: 25.0, color: Colors.white),
    );
    painter.layout();

    var request = await http.get(url);
    var bytes = await request.bodyBytes;
    //final ByteData datai = await rootBundle.load(urlAsset);
    var imaged = await loadImage(new Uint8List.view(bytes.buffer));
    canvas.drawImage(imaged, new Offset(0, 0), new Paint());

    painter.paint(canvas, Offset((width * 0.5) - painter.width * 0.5, (height * 0.5) - painter.height * 0.5));


    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data.buffer.asUint8List();
  }


  Future < Uint8List > getBytesFromCanvas2(int width, int height, url) async
  {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.transparent;
    final Radius radius = Radius.circular(20.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);



    var request = await http.get(url);
    var bytes = await request.bodyBytes;

    //final ByteData datai = await rootBundle.load(urlAsset);

    var imaged = await loadImage(new Uint8List.view(bytes.buffer));


    canvas.drawImage(imaged, new Offset(0, 0), new Paint());

    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data.buffer.asUint8List();
  }

  Future < ui.Image > loadImage(List < int > img) async {
    final Completer < ui.Image > completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {

      return completer.complete(img);
    });
    return completer.future;
  }

}
