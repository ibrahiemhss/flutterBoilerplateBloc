
import 'package:flutterBoilerplateWithbloc/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterBoilerplateWithbloc/injection_container.dart' as di;
import 'application.dart';
import 'core/util/app_theme.dart';
import 'core/util/localization/translations.dart';
import 'injection_container.dart';

void main() async {
 //sl.registerSingleton<Repository>(new RepositoryImpl());
 //sl.registerSingleton<LocalDataSource>(new LocalDataSourceImpl());
 //sl.registerSingleton<RemoteDataSource>(new RemoteDataSourceImpl());

 WidgetsFlutterBinding.ensureInitialized();
 await di.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppTheme.primaryDark, // navigation bar color
    statusBarColor: AppTheme.primaryDark, // status bar color
  ));
 SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     systemNavigationBarColor: AppTheme.primaryDark, // navigation bar color
     statusBarColor: AppTheme.primaryDark, // status bar colo
     statusBarBrightness: Brightness.dark,
     statusBarIconBrightness: Brightness.dark));
  var locale;  //get last value of selected language in app
 Repository repository=sl<Repository>();
  await allTranslations.init();
  try {
    locale = repository.handleGetLocaleLanguageSaved()??"ar";
    print("main get local  =${locale}");

  } catch (e) {
    print("main get local exception =${e.toString()}");

  }
  runApp(
     MyApp(
       locale: locale,
     ));
}
