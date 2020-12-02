import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/core/util/redirect.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/user_model/user_model_data.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/authentication_bloc/sign_up_bloc.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/base_app_bar.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/Authentication/set_work_times_info.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/decision/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/appbar/gf_appbar.dart';
import 'package:tip_dialog/tip_dialog.dart';
import 'package:toast/toast.dart';
import '../../../injection_container.dart';
import 'set_personal_info.dart';

class SignUpPage extends StatefulWidget {
  // final ScaffoldState scaffold;
  final DataEntry dataEntry;
  final EnterModel enterModel;
  int user_type_id;
  int entering_case;
  final UserModel userModel;
  final bool fromBack;
  SignUpPage({
    @required this.dataEntry,
    @required this.entering_case,
    @required this.enterModel,
    @required this.fromBack,
    @required this.user_type_id,
    @required this.userModel,
  });

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpBloc _bloc = sl<SignUpBloc>();
  final globalKey = new GlobalKey<ScaffoldState>();
  SIGNUP_ACTIONS _signup_actions = SIGNUP_ACTIONS.phoneNumberState;
  bool _isLoadingPhone = false;
  bool _isLoadingCode = false;
  String _titleCodeWidget;
  String _phoneValue;
  File _imageFile;
  bool _isGotFile = false;

  double alternative_lat, alternative_long;
  bool _isChoosed;
  String currentCityTxt;
  bool _isThereInternet;
  int logInStatus;
  bool isDoctor = false;
  bool isLoadingData = true;
  String _message = '';
  String _verificationId;

  String device_reg_id;
  bool _isLoadingShared = true;

//==============================================================================
//==============================================================================

  @override
  void initState() {
    super.initState();
    print("user_type_id sign up ==== ${widget.user_type_id.toString()}");
    print("local sign up ==== ${widget.enterModel.locale}");
    print("device_reg_id sign up ==== ${widget.enterModel.device_reg_id}");

    _isThereInternet = true;
    _isChoosed = false;
  }
//==============================================================================
//==============================================================================

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bloc == null) {
      //SchedulerBinding.instance.addPostFrameCallback((_) => _bloc.isUserSignedIn());
      _blocUiListener(context, _bloc);
    }
  }
@override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
//==============================================================================
//==============================================================================

  void _blocUiListener(BuildContext context, SignUpBloc bloc) {
    final actionListener = (UiAction action) {
      if (action.action == SIGNUP_ACTIONS.loadingSignUp.index) {
        if (mounted) {
          TipDialogHelper.loading(
              AppLocalizations.of(context).submission_in_progress_txt);
        }

        _isLoadingPhone = true;
        _titleCodeWidget = AppLocalizations.of(context).will_send_verifi_etxt;
      } else if (action.action == SIGNUP_ACTIONS.loadedSignUp.index) {
        if (mounted) {
          TipDialogHelper.success(AppLocalizations.of(context).done_txt);
        }

        Toast.show(action.value ?? "", context);

      }
      if (action.action == SIGNUP_ACTIONS.loadingSendPhone.index) {
        _isLoadingPhone = true;
        _titleCodeWidget = AppLocalizations.of(context).will_send_verifi_etxt;
      } else if (action.action == SIGNUP_ACTIONS.loadedSendPhone.index) {
        _isLoadingPhone = false;
        Toast.show(action.value ?? "", context);
      } else if (action.action == SIGNUP_ACTIONS.onAddImage.index) {
        _isGotFile = true;
        _imageFile = action.value;
      } else if (action.action == SIGNUP_ACTIONS.loadingCheckCode.index) {
        _isLoadingCode = true;
        _titleCodeWidget =
            AppLocalizations.of(context).verification_in_progress_txt;
      } else if (action.action == SIGNUP_ACTIONS.noInternet.index) {
        // progressDialog.hideProgress();
        _isLoadingPhone = false;

        Toast.show(AppLocalizations.of(context).no_internet_txt, context);
      } else if (action.action == SIGNUP_ACTIONS.warningSnackBar.index) {
        _isLoadingPhone = false;
        Toast.show(action.value, context);
      } else if (action.action == SIGNUP_ACTIONS.error.index) {
        if (mounted) {
          TipDialogHelper.dismiss();
        }

        // }
        _isLoadingPhone = false;

        Toast.show(action.value, context);
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
    return Scaffold(
        key: globalKey,
        appBar: myAppBar(context),
        body: Stack(
          children: <Widget>[
            registerContainer(),
            TipDialogContainer(duration: const Duration(seconds: 2))
          ],
        ));
  }
//==============================================================================
//==============================================================================

  GFAppBar myAppBar(BuildContext context) {
    return BaseAppbar().build(
        context: context,
        title:AppLocalizations.of(context).register_as_patient_txt,
        goScreen: () {
          Redirect.toPage(
              context,
              WelcomePage(
                enterModel: widget.enterModel,
                dataEntry: widget.dataEntry,
              ));
        },
        isShowLeading: true);
  }

//==============================================================================
//==============================================================================

 Widget testWidget(){
    return SetWorkTimesInfo(
      user_type_id: widget.user_type_id,
      enterModel: widget.enterModel,
      dataEntry: widget.dataEntry,
      entering_case: widget.entering_case,
      userModel: widget.userModel,
      trueText: AppLocalizations.of(context).true_txt,
      firstBeriodText:
      AppLocalizations.of(context).first_period_txt,
      secondBeriod:
      AppLocalizations.of(context).second_period_txt,
      imageFile: null,
      work_experience: 44,
      long: 0.0,
      lat: 0.0,
      //previousBloc: widget.bloc,
      locale: widget.enterModel.locale,
    );
  }
  Widget registerContainer() {
    return Container(
      child: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.fromLTRB(24, 20, 24, 20),
            padding: EdgeInsets.only(bottom: 24, left: 24, right: 24),
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
            child: Form(
              child: new Theme(
                  data: new ThemeData(primarySwatch: Colors.blue),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: _imageUser(_isGotFile)),
                      _RegisterBody(_signup_actions),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          _message,
                          style: TextStyle(color: AppTheme.red),
                        ),
                      )
                    ],
                  )),
            )),
      ),
    );
  }

