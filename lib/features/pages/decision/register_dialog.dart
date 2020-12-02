
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/core/util/redirect.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/base_button.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/gradient_button.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/Authentication/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterDialog extends StatefulWidget {
  final EnterModel enterModel;
  final DataEntry dataEntry;

  const RegisterDialog({@required this.enterModel,@required this.dataEntry}) ;

  @override
  State<StatefulWidget> createState() => RegisterDialogState();
}

class RegisterDialogState extends State<RegisterDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

//==============================================================================
//==============================================================================

  @override
  void initState() {
    super.initState();
    //AppSharedPreferences.setFirstInter(true);

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
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree

    controller.dispose();

    super.dispose();
  }

//==============================================================================
//==============================================================================

  @override
  Widget build(BuildContext context) {

    double _button_width;

    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      _button_width = MediaQuery.of(context).size.height / 1.1;
    } else {
      _button_width = MediaQuery.of(context).size.width / 1.1;
    }
    return Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Center(
              child: Container(
                  margin: EdgeInsets.only(top:20.0,right: 8,left: 8,bottom: 4.0),
                 // padding: EdgeInsets.all(8.0),
                  //  height: _container_height,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  child: Padding(
                    padding: const EdgeInsets.only(top:20.0,left: 8,right: 8),
                    child: ListView(
                     shrinkWrap: true,
                      children: <Widget>[
                        //------------------------------------------------------------------------------

                        CommonGradientButton(
                            width: _button_width,
                            text: AppLocalizations.of(context).register_as_patient_txt,
                            onPressed: () {
//------------------------------------------------------------------------------
                              Redirect.toPage(
                                  context, SignUpPage(
                                fromBack: false,
                                user_type_id:TypeOfUsers.USER_TYPE,
                                enterModel: widget.enterModel,
                                dataEntry: widget.dataEntry,
                                entering_case: EventTtransactionsConstants.FROM_SIGNUP_SCREEN,
                                userModel: null,
                              ));
//------------------------------------------------------------------------------
                            },

                        ),

                        CommonGradientButton(
                              width: _button_width,
                              text: AppLocalizations.of(context).register_as_doctor_txt,
                              onPressed: () {
//------------------------------------------------------------------------------

                                Redirect.toPage(context, SignUpPage(
                                  fromBack: false,
                                  user_type_id:TypeOfUsers.USER_TYPE,
                                  enterModel: widget.enterModel,
                                  dataEntry: widget.dataEntry,
                                  entering_case: EventTtransactionsConstants.FROM_SIGNUP_SCREEN,
                                  userModel: null,
                                ));
                              }
                        ),

                        CommonGradientButton(
                              width: _button_width,
                              text: AppLocalizations.of(context).register_as_pharmacist_txt,
                              onPressed: () {
//------------------------------------------------------------------------------
                                Redirect.toPage(context, SignUpPage(
                                  fromBack: false,
                                  user_type_id:TypeOfUsers.USER_TYPE,
                                  enterModel: widget.enterModel,
                                  dataEntry: widget.dataEntry,
                                  entering_case: EventTtransactionsConstants.FROM_SIGNUP_SCREEN,
                                  userModel: null,
                                ));
                              }
                        ),

                        CommonGradientButton(
                              width: _button_width,
                              text: AppLocalizations.of(context).register_as_medical_assistant_txt,
                              onPressed: () {
//------------------------------------------------------------------------------
                                Redirect.toPage(context, SignUpPage(
                                  fromBack: false,
                                  user_type_id:TypeOfUsers.USER_TYPE,
                                  enterModel: widget.enterModel,
                                  dataEntry: widget.dataEntry,
                                  entering_case: EventTtransactionsConstants.FROM_SIGNUP_SCREEN,
                                  userModel: null,
                                ));
                              }
                        ),
//------------------------------------------------------------------------------
                        BaseButton(
                            light_color: AppTheme.redLight,
                              dark_color: AppTheme.redDark,
                              width: _button_width,
                              text: AppLocalizations.of(context).cancel_txt,
                              onPressed: () {
                                Navigator.of(context).pop(true);

                              }),

//------------------------------------------------------------------------------

                      ],

                    ),
                  ))),
        )

      //=============

    );
  }
}
