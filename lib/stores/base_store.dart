
import 'package:church_system/ui/cert_page.dart';
import 'package:church_system/ui/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../configs/locator.dart';
import '../configs/routes_handler.dart';
import '../helpers/constants.dart';
import '../helpers/enums.dart';
import '../services/navigation_service.dart';
import '../services/rest_service.dart';
import '../ui/profile_page.dart';
import 'global_state.dart';

part 'base_store.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  final globalState = Provider.of<GlobalState>(
      locator<NavigationService>().context(),
      listen: false);
  // final List<Widget> children =[
  //   HomePage(),
  //   DashboardPage()];

  @observable
  TabItemEnum currentTab = TabItemEnum.HOME;

  @observable
  int currentIndex = 0;

  // @observable
  // List<Menu> _menuItems = [];

  // @observable
  // List<Widget> children = [
  //   CallPage(key: locator<NavigationService>().callPageViewKey,),
  //   ChatPage(key: locator<NavigationService>().chatPageViewKey,),
  //   SettingPage(key: locator<NavigationService>().settingPageViewKey,)
  // ];

  @observable
  List<Widget> children = [];

  @observable
  bool passcodeError = false;

  @observable
  int currentMenuIndex = -1;

  // @observable
  // PackageInfo? packageInfo;
  //
  // @computed
  // PackageInfo? get getPackageInfo => packageInfo;

  @computed
  TabItemEnum get getCurrentTab => currentTab;

  @computed
  int get getCurrentIndex => currentIndex;

  // @computed
  // List<Menu> get menuItems => _menuItems;

  @computed
  List<Widget> get getChildren => children;

  @computed
  int get getCurrentMenuIndex => currentMenuIndex;

  @computed
  bool get getPasscodeError => passcodeError;

  @action
  setCurrentTab(TabItemEnum tabItem) {
    currentTab = tabItem;
  }

  @action
  setCurrentIndex(int index) {
    currentIndex = index;
  }

  // @action
  // setMenuItem(List<Menu> data) {
  //   _menuItems = data;
  // }

  @action
  setChildren(List<Widget> data) {
    children = data;
  }

  @action
  setCurrentMenuIndex(int index) {
    currentMenuIndex = index;
    print("currentMenuIndex $currentMenuIndex");
  }

  @action
  setPasscodeError(bool value) {
    passcodeError = value;
  }

  // @action
  // initMenu() async {
  //   print("currentTab");
  //   print(getCurrentMenuIndex);
  //   print(getCurrentIndex);
  //   var loggedIn = await locator<PreferencesServiceImpl>().getIsLogin();
  //   print(loggedIn);
  //
  //   _menuItems = [
  //     Menu(
  //         name: 'Settings'.tr(),
  //         routeName: Routes.base,
  //         iconAsset: Constants.PATH_ICON_TAB_HOME),
  //     Menu(
  //         name: 'MenuFAQ'.tr(),
  //         routeName: Routes.base,
  //         iconAsset: Constants.PATH_ICON_TAB_HOME),
  //   ];
  //
  // }

  @action
  initBaseData() async {
    initTabs();
  }

  @action
  initTabs() async {

    // var chatStore = ChatStore();
    // chatStore.setSelectedTab(2);
    // globalState.setChatStore(chatStore);

    children = [
      HomePage(
          key: locator<NavigationService>().homePageViewKey
      ),
      CertPage(
        key: locator<NavigationService>().certPageViewKey,
      ),
      ProfilePage(
        key: locator<NavigationService>().profilePageViewKey,
      )
    ];
  }

  // @action
  // initBaseData() {
  //   initTabs();
  //   initData();
  // }

  // @action
  // initBaseData() async {
  //   initTabs();
  //   await initPackageInfo();
  //   initData();
  //   String uuid = await locator<PreferencesServiceImpl>().getUserUuid();
  //   globalState.setUuid(uuid);
  // }

  // @action
  // Future<void> initPackageInfo() async {
  //   final PackageInfo? info = await PackageInfo.fromPlatform();
  //   print('packageInfo : ${info?.version}');
  //   setPackageInfo(info);
  // }

  // @action
  // setPackageInfo(PackageInfo? info) {
  //   packageInfo = info;
  // }

  // @action
  // initData() async {
  //   var loggedIn = await locator<PreferencesServiceImpl>().getIsLogin();
  //
  //   if (loggedIn) {
  //     var firstName = await locator<PreferencesServiceImpl>().getFirstName();
  //     UserContent? content = globalState.getUserContent;
  //     content!.firstName = firstName;
  //
  //     print("firstName== $firstName");
  //     print(globalState.getUserContent == null);
  //   }
  // }

  @action
  gotoTab(int index) async {
    TabItemEnum item = getNavItem(index: index);
    setCurrentTab(item);
    setCurrentIndex(index);
    setCurrentMenuIndex(index);
  }

  @action
  TabItemEnum getNavItem({int? index}) {
    switch (index) {
      case 0:
        return TabItemEnum.HOME;
      case 1:
        return TabItemEnum.CERT;
      case 2:
        return TabItemEnum.PROFILE;
    }
    return TabItemEnum.HOME;
  }

  @action
  String getNavDescription(TabItemEnum tabItem) {
    switch (tabItem) {
      case TabItemEnum.HOME:
        return 'tabCall'.tr();
      case TabItemEnum.CERT:
        return 'tabChat'.tr();
      case TabItemEnum.PROFILE:
        return 'tabSetting'.tr();
    }
  }

  @action
  String getNavIconPath(TabItemEnum tabItem) {
    // switch (tabItem) {
    //   case TabItemEnum.CALLS:
    //     return Constants.PATH_BOTTOM_CALL;
    //   case TabItemEnum.CHAT:
    //     return Constants.PATH_BOTTOM_CHAT;
    //   case TabItemEnum.SETTING:
    //     return Constants.PATH_BOTTOM_SETTING;
    // }

    switch (tabItem) {
      case TabItemEnum.HOME:
        return Constants.PATH_ICON_HOME;
      case TabItemEnum.CERT:
        return Constants.PATH_ICON_CERT;
      case TabItemEnum.PROFILE:
        return Constants.PATH_ICON_PROFILE;
    }
  }

  @action
  Color getNavTabColor({required TabItemEnum item}) {
    return getCurrentTab == item ? Colors.black : Colors.grey;
  }

  // @action
  // fetchLogout() async {
  //   var internet = await NetworkCheck().getConnectivity();
  //   if (!internet) return;
  //
  //   final response = await locator<RestServiceImpl>().httpLogout();
  //   if (response == null) return;
  //
  //   GeneralResponse generalResponse = GeneralResponse.fromJson(response);
  //
  //   if (generalResponse.status == Constants.OK) {
  //     // await FirebaseMessaging.instance.deleteToken();
  //     globalState.removeUserCredentials();
  //     globalState.setIsLoggedIn(false);
  //   } else {
  //     print("find issue : ${response["errorMessage"]}");
  //     // generalResponse.errorMessage = "${response["errorMessage"]}";
  //     globalState.removeUserCredentials();
  //     globalState.setIsLoggedIn(false);
  //
  //     // Navigator.pop(locator<NavigationService>().context());
  //     // globalState.commonError(generalResponse);
  //   }
  // }
}
