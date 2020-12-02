
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/locale_helper.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/setting_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../injection_container.dart';
import 'helper/UiAction.dart';

class ChangeLangDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChangeLangDialogState();
}

class ChangeLangDialogState extends State<ChangeLangDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  SettingsBloc _bloc = sl<SettingsBloc>();

//==============================================================================
//==============================================================================
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
    });

    controller.forward();
  }
//==============================================================================
//==============================================================================

  @override
  void didChangeDependencies() {
    _blocUiListener(context, _bloc);
    super.didChangeDependencies();
  }
//==============================================================================
//==============================================================================

  void _blocUiListener(BuildContext context, SettingsBloc bloc) {
    final actionListener = (UiAction action) {
      if (action.action == SETTINGS_ACTIONS.onChangeLanguage.index) {
      //  print("changed language =${action.value}");
      //  helper.onLocaleChanged(new Locale(action.value));

      }
    };
    bloc.getUiActions.listen(actionListener);
  }
//==============================================================================
//==============================================================================
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<UiAction>(
        stream: _bloc.getUiActions,
        builder: (BuildContext context, snapshot) {
         // _blocUiListener(context, _bloc);

          return buildContent(context);
        });
  }

//==============================================================================
//==============================================================================

  Widget buildContent(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(15.0),
              height: 400.0,
              decoration: ShapeDecoration(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: ListView(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ButtonTheme(
                          buttonColor: AppTheme.white,
                            child: RaisedButton(
                          // color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: AppTheme.goldenDarker)

                          ),
                          splashColor: Colors.white.withAlpha(40),
                          child: Text(
                            AppLocalizations.of(context).arabic_txt,
                            textAlign: TextAlign.center,
                            style: AppTheme.accentHeadline,
                          ),
                          onPressed: () {
                            _bloc.changeLanguage("ar");
                            Navigator.of(context)
                                .pop();
                          },
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ButtonTheme(
                            buttonColor: AppTheme.white,
                            child: RaisedButton(
                              // color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: AppTheme.goldenDarker)

                              ),
                              splashColor: Colors.white.withAlpha(40),
                              child: Text(
                                AppLocalizations.of(context).kurdish_txt,
                                textAlign: TextAlign.center,
                                style: AppTheme.accentHeadline,
                              ),
                              onPressed: () {
                                _bloc.changeLanguage("ckb");
                                Navigator.of(context)
                                    .pop();
                              },
                            )),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ButtonTheme(
                              buttonColor: AppTheme.white,
                              child: RaisedButton(
                            //color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: AppTheme.goldenDarker)
                            ),
                            splashColor: Colors.white.withAlpha(40),
                            child: Text(
                              AppLocalizations.of(context).english_txt,
                              textAlign: TextAlign.center,
                             style: AppTheme.accentHeadline,
                            ),
                            onPressed: () {
                             _bloc.changeLanguage("en");
                             Navigator.of(context)
                                 .pop();
                            },
                          ))),

                      Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ButtonTheme(
                              buttonColor: AppTheme.white,
                              child: RaisedButton(
                                //color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(18.0),
                                    side: BorderSide(color: AppTheme.goldenDarker)
                                ),
                                splashColor: Colors.white.withAlpha(40),
                                child: Text(
                                  AppLocalizations.of(context).italy_txt,
                                  textAlign: TextAlign.center,
                                  style: AppTheme.accentHeadline,
                                ),
                                onPressed: () {
                                  _bloc.changeLanguage("it");
                                  Navigator.of(context)
                                      .pop();

                                },
                              ))),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
