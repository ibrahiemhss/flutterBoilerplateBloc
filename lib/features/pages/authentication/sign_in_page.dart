import 'dart:io';

import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/core/util/redirect.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/authentication_bloc/sign_in_bloc.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/app_outLine_Button.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/base_app_bar.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/gradient_button.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/my_text_field.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/no_internet_widget.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/decision/register_dialog.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/decision/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:getflutter/components/appbar/gf_appbar.dart';
import 'package:tip_dialog/tip_dialog.dart';
import '../../../injection_container.dart';

class SignInPage extends StatefulWidget {
  final EnterModel enterModel;
  final DataEntry dataEntry;

  const SignInPage({Key key, this.enterModel, this.dataEntry})
      : super(key: key);
  @override
  createState() {
    return SignInPageState();
  }
}

class SignInPageState extends State<SignInPage> {
  SignInBloc _bloc = sl<SignInBloc>();
  final globalKey = new GlobalKey<ScaffoldState>();
  TextEditingController userNameController =
      new TextEditingController(text: '');
  TextEditingController passwordController =
      new TextEditingController(text: "");
  TextDirection textDirection1 = TextDirection.rtl;
  bool _isThereInternet = true;

//==============================================================================
//==============================================================================
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bloc == null) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => _bloc.isUserSignedIn());
      _blocUiListener(context, _bloc);
    }
  }
//==============================================================================
//==============================================================================

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
//==============================================================================
//==============================================================================

  void _blocUiListener(BuildContext context, SignInBloc bloc) {
    final actionListener = (UiAction action) {
      if (action.action == SIGNING_ACTIONS.loadingSignIn.index) {
        if (mounted) {
          TipDialogHelper.loading(
              AppLocalizations.of(context).submission_in_progress_txt);
        }
      } else if (action.action == SIGNING_ACTIONS.noInternet.index) {
        globalKey.currentState.showSnackBar(new SnackBar(
          content: new Text(AppLocalizations.of(context).no_internet_txt),
        ));
      } else if (action.action == SIGNING_ACTIONS.warningSnackBar.index) {
        globalKey.currentState.showSnackBar(new SnackBar(
          content: new Text(action.value),
        ));
      } else if (action.action == SIGNING_ACTIONS.loadedSignIn.index) {
        if (mounted) {
          TipDialogHelper.success(AppLocalizations.of(context).done_txt);
        }
        globalKey.currentState.showSnackBar(new SnackBar(
          content: new Text(action.value),
        ));
      } else if (action.action == SIGNING_ACTIONS.error.index) {
        if (mounted) {
          TipDialogHelper.dismiss();
        }
        globalKey.currentState.showSnackBar(new SnackBar(
          content: new Text(action.value),
        ));
      }
    };
    bloc.getUiActions.listen(actionListener);
  }

//==============================================================================
//==============================================================================

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UiAction>(
        stream: _bloc.getUiActions,
        builder: (BuildContext context, snapshot) {
          _blocUiListener(context, _bloc);
          return buildContent(context);
        });
  }

//==============================================================================
//==============================================================================

  Widget buildContent(BuildContext context) {
    return new Scaffold(
        key: globalKey,
        appBar: myAppBar(context),
        body: !_isThereInternet
            ? NoInternetWidget(
                onRefresh: () {},
              )
            : Stack(
                children: <Widget>[
                  TipDialogContainer(duration: const Duration(seconds: 2))
                ],
              ));
  }

//==============================================================================
//==============================================================================

  void showErrorMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
        //  content: Text(AppLocalizations.of(context).unexpected_error_occurred_try_again_txt),
        content: Text(message),
        duration: new Duration(seconds: 2));
    Scaffold.of(context).showSnackBar(snackBar);
  }



//==============================================================================
//==============================================================================

  Widget _formContainer(BuildContext context) {
    return SingleChildScrollView(
      child: new Container(
        margin: EdgeInsets.fromLTRB(24, 20, 24, 20),
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppTheme.greyLight,
              offset: Offset(0.0, 3.0),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: new Form(
            child: new Theme(
                data: new ThemeData(primarySwatch: Colors.blue),
                child: new Column(
                  children: <Widget>[
//------------------------------------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/icon_ar.png",
                        fit: BoxFit.fitHeight,
                        height: 100,
                        width: 100,
                      ),
                    ),
//------------------------------------------------------------------------------
                    Divider(
                      height: 20,
                      color: Colors.transparent,
                    ),
                    _UserNameContainer(context),
//------------------------------------------------------------------------------

                    /* new Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextField(
                          textAlign: TextAlign.start,
                          controller: userNameController,
                          autoFocus: true,
                          decoration: new InputDecoration(
                              labelText: "افزودن کتاب",
                              hintText: "نام کتاب را وارد کنید"
                          ),
                        )),
              */
                    _PasswordContainer(context),
//------------------------------------------------------------------------------
                    //         _passwordContainer(),
                    Divider(
                      height: 20,
                      color: Colors.transparent,
                    ),

//=======================================================

                    _loginButtonContainer(),
                    SizedBox(
                      height: 14,
                    ),
//------------------------------------------------------------------------------
                    _registerNowLabel(context),
                    SizedBox(
                      height: 40,
                    ),
                    /* InkWell(
                        child: Text(
                          AppLocalizations.of(context).forgot_pass_txt,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordUserPage(),
                              ));
                        }),*/
//------------------------------------------------------------------------------
                  ],
                ))),
      ),
    );
  }

