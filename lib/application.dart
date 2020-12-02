import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/util/app_theme.dart';
import 'core/util/localization/locale_helper.dart';
import 'core/util/localization/localizations.dart';
import 'core/util/localization/translations.dart';
import 'features/bloc/bloc_helpers/bloc_provider.dart';
import 'features/bloc/blocs/decision_bloc/decision_bloc.dart';
import 'features/bloc/blocs/users/home_bloc/home_bloc.dart';
import 'features/common_widgets/helper/UiAction.dart';
import 'features/pages/decision/decision_page.dart';
import 'features/pages/users/main_user_page.dart';
import 'injection_container.dart';

class MyApp extends StatefulWidget {
  final String locale;
  MyApp({
    @required this.locale,
  });
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//==============================================================================
//==============================================================================

  @override
  Widget build(BuildContext context) {

    return BlocProvider<DecisionBloc>(
        bloc: DecisionBloc(),
        child: BlocProvider<DecisionBloc>(
            child: BlocProvider<HomeBloc>(
                bloc: HomeBloc(),
                child: DecisionPage(locale: widget.locale,))));
  }
}