//==============================================================================
//==============================================================================

  Widget _RegisterBody(pageState) {
/*
if (pageState == SIGNUP_ACTIONS.registerState)
     return SignUpInputsWidget(
       user_type_id: widget.user_type_id,
       dataEntry: widget.dataEntry,
       phone: _phoneValue,
       sendUserData: ({
         String name,
         String address,
         String email,
         String password,
         String confirmPassword,
         String city,
         String gender,
         int city_id,
         bool isGotFile,
         File imageFile}){
         _isGotFile=isGotFile;
         _imageFile=imageFile;
       },
       enterModel: widget.enterModel,
       bloc: _bloc,
       globalKey: globalKey, entering_cases: 0,

     );
    else if (pageState == SIGNUP_ACTIONS.phoneNumberState)
      return SendPhoneWidget(
        isLoadingPhone: _isLoadingPhone,
        sendPhone: (String phone,String country_code) {
          _phoneValue=phone;
          _bloc.preRegister(phoneNumber:phone,locale: widget.enterModel.locale,country_code: country_code );
        },
        user_type_id: widget.user_type_id,

      );
    else
      return SendCodeWidget(
        isLoadingCode: _isLoadingCode,
        sendCode: (String phone) {
          _bloc.checkCode(code:phone,locale: widget.enterModel.locale);
        }, titleCodeWidget: _titleCodeWidget,

      );
*/

    return SetPersonalInfo(
      user_type_id: widget.user_type_id,
      dataEntry: widget.dataEntry,
      phone: _phoneValue,
      sendUserData: ({Map<String, dynamic> queryParameters}) async {
        _bloc.handleUserSignUp(enterModel: widget.enterModel,dataEntry:widget.dataEntry,parameters: queryParameters,context: context);

      },
      enterModel: widget.enterModel,
      bloc: _bloc,
      entering_cases: 0,
      userModel: widget.userModel,
      addImageFile: ({File imageFile, bool isGotFile}) {
        _bloc.addImage(isAddImage: _isGotFile, imageFile: imageFile);
        // print("\nadd image _imageFile=${_imageFile.path}  \n _isGotFile=${_isGotFile.toString()}");
      }, fromBack: widget.fromBack,
    );
  }

//==============================================================================
//==============================================================================
  Widget _imageUser(bool isGotFile) {
    return !isGotFile
        ? SizedBox()
        : new Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.only(top: 8.0),
            child: ClipOval(
              //borderRadius: new BorderRadius.circular(100),
              child: Image.file(
                _imageFile,
                fit: BoxFit.cover,
              ),
            ));
  }
}
