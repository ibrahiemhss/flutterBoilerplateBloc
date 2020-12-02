
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';

import 'loading_animation.dart';
import 'loading_image.dart';

class ShowImageDialog extends StatefulWidget {
  final String apiUrl;
  final String imgUrl;
  final bool isBase64;

  const ShowImageDialog({
    Key key,
    @required this.imgUrl,
    this.apiUrl = '',
    this.isBase64 = false,
  }) : super(key: key);

  @override
  ShowImageDialogState createState() => ShowImageDialogState();
}

class ShowImageDialogState extends State<ShowImageDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  Widget get _loadingWidget {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: LoadingAnimation.stillLoading(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    double _container_height;
    double _container_width;
    final mediaQueryData = MediaQuery.of(context);

    if (mediaQueryData.orientation == Orientation.landscape) {
      _container_height = MediaQuery.of(context).size.width /0.5;
      _container_width = MediaQuery.of(context).size.height / 0.2;

    }else{
      _container_height = MediaQuery.of(context).size.height /0.5;
      _container_width = MediaQuery.of(context).size.width /0.2;

    }


    return Material(
      color: Colors.transparent,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              body:
                    Center(
                      child: Container(
                          width: _container_width,
                          height: _container_height,
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(5.0),
                          //color: Colors.transparent,
                          decoration: ShapeDecoration(
                            color: Colors.transparent.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          child:

                          ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(AppLocalizations.of(context).click_on_image_to_zoom_txt,style: AppTheme.title,),
                              ),

                             GestureZoomBox(
                                    maxScale: 5.0,
                                    doubleTapScale: 2.0,
                                    duration: Duration(milliseconds: 200),
                                    onPressed: () => Navigator.pop(context),
                                    child:

                                    LoadingImage.extendedImage(
                                      context,
                                        url:"${widget.apiUrl}${widget.imgUrl}"
                                    ,loading_size: 50),




                                   /* MeetNetworkImage(
                                      //fit: BoxFit.cover,
                                      imageUrl: "${widget.apiUrl}${widget.imgUrl}",
                                      loadingBuilder: (context) => Center(
                                          child: LoadingAnimation.stillLoading()(
                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                AppTheme.greyLight,
                                              ))),
                                      errorBuilder: (context, e) => Center(
                                        child: Image.network(
                                          "${widget.apiUrl}${widget.imgUrl}",
                                        ),
                                      ),

                                  ),*/
                                ),

                            ],
                      )
                  ),
                ),
              ),
            ),
        ),
      ),
    );
  }
}
