import 'package:clay_containers/clay_containers.dart';
import 'package:flutterBoilerplateWithbloc/core/util/app_theme.dart';
import 'package:flutterBoilerplateWithbloc/core/util/constant.dart';
import 'package:flutterBoilerplateWithbloc/core/util/localization/localizations.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/data_entry.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/enter_model.dart';
import 'package:flutterBoilerplateWithbloc/domain/entities/user_model/user_model_data.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/bloc_widgets/bloc_state_builder.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/users/home_bloc/home_bloc.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/users/home_bloc/home_event.dart';
import 'package:flutterBoilerplateWithbloc/features/bloc/blocs/users/home_bloc/home_state.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/close_app_dailoge.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/helper/UiAction.dart';
import 'package:flutterBoilerplateWithbloc/features/common_widgets/loading_animation.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/users/home/see_more_widget.dart';
import 'package:flutterBoilerplateWithbloc/features/pages/users/common/select_booking_day_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:toast/toast.dart';
import '../../../../injection_container.dart';
import '../common/select_price_widget.dart';
import '../common/select_provinces_widget.dart';

class HomePage extends StatefulWidget {
  final EnterModel enterModel;
  final DataEntry dataEntry;
  final UserModel userModel;

  HomePage({
    @required this.enterModel,
    @required this.dataEntry,
    @required this.userModel,

  });

  @override
  _HomePagePageState createState() => new _HomePagePageState();
}

abstract class MainScreenCallBack {
  void onLogInSuccessfully(bool logedIn);

  void onError(String message);
}

class _HomePagePageState extends State<HomePage> with TickerProviderStateMixin {
  HomeBloc bloc = sl<HomeBloc>();
  HomeState oldHomeState;
  String locale = "ar";
  bool haseInternet = false;
  LoadStatus _loadStatus;

//==============================================================================
//==============================================================================

  @override
  void initState() {
    bloc.emitEvent(HomeCheckInternetEvent());
    super.initState();
  }

//==============================================================================
//==============================================================================
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (bloc == null) {
      bloc = sl<HomeBloc>();
      _blocUiListener(context, bloc);
      //_bloc.setChatInfo(chatInfo).then((_) => _bloc.getChatHistory());
    }
  }

//==============================================================================
//==============================================================================

  @override
  Widget build(BuildContext context) {
    return BlocEventStateBuilder<HomeState>(
        bloc: bloc,
        builder: (BuildContext context, HomeState state) {
          if (state != oldHomeState) {
            oldHomeState = state;
            haseInternet = state.isIntenet_connected;

          // This page does not need to display anything since it will
          // always remain behind any active page (and thus 'hidden').
          return bodyContent(context);
        }});

    // create: (_) => sl<HomeBloc>()..add(HomeCheckInternetEvent()),
  }

//==============================================================================
//==============================================================================

  void _blocUiListener(BuildContext context, HomeBloc bloc) {
    final actionListener = (UiAction action) {
        if (action.action == HOME_ACTIONS.showToast.index) {
      } else if (action.action == HOME_ACTIONS.error.index) {
        print("=============== HOME_ACTIONS on error==========");

      }
    };
    bloc.getUiActions.listen(actionListener);
  }

//==============================================================================
//==============================================================================

  Widget bodyContent(BuildContext context) {
    /*bloc.emitEvent(HomeEvent(
        type_id:_type_id,
        current_page: _current_page,
        rows_per_page: _rows_per_page,
        slectedSpId: _slectedSpId,
        selctedProvinceId: _selctedProvinceId,
        selectedCityId: _selectedCityId,
        dayIndex:  _dayIndex,
        selectedPrice:  _selectedPrice,
        searchValue:  _searchValue,
        locale: widget.locale));*/

    double _containe_search_height;
    double _screen_height;

    double _containe_appbar_height;
    double _container_Ads_height;
    double _list_details_margin;

    bool isLandScape = false;
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      setState(() {
        isLandScape = true;
      });
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
          _screen_height = MediaQuery.of(context).size.height - 200;
          _containe_search_height = MediaQuery.of(context).size.height / 2;
          _list_details_margin = MediaQuery.of(context).size.height * 0.2;
          _container_Ads_height = MediaQuery.of(context).size.width / 2.8;
          _containe_appbar_height = MediaQuery.of(context).size.width / 10.0;

          break;
        case TargetPlatform.iOS:
          _screen_height = MediaQuery.of(context).size.height - 200;
          _list_details_margin = MediaQuery.of(context).size.height * 0.2;
          _containe_search_height = MediaQuery.of(context).size.height / 2;
          _container_Ads_height = MediaQuery.of(context).size.width / 2.8;
          _containe_appbar_height = MediaQuery.of(context).size.width / 10.0;

          break;
        case TargetPlatform.fuchsia:
          break;
          //case TargetPlatform.macOS:
          // TODO: Handle this case.
          break;
      }
    } else {
      isLandScape = false;
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
          _screen_height = MediaQuery.of(context).size.height - 200;
          _list_details_margin = MediaQuery.of(context).size.height * 0.2;
          _container_Ads_height = MediaQuery.of(context).size.height / 2.8;
          _containe_search_height = MediaQuery.of(context).size.width / 0.85;
          _containe_appbar_height = MediaQuery.of(context).size.height / 10.0;

          break;
        case TargetPlatform.iOS:
          _screen_height = MediaQuery.of(context).size.height - 200;
          _list_details_margin = MediaQuery.of(context).size.height * 0.2;
          _container_Ads_height = MediaQuery.of(context).size.height / 2.8;
          _containe_search_height = MediaQuery.of(context).size.width / 0.65;
          _containe_appbar_height = MediaQuery.of(context).size.height / 10.0;
          break;
        case TargetPlatform.fuchsia:
          break;
          //case TargetPlatform.macOS:
          // TODO: Handle this case.
          break;
      }
    }
    return WillPopScope(
        onWillPop: _onWillPop,
        child: buildHomeContent(_containe_appbar_height, _list_details_margin,
            _containe_search_height, _screen_height, _container_Ads_height));
  }

  Future<bool> _onWillPop() {
    return CloseApp.alert(context) ?? false;
  }

//==============================================================================
//==============================================================================

  Widget buildHomeContent(
      double _containe_appbar_height,
      _containe_search_height,
      _list_details_margin,
      _screen_height,
      _container_Ads_height) {
    return StreamBuilder(
        stream: bloc.getUiActions,
        builder: (context, snapshot) {
         // _blocUiListener(context, bloc);

          ///change  ui on handle search
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Container()
                    ],
                  ),
                ),

              ],
            ),
          );
        });
  }

}
