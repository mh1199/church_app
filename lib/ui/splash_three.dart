import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:after_layout/after_layout.dart';
import 'package:provider/provider.dart';

import '../../services/navigation_service.dart';
import '../../stores/global_state.dart';
import '/configs/locator.dart';
import '/configs/routes_handler.dart';

import '/helpers/constants.dart';

class SplashThree extends StatefulWidget {

  const SplashThree({Key? key}) : super(key: key);

  @override
  SplashThreeState createState() => SplashThreeState();
}

class SplashThreeState extends State<SplashThree> with AfterLayoutMixin<SplashThree> {

  final globalState = Provider.of<GlobalState>(locator<NavigationService>().context(), listen: false);

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    loadData();
  }

  init() async {

  }

  Future loadData() async {

    Future.delayed(const Duration(milliseconds: 100), () async {

      Future.delayed(const Duration(seconds: 2), () {
        Routes.router.navigateTo(locator<NavigationService>().context(), Routes.base,replace: true);

      });



    });


  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash_three.jpg'), // Path to your image
                fit: BoxFit.cover, // Makes the image cover the entire screen
              ),
            ),
          ),
        ),
      ),
    );
  }

}
