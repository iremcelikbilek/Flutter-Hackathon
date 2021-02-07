import 'package:flutter_hackathon/api/dashboardServices.dart';
import 'package:flutter_hackathon/api/locationServices.dart';
import 'package:flutter_hackathon/api/managerServices.dart';
import 'package:flutter_hackathon/api/recordServices.dart';
import 'package:flutter_hackathon/api/userServices.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setUpLocators() {
  locator.registerLazySingleton(() => Rooter());
  locator.registerLazySingleton(() => UserServices());
  locator.registerLazySingleton(() => RecordServices());
  locator.registerLazySingleton(() => ManagerServices());
  locator.registerLazySingleton(() => DashboardServices());
  locator.registerLazySingleton(() => LocationServices());
}
