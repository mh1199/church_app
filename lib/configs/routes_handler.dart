
import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';

import 'package:provider/provider.dart';


import '../helpers/app.dart';
import '../stores/global_state.dart';

import '../ui/base_page.dart';
import '../widgets/custom_page.dart';
// import '/helpers/argument.dart';

import '/services/navigation_service.dart';

import 'locator.dart';

class Routes {

  static late FluroRouter router;

  static const String base = '/baseView';

  static void configureRoutes(FluroRouter router) {
    router.define(base, handler: baseHandler);

    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return NotFoundPage();
      },
    );
  }

}

var baseHandler = Handler(
  handlerFunc: (context, params) {
    return const BasePage();
  },
);