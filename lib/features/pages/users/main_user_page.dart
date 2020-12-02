import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/user_model/user_model_data.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/users/main_user_bloc.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/child_tab.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/custom_navigator_bar/navigator_bar.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/users/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../injection_container.dart';


class MainUserPage extends StatefulWidget {
  final EnterModel enterModel;
  int pagId = 0;
  bool fromBack = false;
  final DataEntry dataEntry;


  MainUserPage(
      {@required this.dataEntry,
        @required this.fromBack,
        @required this.enterModel,
        @required this.pagId,});

  @override
  createState() {
    return new MainUserPageState();
  }
}

class MainUserPageState extends State<MainUserPage> {
  MainUserBloc _bloc = sl<MainUserBloc>();
  UserModel _userModel;
  int _currentIndex = 0;

//==============================================================================
//==============================================================================
  @override
  void initState() {

    if(widget.fromBack){
      _currentIndex=widget.pagId;
    }
    if(widget.enterModel.is_loged_in){
      _bloc.getUserData();
    }
    super.initState();
  }
//==============================================================================
//==============================================================================

  @override
  void didChangeDependencies() {
    _blocUiListener(context,_bloc);
    super.didChangeDependencies();
  }

//==============================================================================
//==============================================================================

  void _blocUiListener(BuildContext context, MainUserBloc bloc) {
    final actionListener = (UiAction action) {
      if (action.action == MAIN_USER_ACTIONS.navigatePage.index) {
        _currentIndex = action.pageIndex;
      }else  if (action.action == MAIN_USER_ACTIONS.onLoadedUserData.index) {
        _userModel = action.value;
        if(_userModel!=null){
          print("=========user values ===========\n"
              "id = ${_userModel.id} \n"
              "name = ${_userModel.name} \n"
          );
        }
      }
    };
    bloc.getPageInexUiActions.listen(actionListener);
  }
//==============================================================================
//==============================================================================

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<UiAction>(
            stream: _bloc.getPageInexUiActions,
            builder: (BuildContext context, snapshot) {
              _blocUiListener(context, _bloc);

              return buildContent(context);
            });
  }

//==============================================================================
//==============================================================================

  Widget buildContent(BuildContext context) {
    return Scaffold(
      // setting canvasColor to transparent
      body: //this our place this bottm tabs
      _children(context)[_currentIndex],
      bottomNavigationBar: MyNavigationBar(
        height: 85,
        index: _currentIndex,
        //    selectedColor: AppTheme.primaryDark,
        buttonBackgroundColor: AppTheme.goldenDark,
        backgroundColor: AppTheme.darkWhite,
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 600),
        onTap: onTabTapped,
        items: [
          ChildTabe.veiw(2, AppLocalizations.of(context).home_txt,
              MdiIcons.homeVariant, tabeColors[0]),
          ChildTabe.veiw(
              2,
              AppLocalizations.of(context).international_services_txt,
              MdiIcons.earth,
              tabeColors[1]),
          ChildTabe.veiw(2, AppLocalizations.of(context).consulting_txt,
              MdiIcons.commentQuestion, tabeColors[2]),
          ChildTabe.veiw(2, AppLocalizations.of(context).clinics_phonebook_txt,
              Icons.contact_phone, tabeColors[3]),
          ChildTabe.veiw(2, AppLocalizations.of(context).settings_txt,
              Icons.settings_applications, tabeColors[4]),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //  floatingActionButton: _buildFab(context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

//==============================================================================
//==============================================================================

  List<Color> tabeColors = [
    AppTheme.white,
    AppTheme.white,
    AppTheme.white,
    AppTheme.white,
    AppTheme.white,
  ];

//==============================================================================
//==============================================================================

  List<Widget> _children(BuildContext context) {
    return [
      HomePage(
        userModel: _userModel,
        dataEntry:widget.dataEntry,
        enterModel: widget.enterModel,
      ),

      // Chat(peerId: "1", peerAvatar: "ibrahim",)
    ];
  }

//==============================================================================
//==============================================================================

  void onTabTapped(int index) {
    _currentIndex = index;
    _bloc.navigateToPage(_currentIndex);
  }
}
