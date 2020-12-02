import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectPriceWidget extends StatelessWidget {
  String selectedPrice;
  final Color priceColor;
  int priceIndex;

  void Function({String selectedPrice, Color priceColor})
  getSelectedValues = ({selectedPrice, priceColor}) {

      };

  SelectPriceWidget(
      {Key key, @required this.selectedPrice,
        @required this.getSelectedValues,
        @required this.priceColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _contentWidget(context);
  }

  Widget _contentWidget(BuildContext context) {
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
                    Icons.attach_money,
                    color: AppTheme.primaryDark,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                        selectedPrice ==""? AppLocalizations.of(context).select_price_txt:selectedPrice,
                        style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: -0.05,
                            color: priceColor)),
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
              _showListPrices(context);
            },

            //onPressed,
          ),
        ));
  }

//=============================================================================

  Future<Null> _showListPrices(BuildContext context) async {
    List<String> _listPrices = [
      AppLocalizations.of(context).three_th_IQD_txt,
      AppLocalizations.of(context).five_th_IQD_txt,
      AppLocalizations.of(context).ten_th_IQD_txt,
      AppLocalizations.of(context).fifteen_th_IQD_txt,
      AppLocalizations.of(context).twenty_th_IQD_txt,
      AppLocalizations.of(context).twenty_five_th_IQD_txt,
      AppLocalizations.of(context).thirty_th_IQD_txt,
      AppLocalizations.of(context).thirty_five_th_IQD_txt,
      AppLocalizations.of(context).forty_th_IQD_txt,
      AppLocalizations.of(context).forty_five_th_IQD_txt,
      AppLocalizations.of(context).fifty_th_IQD_txt,
      AppLocalizations.of(context).sixty_th_IQD_txt,
      AppLocalizations.of(context).seventy_th_IQD_txt,
      AppLocalizations.of(context).eighty_th_IQD_txt,
      AppLocalizations.of(context).ninety_th_IQD_txt,
      AppLocalizations.of(context).hundred_th_IQD_txt
    ];
      List<String> _listNumbersPrices = [
        "3000",
        "5000",
        "10000",
        "15000",
        "20000",
        "25000",
        "30000",
        "35000",
        "40000",
        "45000",
        "50000",
        "60000",
        "70000",
        "80000",
        "90000",
        "100000"
      ];


    await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: Text(
              AppLocalizations.of(context).select_price_txt,
              textAlign: TextAlign.center,
            ),
            children: _listNumbersPrices.map((value) {
              return new SimpleDialogOption(
                onPressed: () {

                  selectedPrice = (value); //.day_of_week;
                  priceIndex = _listPrices.indexOf(value) + 1;
                  print(
                      'selectedPrice SelectedValues============${selectedPrice}');

                  getSelectedValues(
                    selectedPrice:selectedPrice,
                    priceColor:priceColor,
                  );
                  Navigator.pop(
                      context,
                      _listPrices.indexOf(
                          value)); //here passing the index to be return on item selection
                },
                child: new Text("$value ${AppLocalizations.of(context).IQD_txt}", //.day_of_week,
                    textAlign: TextAlign.center), //item value
              );
            }).toList(),
          );
        });
  }
}
