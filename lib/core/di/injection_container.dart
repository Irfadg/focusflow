import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:focusflow/core/network/api_client.dart';
import 'package:focusflow/core/network/network_info.dart';
import 'package:get_it/get_it.dart';




final sl = GetIt.instance;
Future<void> init() async {
  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Connectivity());

  // Core
  sl.registerLazySingleton(() => ApiClient());
  sl.registerLazySingleton(() => NetworkInfo(sl()));
}
