import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';
import 'loading_animation.dart';
import 'package:flutter_url_image_load_fail/flutter_url_image_load_fail.dart';

class LoadingImage {

  static Widget extendedImage (BuildContext context,{String url,double loading_size,double width,double height}){

    bool isLoaded=false;

    return
      ProgressiveImage(
        placeholder: AssetImage( "assets/images/loading.gif"),
        // size: 1.87KB
        thumbnail: NetworkImage(url),
        // size: 1.29MB
        image: NetworkImage(url), height: height??400,width: width??300,
      );
    /*return LoadImageFromUrl(
        url, //Image URL to load
    (image) {
      isLoaded=true;
          image;}, //What widget returns when the image is loaded successfully
    () => LoadingAnimation.stillLoading(size: loading_size==null?20:loading_size), //What widget returns when the image is loading
            (IRetryLoadImage retryLoadImage, code , message){ //What widget returns when the image failed to load
         if(!isLoaded){
           return RaisedButton(
             child: Center(child: Text(AppLocalizations.of(context).click_load_image_again_txt,style: AppTheme.subtitleInfo,)),
             onPressed: (){
               retryLoadImage.retryLoadImage(); //Call this method to retry load the image when it failed to load
             },
           );
         }

        },
        requestTimeout: Duration(seconds: 5), //Optionally set the timeout
    );*/
  }
}