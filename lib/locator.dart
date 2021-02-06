import 'package:flutter_hackathon/api/userServices.dart';
import 'package:flutter_hackathon/utils/rooter.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setUpLocators() {
  locator.registerLazySingleton(() => Rooter());
  locator.registerLazySingleton(() => UserServices());
}
