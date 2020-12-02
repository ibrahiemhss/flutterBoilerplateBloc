
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/http/http_client.dart';
import 'core/http/http_client_impl.dart';
import 'core/http/network_info.dart';
import 'core/http/network_info_impl.dart';
import 'core/util/notification_handler.dart';
import 'data/datasources/local_data_source.dart';
import 'data/datasources/remote_data_source.dart';
import 'data/repositories/repository_impl.dart';
import 'domain/repositories/repository.dart';
import 'features/bloc/blocs/appointments_bloc/appointments_bloc.dart';
import 'features/bloc/blocs/authentication_bloc/sign_in_bloc.dart';
import 'features/bloc/blocs/authentication_bloc/sign_up_bloc.dart';
import 'features/bloc/blocs/decision_bloc/decision_bloc.dart';
import 'features/bloc/blocs/my_text_field_bloc.dart';
import 'features/bloc/blocs/setting_bloc.dart';
import 'features/bloc/blocs/users/home_bloc/home_bloc.dart';
import 'features/bloc/blocs/users/main_user_bloc.dart';
import 'features/bloc/blocs/authentication_bloc/work_info_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //incomming messages
  NotificationsHandler notificationsHandler = new NotificationsHandler();
  sl.registerLazySingleton(() => notificationsHandler);
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  //AppDatabase appDatabase= await $FloorAppDatabase.databaseBuilder('hijozaty_database.db').build();
  // sl.registerLazySingleton(() => appDatabase);
 /* Socket socket= await io("https://site.com", <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': true,
    "path": "/chat",
  });*/
//sl.registerLazySingleton(() => socket);
  final MethodChannel firebasemessagingChannel =
      const MethodChannel('flutterBoilerplateWithbloc.FCMmessage');
  sl.registerLazySingleton(() => firebasemessagingChannel);
  //! External
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  sl.registerLazySingleton(() => firebaseMessaging);

  sl.registerLazySingleton(() => dio.HttpClientAdapter);
  sl.registerLazySingleton<HttpClient>(() => HttpClientImpl());
  sl.registerLazySingleton(() => DataConnectionChecker());

  sl.registerFactory(() => DecisionBloc(
        repository: sl(),
        networkInfo: sl(),
      ));

  sl.registerFactory(() => WorkInfoBloc());
  sl.registerFactory(() => TextFeildBloc());
  sl.registerFactory(() => SignUpBloc(
    repository: sl(),
    networkInfo: sl(),
  ));
  sl.registerFactory(() => SignInBloc(
        repository: sl(),
        networkInfo: sl(),
      ));
  sl.registerFactory(() => SettingsBloc(
    repository: sl(),
    networkInfo: sl(),
  ),
  );



  sl.registerFactory(() => MainUserBloc(
      repository: sl(),
      networkInfo: sl(),
     ),
  );
  sl.registerFactory(
    () => HomeBloc(
      repository: sl(),
    ),
  );

  sl.registerFactory(
          ()=>AppointmentsBloc(
        networkInfo: sl(),
        repository: sl(),
      )
  );

  // Repository

  sl.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      httpClient: sl(),
      sharedPreferences: sl(),
      notificationsHandler: sl(),
     // socket: sl()
    ),
  );

  sl.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(
        sharedPreferences: sl(),
        appDatabase:sl()),
  );


}
