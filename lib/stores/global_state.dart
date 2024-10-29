import 'dart:convert';
import 'dart:io';
import 'dart:ui';
// import 'package:basic_utils/basic_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configs/locator.dart';
import '../configs/routes_handler.dart';
import '../helpers/constants.dart';
// import '../helpers/utils.dart';
// import '../models/api_response.dart';
import '../services/navigation_service.dart';
// import '../services/preferences_service.dart';
import '../services/rest_service.dart';
import '../widgets/custom_page.dart';
import 'base_store.dart';
// import '../widgets/modal_bottom_sheets.dart';
// import 'auth_store.dart';
// import 'base_store.dart';
// import 'chat_store.dart';

part 'global_state.g.dart';

class GlobalState = _GlobalState with _$GlobalState;

abstract class _GlobalState with Store {

  @observable
  BaseStore? baseStore;

  @observable
  Color appbarColor = Colors.white;

  // @observable
  // AuthStore? authStore;

  @observable
  bool maintenance = false;

  @observable
  bool timeout = false;

  @observable
  bool loading = false;

  @observable
  bool onTapped = false;

  @observable
  DateTime? currentBackPressTime;

  @observable
  bool drawer = false;

  @observable
  bool isInForeground = true;

  @observable
  bool refresh = false;

  @observable
  bool showPopup = false;

  @observable
  int totalCount = 0;

  @observable
  String htmlString = '';

  @observable
  bool isLoggedIn = false;

  @observable
  String uuid = '';

  @observable
  bool isSearch = false;

  @observable
  String privateKey = '';

  @computed
  bool get getMaintenance => maintenance;

  @computed
  bool get getTimeout => timeout;

  @computed
  bool get getOnTapped => onTapped;

  @computed
  bool get getLoading => loading;

  @computed
  int get getTotalCount => totalCount;

  @computed
  String get getUuid => uuid;

  @computed
  String get getHtmlString => htmlString;

  @computed
  DateTime? get getCurrentBackPressTime => currentBackPressTime;

  @computed
  BaseStore? get getBaseStore => baseStore;

  @computed
  bool get getDrawer => drawer;

  @computed
  bool get getIsInForeground => isInForeground;

  @computed
  bool get getRefresh => refresh;

  @computed
  bool get getIsLoggedIn => isLoggedIn;

  @computed
  bool get getShowPopUp => showPopup;

  @computed
  bool get getIsSearch => isSearch;

  @computed
  Color get getAppbarColor => appbarColor;

  @computed
  String get getPrivateKey => privateKey;

  @action
  setBaseStore(BaseStore? value) {
    baseStore = value;
  }

  @action
  show() async {
    setLoading(true);
    await EasyLoading.show();
  }

  @action
  dismiss() async {
    setLoading(false);
    await EasyLoading.dismiss();
  }

  // @action
  // setBaseStore(BaseStore? value) {
  //   baseStore = value;
  // }

  @action
  setMaintenance(bool value) {
    maintenance = value;
  }

  @action
  setTimeout(bool value) {
    timeout = value;
  }

  @action
  setOnTapped(bool data) {
    onTapped = data;
  }

  @action
  setLoading(bool value) {
    loading = value;
  }

  @action
  setUuid(String id) {
    uuid == id;
  }

  @action
  setHtmlString(String value) {
    htmlString = value;
  }

  @action
  setCurrentBackPressTime(DateTime value) {
    currentBackPressTime = value;
  }

  @action
  setAppbarColor(Color data) {
    appbarColor = data;
  }

  @action
  setDrawer(bool value) {
    drawer = value;
  }

  @action
  setIsInForeground(bool value) {
    isInForeground = value;
  }

  @action
  setRefresh(bool data) {
    refresh = data;
  }

  @action
  setShowPopup(bool v) {
    showPopup = v;
  }

  @action
  setTotalCount(int count) {
    totalCount = count;
  }

  @action
  setIsLoggedIn(bool value) {
    isLoggedIn = value;
  }

  @action
  setIsSearch(bool b) {
    isSearch = b;
  }

  @action
  setPrivateKey(String priKey) {
    privateKey = priKey;
  }

