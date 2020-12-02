import 'package:auto_direction/auto_direction.dart';
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/my_text_field_bloc.dart';
import 'package:flutter/material.dart';

import '../../injection_container.dart';
import 'helper/UiAction.dart';

class MyTextField extends  StatefulWidget {
  InputDecoration decoration;
  TextStyle style;
String hint;
TextEditingController controller;
Icon icon;
dynamic TextInputType;
Function validator, onSaved,onChanged,onSubmitted;
bool hidden;
bool obscureText;
bool enabled;
int maxLine;
TextInputAction textInputAction;
void Function (String text)onChagedValue=(text){
};
  final bool forceEn;
MyTextField(
    this. forceEn,
    {
  @required this.onChagedValue,
 @required this.textInputAction,
  this.hint,
  this.decoration,
  this.style,
  this.controller,
  this.icon,
  this.maxLine,
  this.validator,
  this.TextInputType,
  this.onSaved,
  this.hidden,
  this.onSubmitted,
  this.enabled = true,
});

@override
createState() => new _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField>
    with SingleTickerProviderStateMixin {
  bool isLastEng=false;
  String _text = "";
  TextFeildBloc _bloc=sl<TextFeildBloc>();

//==============================================================================
//==============================================================================

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bloc == null) {
      _blocUiListener(context, _bloc);
    }
  }
//==============================================================================
//==============================================================================

  void _blocUiListener(BuildContext context, TextFeildBloc bloc) {
    final actionListener = (UiAction action) {
      if (action.action == FEILD_ACTIONS.onChange.index) {
        widget.onChagedValue(action.value);
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


  Widget buildContent(BuildContext context) {
    return Container(
      child: Theme(
        data: new ThemeData(
            primaryColor: AppTheme.primary,
            accentColor: AppTheme.accentColor,
            hintColor: AppTheme.greyLight
        ),
        child: Form(
          child: AutoDirection(
          text: _text,
          child: TextField(
            onChanged: (text){
           //   setState(() {
                _text=text;
               // textDirection=CheckInputKeyBoard.textDirection(text,'en',widget.forceEn);
            //  });

              if(widget.onChagedValue!=null){
                _bloc.onChange(text);
              }

            },
              maxLines:widget.maxLine==null? null:widget.maxLine,
              textAlign: TextAlign.start,

              // autofocus: false,
              //focusNode: FocusNode(),
              //cursorColor: Colors.transparent,
              //  textDirection: TextDirection.rtl,
              //textAlign: TextAlign.right,
              style: AppTheme.subtitle,
              decoration:widget.decoration==null?InputDecoration(
                labelText:widget. hint,
                suffixIcon: widget.icon,
                hintText: widget.hint,
                disabledBorder:UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.accentColor),
                ) ,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.accentColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.accentColor),
                ),
                hintStyle: TextStyle(
                  color: AppTheme.greyLight,
                ),
              ):widget.decoration,
              obscureText:widget.hidden?? false,
              controller: widget.controller,
              onSubmitted:widget.onSubmitted ,
              enabled: widget.enabled,
              textInputAction:widget.textInputAction==null? TextInputAction.done:widget.textInputAction,
              keyboardType: widget.TextInputType),
      ),
        ),
      //  margin: EdgeInsets.only(bottom: 2.0)
    ));
  }

}
