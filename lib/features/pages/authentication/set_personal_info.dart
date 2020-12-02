import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/get_image.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/core/util/redirect.dart';
import 'package:flutterBoilerplateWithbloc/core/util/validation.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/user_model/user_model_data.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/authentication_bloc/sign_up_bloc.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/gradient_button.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/privacy_plicy_dialoge.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:toast/toast.dart';
import 'package:path/path.dart' as path;

class SetPersonalInfo extends StatefulWidget {
  final SignUpBloc bloc;
  final int user_type_id;
   String phone;
  final DataEntry dataEntry;
  final bool fromBack;

  final EnterModel enterModel;
  final int entering_cases;
   UserModel userModel;
  void Function(
      {bool isGotFile, File imageFile}) addImageFile = ({isGotFile, imageFile}) {};
  void Function(
      {Map<String, dynamic> queryParameters}) sendUserData =
      ({queryParameters}) {};
  SetPersonalInfo({
    @required this.user_type_id,
    @required this.fromBack,
    @required this.sendUserData,
    @required this.addImageFile,
    @required this.userModel,
    @required this.phone,
    @required this.dataEntry,
    @required this.enterModel,
    @required this.bloc,@required  this.entering_cases,

  });
  @override
  createState() => _SetPersonalInfoState();
}

class _SetPersonalInfoState extends State<SetPersonalInfo> {
  UserModel _userModel=new UserModel();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String countryCode;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final TextEditingController _cityController = new TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();


  bool _checkedAcceptedValue=true;
  int _city_id = 0;
  File _imageFile;
  bool _isGotFile = false;
  bool _isLoadingIraqProvince = true;
  double _alternative_lat,_alternative_long;


  @override
  void initState() {
    print("device_reg_id SetPersonalInfo ==== ${widget.enterModel.device_reg_id}");

    if(widget.fromBack){
      _userModel=widget.userModel;
      _nameController.text=widget.userModel.name;
      _phoneNumberController.text=widget.userModel.phone;
      _addressController.text=widget.userModel.address;
      _emailController.text=widget.userModel.email;
      _passwordController.text=widget.userModel.password;
      _genderController.text=widget.userModel.gender;
      _cityController.text=widget.userModel.city;
      _city_id=widget.userModel.city_id;
    }else if(widget.userModel==null){
      widget.userModel=new UserModel();
    }
    super.initState();
  }
//==============================================================================
//==============================================================================
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _nameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _genderController.dispose();
    _cityController.dispose();

    _phoneNumberController.dispose();
    super.dispose();
  }
//==============================================================================
//==============================================================================

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UiAction>(
        stream: widget.bloc.getUiActions,
        builder: (BuildContext context, snapshot) {
          _blocUiListener(context, widget.bloc);
          return buildContents(context);
        });
  }

//==============================================================================
//==============================================================================

  void _blocUiListener(BuildContext context, SignUpBloc bloc) {
    final actionListener = (UiAction action) {

      if (action.action == SIGNUP_ACTIONS.onAcceptPrivacy.index) {
        _checkedAcceptedValue=action.value;
      }

      };
    bloc.getUiActions.listen(actionListener);
  }

//==============================================================================
//==============================================================================

  Widget buildContents(BuildContext context) {
    bool isLandScape = false;
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
        isLandScape = true;
    } else {

        isLandScape = false;

    }
    return _registerAlldata();
  }

  Widget _registerAlldata() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
//------------------------------------------------------------------------------
          MyTextField(
            false,
            textInputAction: TextInputAction.next,
            hint: AppLocalizations.of(context).enter_name_etxt,
            icon: Icon(Icons.account_circle),
            TextInputType: TextInputType.text,
            validator: (String value) {
              if (value.isEmpty) {
                return AppLocalizations.of(context).enter_name_etxt;
              }
            },
            controller: _nameController,
          ),
          SizedBox(
            height: 16,
          ),
//------------------------------------------------------------------------------
          /*  MyTextField(
            false,
            textInputAction:  TextInputAction.done,
            hint: AppLocalizations.of(context).hint_phone_txt,
            icon: Icon(Icons.phone),
            TextInputType: TextInputType.phone,
            // enabled: false,
            validator: (String value) {
              if (value.isEmpty) {
                return AppLocalizations.of(context).enter_phone_txt;
              }
            },
            controller: _phoneNumberController,
          ),*/