  // @action
  // commonError(GeneralResponse generalResponse) {
  //   var content = generalResponse.errorMessage;
  //
  //   if (!getShowPopUp) {
  //     setShowPopup(true);
  //     ModalBottomSheets.showModalWithActions(
  //         locator<NavigationService>().context(),
  //         title: 'Error'.tr(),
  //         content:
  //             content == "Token invalid" ? "TokenInvalid".tr() : content ?? '',
  //         buttonText1: '',
  //         buttonText2: 'Ok'.tr(),
  //         sideIconAsset: Constants.PATH_ICON_ERROR,
  //         onAction1: () async {}, onAction2: () async {
  //       print("errormessage $content");
  //       setShowPopup(false);
  //       if (generalResponse.errorCode == "request.error.token.invalid") {
  //         removeUserCredentials();
  //       } else {
  //         Navigator.of(locator<NavigationService>().context()).pop();
  //       }
  //     });
  //   }
  // }

  // @action
  // showMaintenance(String url, VoidCallback reload) {
  //   print('maintenance : $getMaintenance');
  //   if (!getMaintenance) {
  //     setMaintenance(true);
  //
  //     Routes.router.navigateTo(
  //         locator<NavigationService>().context(), Routes.maintenance,
  //         transition: TransitionType.native);
  //   }
  // }

  // @action
  // showTimeout(String url, VoidCallback reload) {
  //   print('timeout : $getTimeout');
  //   TimeOutDialog pr = TimeOutDialog(url, reload);
  //   if (!pr.isShowing()) pr.show();
  // }

  // @action
  // removeUserCredentials() async {
  //   await locator<PreferencesServiceImpl>()
  //       .removeUserCredentials()
  //       .whenComplete(() async {
  //     await resetHiveBox();
  //     // cartSavedList.clear();
  //
  //     Navigator.of(locator<NavigationService>().context())
  //         .pushNamedAndRemoveUntil(Routes.onboardRoute, (p) => false);
  //
  //     // Routes.router.navigateTo(
  //     //     locator<NavigationService>().context(), Routes.onboardRoute,
  //     //     replace: true);
  //
  //     //
  //     // Navigator.pop(locator<NavigationService>().context());
  //
  //     // var route = '${Routes.base}?page=1';
  //     //
  //     // locator<NavigationService>().navigateUntil(route);
  //   });
  // }

  // @action
  // saveUserCredentials(UserContent user) async {
  //   if (user != null) {
  //     print("user===");
  //     print(user.token);
  //
  //     final SharedPreferences pref =
  //         await locator<PreferencesServiceImpl>().prefs;
  //     pref.setString(Constants.USER_TOKEN, user.token!);
  //     pref.setString(Constants.USER_UUID, user.uuid!);
  //     pref.setString(Constants.USER_PHONE, user.phone!);
  //     pref.setString(Constants.USER_DIALING_CODE, user.dialingCode!);
  //     pref.setString(Constants.USER_ACCESS_LEVEL, user.accessLevel!);
  //     pref.setInt(Constants.USER_CREATED_DATE, user.createdDate!);
  //     pref.setInt(Constants.USER_UPDATED_DATE, user.updatedDate!);
  //     pref.setBool(Constants.USER_NOTIFICATION, user.notification!);
  //
  //     pref.setBool(Constants.USER_SETUP_PROFILE, user.setupProfile!);
  //
  //     pref.setString(Constants.USER_SCREEN_NAME, user.screenName!);
  //
  //     pref.setString(
  //         Constants.USER_PHONE_WITH_DIALING_CODE, user.phoneWithDialingCode!);
  //
  //     if (Platform.isIOS) {
  //       await SharedPreferenceAppGroup.setAppGroup(Constants.appGroupID);
  //       await SharedPreferenceAppGroup.setString(
  //           'flutter.' + Constants.USER_UUID, '${user.uuid}');
  //       await SharedPreferenceAppGroup.setString(
  //           'flutter.' + Constants.USER_PHONE_WITH_DIALING_CODE,
  //           '${user.phoneWithDialingCode}');
  //       await SharedPreferenceAppGroup.setString(
  //           'flutter.' + Constants.USER_TOKEN, '${user.token}');
  //     }
  //   }
  // }
}
