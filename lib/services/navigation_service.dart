import 'package:flutter/material.dart';



class NavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // final GlobalKey<DashboardPageState> dashboardViewKey = GlobalKey<DashboardPageState>();
  //
  // final GlobalKey<CallPageState> callPageViewKey = GlobalKey<CallPageState>();
  //   final GlobalKey<ChatPageState> chatPageViewKey = GlobalKey<ChatPageState>();
  // final GlobalKey<SettingPageState> settingPageViewKey = GlobalKey<SettingPageState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateUntil(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  BuildContext context() {
    return navigatorKey.currentContext ?? navigatorKey.currentState!.overlay!.context;
  }

}