//------------------------------------------------------------------------------

          new InkWell(
              onTap: () {
                _showListProvines();
              },
              child:  MyTextField(
                false,
                textInputAction: TextInputAction.next,
                controller: _cityController,
                hint: AppLocalizations.of(context).click_select_city_txt,
                enabled: false,
                icon: Icon(Icons.location_city),
              )),
//------------------------------------------------------------------------------
         MyTextField(
            false,
            textInputAction:  TextInputAction.next,

            hint: AppLocalizations.of(context).enter_residence_address_txt,
            icon: Icon(Icons.location_on),
            TextInputType: TextInputType.text,
            validator: (String value) {
              if (value.isEmpty) {
                return "";
              }
            },
            controller: _addressController,
          ),


//------------------------------------------------------------------------------
               MyTextField(
            false,
            textInputAction: TextInputAction.next,
            hint: AppLocalizations.of(context).email_txt,
            icon: Icon(Icons.email),
            TextInputType: TextInputType.emailAddress,
            validator: (String value) {
              if (value.isEmpty) {
                return AppLocalizations.of(context).enter_email_txt;
              }
            },
            controller: _emailController,
          )
    ,
//------------------------------------------------------------------------------
            MyTextField(
               false,
             textInputAction:  TextInputAction.next,
             hint: AppLocalizations.of(context).phones_txt,
            icon: Icon(Icons.phone),
            TextInputType: TextInputType.phone,
           // enabled: false,
            validator: (String value) {
              if (value.isEmpty) {
                return AppLocalizations.of(context).enter_phone_txt;
              }
            },
            controller: _phoneNumberController,
          ),
          SizedBox(
            height: 16,
          ),
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
          MyTextField(
            false,
            textInputAction: TextInputAction.next,
            maxLine: 1,
            hint: AppLocalizations.of(context).password_txt,
            icon: Icon(Icons.lock),
            TextInputType: TextInputType.text,
            validator: (String value) {
              if (value.isEmpty) {
                return AppLocalizations.of(context).enter_pass_etxt;
              }
            },
            hidden: true,
            controller: _passwordController,
          ),
          SizedBox(
            height: 16,
          ),

//------------------------------------------------------------------------------
          MyTextField(
            false,
            maxLine: 1,
            textInputAction: TextInputAction.done,
            hint: AppLocalizations.of(context).re_enter_pass_etxt,
            icon: Icon(Icons.lock),
            TextInputType: TextInputType.text,
            validator: (String value) {
              if (value.isEmpty) {
                return AppLocalizations.of(context).re_enter_pass_etxt;
             // } else if (_isConfirmedPass) {
             //   return AppLocalizations.of(context).warning_re_enter_pass_txt;
              }
            },
            hidden: true,
            controller: _confirmPasswordController,
          ),
          SizedBox(
            height: 16,
          ),
//------------------------------------------------------------------------------

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppTheme.nearWhite,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return PrivacyPolicyDialog(widget.enterModel.locale??"ar");
                        });
                  },
                  child: Text(
                    AppLocalizations.of(context).privacy_policy_txt,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppTheme.goldenDarker,
                        fontFamily: AppTheme.fontName,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),

                Card(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: AppTheme.goldenDarker),
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  ),
                  child: CheckboxListTile(
                    checkColor: AppTheme.white,
                    activeColor: AppTheme.goldenDarker,
                    title: Text(AppLocalizations.of(context).i_agree_txt, style: AppTheme.subtitleInfo),
                    //    <-- label
                    value: _checkedAcceptedValue,
                    onChanged: (newValue) {
                      //TODO =============================================================

                      _checkedAcceptedValue = newValue;
                      widget.bloc.onAcceptPrivacy(value: _checkedAcceptedValue);

                    },
                  ),
                ),

              ],
            ),
          ),
//------------------------------------------------------------------------------

          SizedBox(
            height: 16,
          ),
//------------------------------------------------------------------------------

               _isGotFile && _imageFile != null
              ? Text(AppLocalizations.of(context).img_added_txt,
              style: AppTheme.title)
              : _cameraButton(),