//==============================================================================
//==============================================================================

  Widget _UserNameContainer(BuildContext context) {
    return MyTextField(
      false,

      hint: AppLocalizations.of(context).enter_username_etxt,
      icon: Icon(Icons.person_add),
      controller: userNameController,
      textInputAction: TextInputAction.next,

      //validator: PasswordFieldValidator(context).validate,
      TextInputType: TextInputType.phone,

      /*onChanged:(content) {
       // userNameController.text = content ?? '';
        if (cursorPos.start > userNameController.text.length) {
          cursorPos = new TextSelection.fromPosition(
              new TextPosition(offset: userNameController.text.length));
        }
        userNameController.selection = cursorPos;
      },*/
    );
  }

//==============================================================================
//==============================================================================
  Widget _PasswordContainer(BuildContext context) {
    return MyTextField(
      false,
      hint: AppLocalizations.of(context).enter_pass_etxt,
      icon: Icon(Icons.vpn_key),
      controller: passwordController,
      maxLine: 1,
      textInputAction: TextInputAction.done,
      hidden: true,
      validator: PasswordFieldValidator(context).validate,
      TextInputType: TextInputType.visiblePassword,
    );
  }

  String checkNumber(String content) {
    return content.length.toString();
  }

//==============================================================================
//==============================================================================
  Widget _loginButtonContainer() {
    return new CommonGradientButton(
      text: AppLocalizations.of(context).log_in_btn,
      textSize: 16,
      width: 200,
      height: 44,
      onPressed: () {
        _loginButtonAction(context);
      },
    );
  }

//==============================================================================
//==============================================================================
  Widget _registerNowLabel(BuildContext context) {
    //return  SizedBox(child: RadialMenu());

    return new DrOutlineButton(
      width: 200,
      text: AppLocalizations.of(context).new_account_btn,
      onPressed: () {
        showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return RegisterDialog(
                enterModel: widget.enterModel,
                dataEntry: widget.dataEntry,
              );
            });
      },
      textSize: 16,
    );
  }

//==============================================================================
//==============================================================================
  void _loginButtonAction(BuildContext context) {
    if (userNameController.text == "") {
      _bloc.addWarning(
          AppLocalizations.of(context).snack_bar_enter_username_txt);
      return;
    }

    if (passwordController.text == "") {
      _bloc.addWarning(AppLocalizations.of(context).snack_bar_enter_pass_txt);
      return;
    }
    FocusScope.of(context).requestFocus(new FocusNode());
    _loginUser();
    //_loginUser(emailController.text, passwordController.text);
  }

//==============================================================================
//==============================================================================
  void _loginUser() async {
    String paltform_id;
    if (Platform.isAndroid) {
      paltform_id = APIOperations.ANDROID;
    } else if (Platform.isIOS) {
      paltform_id = APIOperations.IOS;
    }
    print("device_reg_id ON LOG IN  == ${widget.enterModel.device_reg_id }");
    Map<String, String> queryParameters = {
      APIOperations.USERNAME: userNameController.text,
      APIOperations.PASSWORD: passwordController.text,
      APIOperations.DEVICE_REG_TOKEN: widget.enterModel.device_reg_id ?? "",
      APIOperations.PLATFORM_ID: paltform_id,
    };
    _bloc.handleUserSignIn(
        locale: widget.enterModel.locale,
        parameters: queryParameters,
        context: context,
        dataEntry: widget.dataEntry,
        enterModel: widget.enterModel);
  }

//==============================================================================
//==============================================================================
  GFAppBar myAppBar(BuildContext context) {
    return BaseAppbar().build(
        context: context,
        goScreen: () {
          Redirect.toPage(
              context,
              WelcomePage(
                enterModel: widget.enterModel,
                dataEntry: widget.dataEntry,
              ));
        },
        title: AppLocalizations.of(context).log_in_txt,
        isShowLeading: true);
  }
}

//==============================================================================
//==============================================================================

class PasswordFieldValidator {
  BuildContext context;

  PasswordFieldValidator(this.context);

  String validate(String value) {
    return value.isEmpty
        ? AppLocalizations.of(context).snack_bar_enter_pass_txt
        : null;
  }
}
