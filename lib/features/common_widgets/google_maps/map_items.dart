import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../loading_animation.dart';


class MapWidget {


  static Widget fullScreen(
      String locale,{
    BuildContext context,
    bool isStartLocationFound,
    bool showDetails,
    bool isLogedIn,
    int index,
    GoogleMap googleMap}) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close), onPressed: ()  {

          Navigator.pop(context,false);

      },),
      body:
      Container(

        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0))),

        child:
        !isStartLocationFound?
        Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
                child:Container(
                    color: Colors.white,

                    child: LoadingAnimation.stillLoading())))
            : Column(
          mainAxisSize: MainAxisSize.min,

          children: <Widget>[
            Expanded(
              child: Container(
                width:400,
                child:
                Stack(
                  children: <Widget>[
                    googleMap,
                new Positioned(
                left: 4.0,
                  bottom: 4,
                  child:showDetails?   Center(
                    child:Container()
                  ):Container(),

                ),
                  ]),
              ),
            ),

          ],
        ),
      ),
    );
  }

/*


*/

  static Widget partOfScreen({
    BuildContext context,
    GoogleMap googleMap,
    Function onTap,
    Function onMapTypeButtonPressed,
  }) {

    return Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              googleMap,

              new Positioned(
                left: 4.0,
                top: 4,
                child:  InkWell(
                  onTap: (){

                    onTap();

                  },
                  child: Icon(
                    Icons.open_in_new,
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: new FloatingActionButton(
                    onPressed: onMapTypeButtonPressed,
                    child: new Icon(
                      Icons.map,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ));
  }



  static Widget dialoge({
    BuildContext context,
    bool isStartLocationFound,
    GoogleMap googleMap,
    Function onTap,
    Function onMapTypeButtonPressed,
  }) {

    return Scaffold(
        body: Container(
          child:!isStartLocationFound?
          Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                  child:Container(
                      color: Colors.white,

                      child: LoadingAnimation.stillLoading())))
              : Stack(
            children: <Widget>[
              googleMap,

              new Positioned(
                left: 4.0,
                top: 4,
                child:  InkWell(
                  onTap: (){

                    onTap();

                  },
                  child: Icon(
                    Icons.open_in_new,
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: new FloatingActionButton(
                    onPressed: onMapTypeButtonPressed,
                    child: new Icon(
                      Icons.map,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ));
  }


  static Widget registerMarker({
    BuildContext context,
    GoogleMap googleMap,
    bool isStartLocationFound,
    Function onMapTypeButtonPressed,


  }) {

    return Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.close), onPressed: ()  {

          Navigator.pop(context,false);

        },),
        body:
        Container(

          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                googleMap,

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: new FloatingActionButton(
                      onPressed: onMapTypeButtonPressed,
                      child: new Icon(
                        Icons.map,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ));
  }

}
