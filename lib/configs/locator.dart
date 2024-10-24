import 'dart:async';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import '../services/network_service.dart';
// import '../services/preferences_service.dart';
import '../services/rest_service.dart';
import '/services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future initLocator() async {
  navigation();
  // preferences();
  // network();
  // rest();
}

navigation() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}

// preferences() {
//   locator.registerLazySingleton<PreferencesServiceImpl>(() => PreferencesServiceImpl());
// }
//
// network() {
//   locator.registerLazySingleton<NetworkServiceImpl>(() => NetworkServiceImpl());
// }

// rest() {
//   locator.registerLazySingleton<RestServiceImpl>(() => RestServiceImpl());
// }

