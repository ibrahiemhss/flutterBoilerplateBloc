
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/gradient_button.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/loading_animation.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class SendPhoneWidget extends StatefulWidget {
  final bool isLoadingPhone;
 final int user_type_id;
  void Function(String phone,String country_code) sendPhone = (phone,country_code) {};

  SendPhoneWidget({
    @required  this.isLoadingPhone,
    @required  this.sendPhone,
    @required  this.user_type_id,

  });
  @override
  createState() => _SendPhoneWidgetState();
}

class _SendPhoneWidgetState extends State<SendPhoneWidget> {

  String _country_ISO = 'IQ';
  String _country_code="+964";
  String _titleCodeWidget;
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
//==============================================================================
//==============================================================================
  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

//==============================================================================
//==============================================================================

  @override
  Widget build(BuildContext context) {
    bool isLandScape = false;
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      setState(() {
        isLandScape = true;
      });
    } else {
      setState(() {
        isLandScape = false;
      });
    }
    return _PhoneBody();
  }

  //TODO =======================================================================
  void _onCountryChange(CountryCode code) {
    //Todo : manipulate the selected country code here

    _country_ISO=code.code;

    _country_code= code.toString();
    print("=====================================\n"
        "New _country_ISO selected: " + _country_ISO+"\n"
        "New country_code selected: " + _country_code+"\n"

    );
  }
  Widget _PhoneBody() {

    double _containe_note_add_phone_width;

    bool isLandScape=false;
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {

      isLandScape=true;

      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
          _containe_note_add_phone_width = MediaQuery.of(context).size.width /1.9;

          break;
        case TargetPlatform.iOS:
          _containe_note_add_phone_width = MediaQuery.of(context).size.width /1.9;

          break;
        case TargetPlatform.fuchsia:
          break;
          //case TargetPlatform.macOS:
          // TODO: Handle this case.
          break;
      }
    } else {

      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
          _containe_note_add_phone_width = MediaQuery.of(context).size.width /1.9;

          break;
        case TargetPlatform.iOS:
          _containe_note_add_phone_width = MediaQuery.of(context).size.width /1.9;
          break;
        case TargetPlatform.fuchsia:
          break;
          //case TargetPlatform.macOS:
          // TODO: Handle this case.
          break;
      }
    }
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          widget.isLoadingPhone?
          Text(
            AppLocalizations.of(context).code_is_being_sent_loading_txt,
            style: AppTheme.subtitle,
          ):
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: _containe_note_add_phone_width,
                child: Text(
                  AppLocalizations.of(context).add_phone_txt,
                  style: AppTheme.subtitle,
                ),
              ),
              Icon(Icons.warning,color: AppTheme.limeYeLLowDark,size: 69,),
            ],
          ),
          /* Row(
            mainAxisSize: prefix0.MainAxisSize.min,
            children: <Widget>[
               Container(
                 width: 20,
                 child: CountryCodePicker(
                              onChanged: print,
                              initialSelection: 'TF',
                              showCountryOnly: true,
                              showOnlyCountryWhenClosed: true,
                              favorite: ['+964', 'IQ']),
               ), */
          widget.isLoadingPhone
              ? LoadingAnimation.stillLoading()
              : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _country_ISO,
                    style: AppTheme.subtitle,
                  ),
                  Container(
                    width: 120,
                    height: 50,
                    child: CountryCodePicker(
                      onChanged: _onCountryChange,
                      initialSelection: 'IQ',
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: true,
                      alignLeft: true,
                      textStyle:
                      AppTheme.subtitle,
                    ),
                  ),

                ],
              ),

              widget.user_type_id==TypeOfUsers.USER_TYPE?
              Container():Text(
                AppLocalizations.of(context).dr_hint_phone_txt,
                style: AppTheme.subtitle,
              ),
              MyTextField(
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
              ),
            ],
          ),
          // ],
          // ),
          SizedBox(
            height: 16,
          ),
          CommonGradientButton(
            text: AppLocalizations.of(context).confirm_txt,
            textSize: 16,
            onPressed: () async {
              widget.sendPhone(_phoneNumberController.text,_country_code);
              //TODO =============================================================
              _titleCodeWidget =
                  AppLocalizations.of(context).will_send_verifi_etxt;
            },
          ),
          SizedBox(height: 30),
        ],
      );
  }
}
