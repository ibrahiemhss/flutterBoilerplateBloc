
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/locale_helper.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/translations.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/fcm_notification_model.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_widgets/bloc_state_builder.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/decision_bloc/decision_bloc.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/decision_bloc/decision_event.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/decision_bloc/decision_state.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../../injection_container.dart';
import 'enter_screen.dart';
import 'package:flutterBoilerplateWithbloc/routing/router.dart';
import 'message_dialog.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class DecisionPage extends StatefulWidget {
  final String locale;

  const DecisionPage({Key key, @required this.locale}) : super(key: key);

  @override
  DecisionPageState createState() {
    return new DecisionPageState();
  }
}

class DecisionPageState extends State<DecisionPage>
    with TickerProviderStateMixin {
  DecisionBloc _bloc = sl<DecisionBloc>();

  //----------------------------------------------------------------------------
  /// Functions to set local languages with [SpecificLocalizationDelegate]
  //----------------------------------------------------------------------------
  SpecificLocalizationDelegate _specificLocalizationDelegate;
  bool isRtl = false;

  /// initializes Socket Controller and Connects to Server.
  onLocaleChange(Locale locale) {
    _bloc.changeLanguage(locale);
    // _bloc.emitEvent(DecisionEventChangeLoanuage(locale: widget.locale ));
  }

  _onLocaleChanged() async {
    // do anything you need to do if the language changes
    print('Language has been changed to: ${allTranslations.currentLanguage}');
  }

  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------

  bool isLogedIn;
  bool isFirstInter;
  EnterModel _enterModel;
  DataEntry _dataEntry;
  DecisionState oldDecisionState;
  AnimationController _breathingController;
  var _breathe = 0.0;
  AnimationController _angleController;
  var _angle = 0.0;
  bool _isloadingState = true;
  bool _loadingLists=true;
  FcmNotificationModel _fcmNotification;

//==============================================================================
//==============================================================================

  @override
  void initState() {
    _bloc.emitEvent(DecisionEventLoad(locale: widget.locale));
    helper.onLocaleChanged = onLocaleChange;
    allTranslations.onLocaleChangedCallback = _onLocaleChanged;

    if (widget.locale != null) {
      print("MY language is ===================>0 ${widget.locale}");
      _specificLocalizationDelegate =
          SpecificLocalizationDelegate(new Locale(widget.locale));
    } else {
      _specificLocalizationDelegate =
          SpecificLocalizationDelegate(new Locale("ar"));
    }

    if (_specificLocalizationDelegate.overriddenLocale.toString() == "it" ||
        _specificLocalizationDelegate.overriddenLocale.toString() == "en") {
      isRtl = false;
      print(
          "==========================OverriddenLocale left to right=================== ${_specificLocalizationDelegate.overriddenLocale}");
    } else {
      isRtl = true;
      print(
          "==========================OverriddenLocale rihgt to left =================== ${_specificLocalizationDelegate.overriddenLocale}");
    }
    super.initState();
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

  @override
  dispose() {
    // _breathingController.dispose();
    // _angleController.dispose();
    super.dispose();
  }

//==============================================================================
//==============================================================================

  @override
  Widget build(BuildContext context) {
    return BlocEventStateBuilder<DecisionState>(
        bloc: _bloc,
        builder: (BuildContext context, DecisionState state) {
          if (state != oldDecisionState) {
            if (!state.loading) {
              print("LOADING state finish ");

              _isloadingState = false;
              _enterModel = state.enterModel;
              _dataEntry = state.dataEntry;
            } else {
              print("LOADING state still...... ");

              _isloadingState = true;
            }
          } else {
            print("LOADING state still2...... ");

            _isloadingState = true;
          }
          return bodyContent(context);
        });
  }

//==============================================================================
//==============================================================================

  Widget animationIcon() {
    final size = 200.0 - 20.0 * _breathe;
    return Center(
      child: Container(
        width: size,
        height: size,
        child: Transform.rotate(
          angle: 0 / 360 * pi * 2, //45 degree in radius
          child: Image.asset(
            "assets/images/icon_ar.png",
            fit: BoxFit.fitHeight,
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }

//==============================================================================
//==============================================================================

  Widget animationText() {
    return TextLiquidFill(
      text: 'حجوزاتى',
      waveDuration: Duration(milliseconds: 10000),
      waveColor: AppTheme.primaryDark,
      boxBackgroundColor: AppTheme.accentColor,
      textStyle: TextStyle(
        color: AppTheme.white,
        fontSize: 80.0,
        fontWeight: FontWeight.bold,
      ),
    );

    /*   return TypewriterAnimatedTextKit(
        //duration: Duration(milliseconds: 2000),
        totalRepeatCount: 4,
        pause: Duration(milliseconds:  1000),
        text: ["حجوزاتى"],
        textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
       // pause: Duration(milliseconds: 1000),
        displayFullTextOnTap: true,
        stopPauseOnTap: true
    );*/
  }

//==============================================================================
//==============================================================================

  bodyContent(BuildContext context) {
    return StreamBuilder<UiAction>(
        stream: _bloc.getUiActions,
        builder: (BuildContext context, snapshot) {
          print("locale from DecisionEvent =${widget.locale??"null"} ");
          // _blocUiListener(context, _bloc);
          if (_enterModel == null) {

            _isloadingState = true;
            print("LOADING STREAM NULL ");

          } else {
            print("LOADING STREAM HAVE DATA ");

            _isloadingState = false;
          }

          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              new FallbackCupertinoLocalisationsDelegate(),
              //app-specific localization
              _specificLocalizationDelegate
            ],
            // navigatorObservers: [routeObserver],
            supportedLocales: allTranslations.supportedLocales(),
            locale: _specificLocalizationDelegate.overriddenLocale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              canvasColor: AppTheme.backgroundColor,
              primarySwatch: Colors.blue,
              textTheme: AppTheme.textTheme,
              platform: TargetPlatform.iOS,
            ),
            home:
            Directionality( // add this
              textDirection:isRtl?TextDirection.rtl:TextDirection.ltr,
              child: _isloadingState?
              Scaffold(
                  backgroundColor: AppTheme.accentColor,
                  body: Center(child: animationText())):
              RouteAwareWidget(
                  '/enter',
                  routeObserver,
                  child: EnterScreen(
                    loadingData: _isloadingState,
                    dataEntry: _dataEntry,
                    enterModel: _enterModel,
                    bloc: _bloc,
                  )
              ),
            ),
            routes: {
              '/enter': (context) => EnterScreen(
                loadingData: _isloadingState,
                dataEntry: _dataEntry,
                enterModel: _enterModel,
                bloc: _bloc,
              ),

            },
          );
        });
  }

//==============================================================================
//==============================================================================

  void _blocUiListener(BuildContext context, DecisionBloc bloc) {
    final actionListener = (UiAction action) {
      if (action.action == DESISION_ACTIONS.showFcmDialog.index) {
        _fcmNotification=action.value;
        showSimpleFlushbar();
      } else if (action.action == DESISION_ACTIONS.navigateToItemDetail.index) {
        _fcmNotification=action.value;
        _navigateToItemDetail(action.value);
      }  else if (action.action == DESISION_ACTIONS.loadingLists.index) {
        _loadingLists = true;
      } else if (action.action == DESISION_ACTIONS.loadedLists.index) {
        _loadingLists = false;
      }else if (action.action == DESISION_ACTIONS.onChangeLangauge.index) {
        _specificLocalizationDelegate =
        new SpecificLocalizationDelegate(action.value);
        if (_specificLocalizationDelegate.overriddenLocale.toString() == "it" ||
            _specificLocalizationDelegate.overriddenLocale.toString() == "en") {
          isRtl = false;
          print(
              "==========================OverriddenLocale left to right=================== ${_specificLocalizationDelegate.overriddenLocale}");
        } else {
          isRtl = true;
          print(
              "==========================OverriddenLocale rihgt to left =================== ${_specificLocalizationDelegate.overriddenLocale}");
        }
      }
    };
    bloc.getUiActions.listen(actionListener);
  }
  //==============================================================================
//==============================================================================
  void showSimpleFlushbar() {
    print("title = ${_fcmNotification.messageTitle}  body = ${_fcmNotification.messageBody}");
  }

//==============================================================================
//==============================================================================

  void _navigateToItemDetail(FcmNotificationModel fcmNotification) {
    if (fcmNotification != null) {
      if (int.parse(fcmNotification.typeKey) ==
         // FCMpayload.APPOINTMENT_REQUEST) {
        // Navigator.pushNamed(context, Routes.REQUEST_NEW_APPOINTMENT_SCREEN);
        Navigator.pushNamed(context, '/request'));
      }
    }

}
