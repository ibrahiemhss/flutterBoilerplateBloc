import 'package:clay_containers/clay_containers.dart';
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectProvincesWidget extends StatelessWidget {
  String selctedProvinceId = "0";
  String selectedCityId = "0";
  String selctedProvince;
  String selectedCity;
  String lastSelectedFromIraq;
  void Function(String selectedProvince,int selctedProvinceId,String selectedCity, int selectedCityId, Color selectedColor,{double lat,double long})
  getSelectedValues = (p1,p2,s1, s2, c,{lat,long}) {};

  Color cityColor;
  SelectProvincesWidget({Key key,
     @required this.lastSelectedFromIraq,
     @required this.cityColor,
     @required this.getSelectedValues,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _selectIraqProvincesWidget(context);
  }

  Widget _selectIraqProvincesWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
        child: ClayContainer(
          curveType: CurveType.none,
          color: AppTheme.white,
          child: RawMaterialButton(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: const Icon(
                        Icons.location_city,
                        color: AppTheme.primaryDark,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                        lastSelectedFromIraq == "" ? AppLocalizations.of(context).select_province_city_txt : lastSelectedFromIraq,
                        style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: -0.05,
                            color: cityColor)),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppTheme.primaryDark,
                      size: 16.0,
                    ),
                  ),
                ],
              ),
            ),

            onPressed: () async {
              _showIraqProvines(context);
            }, //onPressed,
          ),
        ));
  }

 //=============================================================================
 Future<Null> _showIraqProvines(BuildContext context) async {
   await showDialog<int>(
       context: context,
       builder: (BuildContext context) {
         return Theme(
             data: Theme.of(context)
                 .copyWith(dialogBackgroundColor: Colors.transparent),
             child: Dialog(child: _dialogsIraqProvincesWidget(context)));
       });

 }
 Widget _dialogsIraqProvincesWidget(BuildContext context) {
   return Container(
     color: Colors.transparent,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisSize: MainAxisSize.max,
       children: <Widget>[
         Padding(
           padding: const EdgeInsets.only(left: 8.0, right: 8.0),
           child: Text(AppLocalizations.of(context).provinces_txt,
               style: TextStyle(
                   fontFamily: AppTheme.fontName,
                   fontWeight: FontWeight.w400,
                   fontSize: 16,
                   letterSpacing: -0.05,
                   color: AppTheme.goldenDark)),
         ),
//------------------------------------------------------------------------------
         //_citiesCardListItem(context)

//------------------------------------------------------------------------------
       ],
     ),
   );
 }

}
