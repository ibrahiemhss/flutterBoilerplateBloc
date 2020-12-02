import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/app_outLine_Button.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/gradient_button.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/launch_support_dialog.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/loading_animation.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class SendCodeWidget extends StatefulWidget {
  final bool isLoadingCode;
  void Function(String phone) sendCode = (code) {};
  final String titleCodeWidget;

  SendCodeWidget({
    @required  this.isLoadingCode,
    @required  this.sendCode,
    @required  this.titleCodeWidget,
  });
  @override
  createState() => _SendCodeWidgetState();
}

class _SendCodeWidgetState extends State<SendCodeWidget> {

  bool isCorrectVerify = false;
  bool isLoadingCode = false;
  String verificationCode;
  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
//==============================================================================
//==============================================================================
  @override
  void dispose() {
    _codeController.dispose();
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
    return _codeBody();
  }


  Widget _codeBody() {
    return Column(
      children: <Widget>[
        Text(widget.titleCodeWidget??"", style: AppTheme.title),

        isLoadingCode
            ? LoadingAnimation.stillLoading()
            : MyTextField(
          false,
          textInputAction: TextInputAction.done,
          hint: AppLocalizations.of(context).enter_code_etxt,
          icon: Icon(Icons.sms),
          TextInputType: TextInputType.text,
          controller: _codeController,
        ),
        SizedBox(
          height: 24,
        ),
        CommonGradientButton(
          // width: 180,
          text: AppLocalizations.of(context).verify_txt,
          textSize: 16,
          onPressed: () {
          //  _checkCode(_codeController.text);
          },
        ),

        ///

        SizedBox(
          height: 30,
        ),
        InkWell(
            onTap: () {
              widget.sendCode(_codeController.text);
            },
            child: Text(
              AppLocalizations.of(context).enter_code_etxt,
              style: AppTheme.subtitleInfo,
            )),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppTheme.nearWhite,
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8.0),
                child: Text(
                  AppLocalizations.of(context).not_sent_code_etxt,
                  style: AppTheme.subtitleInfo,
                ),
              ),
              SizedBox(height: 8,),

              DrOutlineButton(
                  textSize: 18,
                  color: AppTheme.goldenDarker,
                  text: AppLocalizations.of(context).contact_us_etxt,
                  onPressed: () {
                    showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return LaunchSupportDialog();
                        });
                  }),
            ],
          ),
        ),

        /* SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: () {
              setState(() {

                pageState = PageState.codeState;

              });
            },
            child: Text(
              "اعاده ارسال الكود",
              style: TextStyle(color: AppTheme.primary),
            )),*/
      ],
    );
  }


}