//------------------------------------------------------------------------------
          widget.user_type_id == TypeOfUsers.USER_TYPE
              ? CommonGradientButton(
            width: 250,
            text: AppLocalizations.of(context).sign_up_txt,
            textSize: 16,
            onPressed: () async {
              if (_checkedAcceptedValue) {
                //TODO=====================
                confirmRegister(
                    name:_nameController.text,
                     address:_addressController.text,
                     email:_emailController.text,
                     password:_passwordController.text,
                     confirmPassword:_confirmPasswordController.text,
                     city:_cityController.text,
                     gender:_genderController.text,
                     city_id:_city_id

                );
              } else {

                Toast.show( AppLocalizations.of(context).warning_accept_privacy_txt,
                    context, duration: Toast.LENGTH_SHORT,
                    gravity:
                    Toast.BOTTOM,
                    backgroundColor: AppTheme.primaryDarkest,
                    textColor: Colors.white);

              }
            },
          )
              : CommonGradientButton(
              width: 250,
              text: AppLocalizations.of(context).register_as_patient_txt,
              textSize: 16,
              onPressed: ()  {

                widget.phone=_phoneNumberController.text;
                String lastPhoneValidated;
                if(widget.phone!=null||widget.phone!=""||widget.phone!=" "){
                  try{
                    if(widget.phone.substring(0,1)!="0"){
                      lastPhoneValidated="0"+widget.phone;
                      print(" phoneValue1 = ${lastPhoneValidated}");

                    }else{
                      print(" phoneValue2 = ${lastPhoneValidated}");
                      lastPhoneValidated=widget.phone;

                    }
                  }catch(e){
                    print(" phone error = ${e.toString()}");

                  }


                }
               if( Validator.userSignUpValidation(
                   context: context,
                    checkedAcceptedValue: _checkedAcceptedValue,
                    name: _nameController.text,
                    address: _addressController.text,
                    city_id: _city_id,
                    password: _passwordController.text,
                    confirmPassword: _confirmPasswordController.text)){
                 _userModel.serverToken=widget.enterModel.device_reg_id;
                 //_imageFile!=null?_userModel.image_path=_imageFile.path:widget.userModel.image_path=null;
                 _userModel.name=_nameController.text;
                 _userModel.phone=_phoneNumberController.text;
                 _userModel.address= _addressController.text;
                 _userModel.password= _passwordController.text;
                 _userModel.city=_cityController.text;
                 _userModel.gender=_genderController.text;
                 _userModel.city_id=_city_id;
                 _userModel.email= _emailController.text;


               }
              }),
          // SizedBox(height: 8),
        ],
      ),
    );
  }
//==============================================================================
//==============================================================================
  Future<Null> _showListProvines() async {

    await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return Theme(
              data: Theme.of(context)
                  .copyWith(dialogBackgroundColor: Colors.transparent),
              child: Dialog(child: _dialogsCitiesWidget()));
        });

    //TODO =============================================================

    setState(() {
      // index = selected;
    });
  }
  String _selctedProvince;
  String _selectedCity;

  Widget _dialogsCitiesWidget() {
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
                    fontSize: 28.0,
                    color: AppTheme.goldenLight,
                    fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w700)),
          ),

//------------------------------------------------------------------------------
        ],
      ),
    );
  }

  //==============================================================================
//==============================================================================
  String _selectedGender;
  bool _isSelectedGender = false;
  Widget _dropDownGenderMenu() {
    List<String> items = <String>[AppLocalizations.of(context).male_txt, AppLocalizations.of(context).female_txt,  AppLocalizations.of(context).undefined_txt];

    return new Row(
      children: <Widget>[
        new Expanded(
            child: new MyTextField(
              false,
              controller: _genderController,
              hint: AppLocalizations.of(context).select_gender_txt,
              enabled: false,
            )),
        new PopupMenuButton<String>(
          color:AppTheme.goldenDarker ,
          //   child: Container(),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppTheme.grey,
            size: 42,
          ),
          onSelected: (String value) {
            _genderController.text = value;
          },
          itemBuilder: (BuildContext context) {
            return items.map<PopupMenuItem<String>>((String value) {
              return new PopupMenuItem(

                  child: new Text(value,style: AppTheme.subtitleLight,), value: value);
            }).toList();
          },
        ),
      ],
    );
  }

  //==============================================================================
