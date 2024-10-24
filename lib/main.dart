import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'dart:io';

import 'package:church_system/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'configs/locator.dart';
import 'configs/routes_handler.dart';
import 'helpers/constants.dart';
import 'helpers/enums.dart';

bool isFlutterLocalNotificationsInitialized = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // ByteData data = await PlatformAssetBundle().load(Constants.ASSET_CERT);
  // SecurityContext.defaultContext
  //     .setTrustedCertificatesBytes(data.buffer.asUint8List());
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await EasyLocalization.ensureInitialized();
  await initLocator();
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Routes.router = router;

//for language
  runZonedGuarded(() async {
    runApp(
      EasyLocalization(
        supportedLocales: [
          Locale("en"),
          Locale("zh"),
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: const MyApp(),
      ),
    );
  },
          (exception, stackTrace) async {
        // await Sentry.captureException(exception, stackTrace: stackTrace);

      });
}
