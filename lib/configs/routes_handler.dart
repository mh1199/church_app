
import 'package:church_system/ui/download_cert_page.dart';
import 'package:church_system/ui/edit_account_page.dart';
import 'package:church_system/ui/forgot_password_page.dart';
import 'package:church_system/ui/login_page.dart';
import 'package:church_system/ui/register_page.dart';
import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';

import 'package:provider/provider.dart';


import '../helpers/app.dart';
import '../stores/global_state.dart';

import '../ui/add_church_page.dart';
import '../ui/add_event_page.dart';
import '../ui/base_page.dart';
import '../ui/event_detail_page.dart';
import '../widgets/custom_page.dart';
// import '/helpers/argument.dart';

import '/services/navigation_service.dart';

import 'locator.dart';

class Routes {

  static late FluroRouter router;

  static const String base = '/baseView';
  static const String login = '/loginView';
  static const String register = '/registerView';
  static const String eventDetail = '/eventDetailView';
  static const String forgotPassword = '/forgotPasswordView';
  static const String downloadCert = '/downloadCertView';
  static const String editAccount = '/editAccountView';
  static const String addEvent = '/addEventView';
  static const String addChurch = '/addChurchView';

  static void configureRoutes(FluroRouter router) {
    router.define(base, handler: baseHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
    router.define(eventDetail, handler: eventDetailHandler);
    router.define(forgotPassword, handler: forgotPasswordHandler);
    router.define(downloadCert, handler: downloadCertHandler);
    router.define(editAccount, handler: editAccountHandler);
    router.define(addEvent, handler: addEventHandler);
    router.define(addChurch, handler: addChurchHandler);

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

var eventDetailHandler = Handler(
  handlerFunc: (context, params) {
    return const EventDetailPage();
  },
);

var forgotPasswordHandler = Handler(
  handlerFunc: (context, params) {
    return const ForgotPasswordPage();
  },
);

var downloadCertHandler = Handler(
  handlerFunc: (context, params) {
    return const DownloadCertPage();
  },
);

var editAccountHandler = Handler(
  handlerFunc: (context, params) {
    return const EditAccountPage();
  },
);

var addEventHandler = Handler(
  handlerFunc: (context, params) {
    return const AddEventPage();
  }
);

var addChurchHandler = Handler(
    handlerFunc: (context, params) {
      return const AddChurchPage();
    }
);

// var baseHandler = Handler(
//   handlerFunc: (context, params) {
//     return const BasePage();
//   },
// );