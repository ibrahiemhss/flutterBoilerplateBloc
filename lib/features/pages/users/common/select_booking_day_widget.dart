import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectBookingDayWidget extends StatelessWidget {
  String selectedDay;
  int dayIndex;
  final Color dayColor;
  void Function({String selectedDay,int dayIndex, Color dayColor})
  getSelectedValues = ({selectedDay,dayIndex,dayColor}) {};

  SelectBookingDayWidget({Key key,
    @required this.dayColor,
    @required this.getSelectedValues,
    @required this.selectedDay}) : super(key: key);

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
                      Icons.calendar_today,
                      color: AppTheme.primaryDark,
                    )),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                      selectedDay ==""? AppLocalizations.of(context).select_working_day_txt:selectedDay
                          ,
                      style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          letterSpacing: -0.05,
                          color: dayColor)),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0),
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
            _showListDay(context);
          },

          //onPressed,
        ),
      ),
    );
  }

  Future<Null> _showListDay(BuildContext context) async {
    List<String> _listDays = [
      AppLocalizations.of(context).saturday_txt,
      AppLocalizations.of(context).sunday_txt,
      AppLocalizations.of(context).monday_txt,
      AppLocalizations.of(context).tuesday_txt,
      AppLocalizations.of(context).wednesday_txt,
      AppLocalizations.of(context).thursday_txt,
      AppLocalizations.of(context).friday_txt
    ];

    await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: Text(
              AppLocalizations.of(context).the_days_txt,
              textAlign: TextAlign.center,
            ),
            children: _listDays.map((value) {
              return new SimpleDialogOption(
                onPressed: () {
                  selectedDay = (value); //.day_of_week;

                  dayIndex = _listDays.indexOf(value) + 1;

                  getSelectedValues(selectedDay:selectedDay,dayIndex:dayIndex,dayColor:dayColor);
                  Navigator.pop(
                      context,
                      _listDays.indexOf(
                          value)); //here passing the index to be return on item selection
                },
                child: new Text(value, //.day_of_week,
                    textAlign: TextAlign.center), //item value
              );
            }).toList(),
          );
        });
  }
}
