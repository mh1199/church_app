
import 'package:church_system/ui/login_page.dart';
import 'package:church_system/ui/register_page.dart';
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
  static const String login = '/loginView';
  static const String register = '/registerView';

  static void configureRoutes(FluroRouter router) {
    router.define(base, handler: baseHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);

    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return NotFoundPage();
      },
    );
  }

}

var baseHandler = Handler(
  handlerFunc: (context, params) {
    String? page = params['page']?.first;
    print("page $page");
    int p = 0;
    if (page != null && page.isNotEmpty) p = int.parse(page);
    return BasePage(page: p);
  },
);

var loginHandler = Handler(
  handlerFunc: (context, params) {
    return const LoginPage();
  },
);

var registerHandler = Handler(
  handlerFunc: (context, params) {
    return const RegisterPage();
  },
);


// var baseHandler = Handler(
//   handlerFunc: (context, params) {
//     return const BasePage();
//   },
// );