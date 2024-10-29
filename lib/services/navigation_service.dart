import 'package:flutter/material.dart';

import '../ui/base_page.dart';
import '../ui/cert_page.dart';
import '../ui/home_page.dart';
import '../ui/profile_page.dart';



class NavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // final GlobalKey<DashboardPageState> dashboardViewKey = GlobalKey<DashboardPageState>();
  //
  final GlobalKey<BasePageState> basePageViewKey = GlobalKey<BasePageState>();
    final GlobalKey<HomePageState> homePageViewKey = GlobalKey<HomePageState>();
  final GlobalKey<CertPageState> certPageViewKey = GlobalKey<CertPageState>();
  final GlobalKey<ProfilePageState> profilePageViewKey = GlobalKey<ProfilePageState>();

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