//==============================================================================
  Widget _cameraButton() {
    return new RawMaterialButton(
      fillColor: Colors.white,
      splashColor: AppTheme.blueGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).add_img_btn,
              style: TextStyle(color: AppTheme.goldenDarker),
            ),
            const SizedBox(
              width: 8.0,
            ),
            const Icon(
              LineAwesomeIcons.camera,
              color: AppTheme.goldenDarker,
            ),
          ],
        ),
      ),
      onPressed: () {
        _pickImage(context);
      },
      shape: const StadiumBorder(),
    );
  }

//==============================================================================
//==============================================================================

  Future<void> _pickImage(BuildContext context) async {

    _imageFile = await GetImageFile.pickImage(context);
    if (_imageFile != null) {
      _isGotFile = true;
      try{
        widget.addImageFile(imageFile:_imageFile,isGotFile:true);
      }catch(e){
        print("get image exception  ${e.toString()}");
      }

    }
  }

  void confirmRegister({String name, String address, String email, String password,String confirmPassword, String city, String gender,int city_id}) async{
    // if (_isThereInternet) {
    if (name=="") {
      //TODO =============================================================
       Toast.show(AppLocalizations.of(context).warning_add_name_txt, context);

    }

    else if (city_id==0) {
      //TODO =============================================================
        Toast.show(AppLocalizations.of(context).please_choose_city, context);

    } /*else if (_phoneNumberController.text.isEmpty) {
      setState(() {
        globalKey.currentState.showSnackBar(
            new SnackBar(content: new Text(AppLocalizations.of(context).please_enter_the_phone_city)));
      });
    } */
    else if (password.length <6) {


      Toast.show(AppLocalizations.of(context).warning_short_password_txt, context);

    }
    else if (password.isEmpty) {
      //TODO =============================================================
      Toast.show(AppLocalizations.of(context).please_enter_password_txt, context);

    } else if (password != confirmPassword) {
      //TODO =============================================================

      Toast.show(AppLocalizations.of(context).warning_ensure_enter_correct_password_txt, context);

    } else {
      _requestRegister(name:name,address:address,email:email,password:password,confirmPassword:confirmPassword,city:city,gender:gender,city_id:city_id);


    }
    /*} else {
      if (!_isDailogInternetShowing) {
       // showCheckInternetDialog(context, 'توجد مشكله في الاتصال بالانترنت');
      }
    }*/
  }

//==============================================================================
//==============================================================================
  void _requestRegister({String name, String address, String email, String password,String confirmPassword, String city, String gender,int city_id,String device_reg_id})async {

    // progressDialog.showProgress("registration");

    String fileName;
    if (_imageFile != null &&
        _imageFile.path != null &&
        _imageFile.path.isNotEmpty) {
      fileName = path.basename(_imageFile.path);

      print("File Name : $fileName");
      print("File Size : ${_imageFile.lengthSync()}");
    }
    String paltform_id;
    if (Platform.isAndroid) {
      paltform_id = APIOperations.ANDROID;
    } else if (Platform.isIOS) {
      paltform_id = APIOperations.IOS;
    }

    String lastPhoneValidated;
    widget.phone=_phoneNumberController.text;
    if(widget.phone.substring(0,1)!="0"){
      lastPhoneValidated="0"+widget.phone;
      print(" phoneValue1 = ${lastPhoneValidated}");

    }else{
      print(" phoneValue2 = ${lastPhoneValidated}");
      lastPhoneValidated=widget.phone;

    }

    Map<String, dynamic> queryParameters = {
      APIOperations.NAME: name,
      APIOperations.PHONE: lastPhoneValidated,
      APIOperations.EMAIL: email,
      APIOperations.PASSWORD: password,
      APIOperations.GENDER: gender,
      APIOperations.CITY_ID: city_id.toString(),
      APIOperations.USER_TYPE_ID: TypeOfUsers.USER_TYPE.toString(),
      APIOperations.DEVICE_REG_TOKEN: widget.enterModel.device_reg_id,
      APIOperations.PLATFORM_ID: paltform_id,
      APIOperations.IMAGE_URL: _isGotFile || _imageFile != null
          ? await MultipartFile.fromFile( _imageFile.path,filename:fileName )
          : null
    };
    print(
      '=============INIT REgister=============');

   widget.sendUserData(queryParameters:queryParameters);


  }
}
