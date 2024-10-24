import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:io';
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../helpers/enums.dart';
import '../../widgets/bottom_navigation.dart';
import '/helpers/constants.dart';

import '/configs/locator.dart';
import '/configs/routes_handler.dart';

import '/stores/base_store.dart';

import '/services/navigation_service.dart';


class BasePage extends StatefulWidget {
  final int? page;

  const BasePage({Key? key, required this.page}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState extends State<BasePage>
    with WidgetsBindingObserver, AfterLayoutMixin<BasePage> {
  final _baseStore = BaseStore();
  @override
  void initState() {
    print("initDashboardas");
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    loadData();
  }


  init() async {
    _baseStore.globalState.setBaseStore(_baseStore);

    await _baseStore.initBaseData();

    print('gotopage');
    print(widget.page);
    _baseStore.gotoTab(widget.page!);
  }

  Future loadData() async {

  }

  @override
  Widget build(BuildContext context) {
    return
      // GestureDetector(
      // onTap: () {
      //   FocusScopeNode currentFocus = FocusScope.of(context);
      //   if (!currentFocus.hasPrimaryFocus) {
      //     currentFocus.focusedChild?.unfocus();
      //   }
      // },
      // child:
      WillPopScope(
        onWillPop: () {
          var loading = _baseStore.globalState.getLoading;
          if (loading) return Future.value(false);

          var drawer = _baseStore.globalState.getDrawer;
          if (drawer) return Future.value(false);

          DateTime? now = DateTime.now();
          bool doubleTap = _baseStore.globalState.getCurrentBackPressTime ==
              null
              ? true
              : now.difference(_baseStore.globalState.getCurrentBackPressTime ??
              DateTime.now()) >
              Duration(seconds: 2);

          print("doubleTap");
          if (doubleTap) {
            BotToast.showText(text: 'ExitAppDesc'.tr());

            _baseStore.globalState.setCurrentBackPressTime(now);
            return Future.value(false);
          }
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return Future.value(true);
        },
        child: SafeArea(
          bottom: Platform.isAndroid,
          child: Observer(
              builder: (_) {
                return Scaffold(
                  // appBar: CustomAppBar(
                  //   isHomepage: false,
                  //   title: '',
                  //   main: false,
                  //   showLogo: false,
                  //   showBack: false, store: null,
                  // ),
                  backgroundColor: Colors.white,
                  body: IndexedStack(
                    index: _baseStore.getCurrentIndex,
                    children: _baseStore.getChildren,
                  ),
                  drawerEdgeDragWidth: 20.0,
                  bottomNavigationBar: CustomBottomNavigation(store: _baseStore),
                );

              }

          ),
        ),
      );
    // );
  }
}
