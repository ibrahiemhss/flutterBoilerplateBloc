import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/core/util/redirect.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/decision_bloc/decision_bloc.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/app_custom_painted_shape.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/gradient_button.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/Authentication/sign_in_page.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/decision/register_dialog.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/users/main_user_page.dart';
import 'package:flutter/material.dart';

import '../../../injection_container.dart';

class WelcomePage extends StatefulWidget {
 final EnterModel enterModel;
 final DataEntry dataEntry;
   WelcomePage({@required this.enterModel,@required this.dataEntry}) ;
  @override
  createState() => _WelcomePageState();

}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {

  EnterModel _enterModel;
  DecisionBloc _bloc = sl<DecisionBloc>();

  AnimationController animationController;
  Animation animation;
  int currentState = 0;

//==============================================================================
//==============================================================================

  @override
  void initState() {
    print("locale in WelcomePage =${widget.enterModel.locale} ");
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 500),vsync: this);
    animation = Tween(begin: 0,end: 60).animate(animationController)..addListener((){
    });
  }

//==============================================================================
//==============================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.center,
         // height: 300,

          child:
//------------------------------------------------------------------------------
              ListView(
            children: <Widget>[
              DrCustomPaintedShape(),
              CommonGradientButton(
                  width: 150,
                  text: AppLocalizations.of(context).log_in_txt,
                  onPressed: () {
//------------------------------------------------------------------------------
                    _bloc.setFirstEnter();
                    Redirect.toPage(context, SignInPage(enterModel: widget.enterModel,dataEntry: widget.dataEntry,));
                  },

              ),

//------------------------------------------------------------------------------
             //  SizedBox(child: RadialMenu()),

              CommonGradientButton(
                  width: 150,
                  text: AppLocalizations.of(context).new_registration_txt,
                  onPressed: () {
                    _bloc.setFirstEnter();
//------------------------------------------------------------------------------
                    showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return RegisterDialog(enterModel:widget.enterModel,dataEntry: widget.dataEntry,);
                        });
//------------------------------------------------------------------------------
                  },

              ),

              CommonGradientButton(
                width: 150,
                text: AppLocalizations.of(context).skip_txt,
                onPressed: () {
                 // AppSharedPreferences.setFirstInter(true);
//------------------------------------------------------------------------------
                  _bloc.setFirstEnter();

                  Redirect.toPage(context, MainUserPage(
                    fromBack: false,
                    pagId: 0,
                    enterModel: widget.enterModel, dataEntry: widget.dataEntry,
                  ));
//------------------------------------------------------------------------------
                },
              )
            ],
          ),
//------------------------------------------------------------------------------
        ),
      ),
    );
  }

//==============================================================================
//==============================================================================

  void showLogInWith() {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('',
              style: TextStyle(
                  fontSize: 24.0,
                  color: AppTheme.redDark,
                  fontWeight: FontWeight.w900)),
          actions: <Widget>[
            FlatButton(
              child: Text(AppLocalizations.of(context).confirm_txt),
              onPressed: () {

              },
            ),
            FlatButton(
              child: Text(AppLocalizations.of(context).ignore_txt),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

//==============================================================================
//==============================================================================

  void showSignUpInWith() {
    showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('',
              style: TextStyle(
                  fontSize: 24.0,
                  color: AppTheme.redLight,
                  fontWeight: FontWeight.w900)),
          actions: <Widget>[
            FlatButton(
              child: Text(AppLocalizations.of(context).confirm_txt),
              onPressed: () {



              },
            ),
            FlatButton(
              child: Text(AppLocalizations.of(context).ignore_txt),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

//==============================================================================
//==============================================================================

  void _redirectToPage(BuildContext context, Widget page){
    WidgetsBinding.instance.addPostFrameCallback((_){
      MaterialPageRoute newRoute = MaterialPageRoute(
          builder: (BuildContext context) => page
      );

      Navigator.of(context).pushAndRemoveUntil(newRoute, ModalRoute.withName('/decision'));
    });
  }
}
