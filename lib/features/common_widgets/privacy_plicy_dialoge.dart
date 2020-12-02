
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/authentication_bloc/sign_up_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../../injection_container.dart';
import 'helper/UiAction.dart';
import 'loading_animation.dart';


class PrivacyPolicyDialog extends StatefulWidget {
  final String locale;
  PrivacyPolicyDialog(this.locale);
  @override
  State<StatefulWidget> createState() => PrivacyPolicyDialogState();
}

class PrivacyPolicyDialogState extends State<PrivacyPolicyDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  SignUpBloc _bloc=sl<SignUpBloc>();
  String title;
  String body='';

  bool checkedValue=true;
  bool _isLoading=true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //==============================================================================
//==============================================================================


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bloc == null) {
      //SchedulerBinding.instance.addPostFrameCallback((_) => _bloc.isUserSignedIn());
      _blocUiListener(context,_bloc);
    }
  }

//==============================================================================
//==============================================================================

  void _blocUiListener(BuildContext context, SignUpBloc bloc) {
    final actionListener = (UiAction action) {
      if (action.action == SIGNUP_ACTIONS.loadingPrivacyPolicy.index) {
        _isLoading=true;

      }
      else if (action.action == SIGNUP_ACTIONS.loadedPrivacyPolicy.index) {
        _isLoading=false;
        body=action.value;

      } else if (action.action == SIGNUP_ACTIONS.noInternet.index) {
        Toast.show(AppLocalizations.of(context).no_internet_txt, context);
      } else if (action.action == SIGNUP_ACTIONS.error.index) {
        Toast.show(action.value, context);

      }
    };
    bloc.getUiActions.listen(actionListener);
  }

//==============================================================================
//==============================================================================

  @override
  void initState() {
    super.initState();
      getData();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }
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
    return StreamBuilder<UiAction>(
        stream: _bloc.getUiActions,
        builder: (BuildContext context, snapshot) {
          _blocUiListener(context,_bloc);
          return buildContent(context);
        });

  }

//==============================================================================
//==============================================================================

  Widget buildContent(BuildContext context) {

    double _containe_text_width;
    double _containe_height;
    title=AppLocalizations.of(context).privacy_policy_txt;

    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      _containe_height = MediaQuery.of(context).size.width / 1.1;
      _containe_text_width = MediaQuery.of(context).size.height / 1.2;

    } else {
      _containe_height = MediaQuery.of(context).size.height / 1.1;
      _containe_text_width = MediaQuery.of(context).size.width / 1.2;

    }

    return Material(
      color: Colors.transparent,
      child: ScaleTransition(
          scale: scaleAnimation,
          child:
          Padding(
            padding: const EdgeInsets.only(top:32.0),
            child: Center(
              child: Container(
                // height: _containe_height,
                  child:
                  Scaffold(
                    key: _scaffoldKey,
                    backgroundColor: Colors.transparent,
                    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
                    floatingActionButton: FloatingActionButton.extended(

                      label: Text(AppLocalizations.of(context).close_txt),
                      icon:  Icon(Icons.close), onPressed: ()  {
                      Navigator.of(context).pop(true);

                      ///
                      ///
                      ///TODO ----------------------------------------------------
                    },),
                    body:/* _isLoading
                      ? new Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: new LoadingAnimation.stillLoading()(
                        valueColor:
                        new AlwaysStoppedAnimation<Color>(AppTheme.primary),
                      ),
                    ),
                  )
                      :*/ Container(
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.all(15.0),
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        child: ListView(

                          shrinkWrap: true,
                          children: <Widget>[

                          Container(),

                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[

                                Text(AppLocalizations.of(context).privacy_policy_txt,
                                    textAlign: TextAlign.center,
                                    style: AppTheme.title),

                                _isLoading?
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: LoadingAnimation.stillLoading(),
                                ):

                                 Text(body??"", style: AppTheme.subtitle),

                              ],
                            ),
                            /* ButtonTheme(
                                  child: RaisedButton(
                                    //color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0)),
                                    splashColor: Colors.white.withAlpha(40),
                                    child: Text(
                                      'تراجع',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop(true);

                                    },
                                  ))*/
                          ],
                        )),
                  )
              ),
            ),
          )


        //=============
      ),

    );
  }


//==============================================================================
//==============================================================================
  Future<String> getData() async {
    _bloc.getPrivacyPolicy(
      locale:widget.locale,
    );
  }

}
