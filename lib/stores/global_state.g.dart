// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalState on _GlobalState, Store {
  Computed<bool>? _$getMaintenanceComputed;

  @override
  bool get getMaintenance =>
      (_$getMaintenanceComputed ??= Computed<bool>(() => super.getMaintenance,
              name: '_GlobalState.getMaintenance'))
          .value;
  Computed<bool>? _$getTimeoutComputed;

  @override
  bool get getTimeout =>
      (_$getTimeoutComputed ??= Computed<bool>(() => super.getTimeout,
              name: '_GlobalState.getTimeout'))
          .value;
  Computed<bool>? _$getOnTappedComputed;

  @override
  bool get getOnTapped =>
      (_$getOnTappedComputed ??= Computed<bool>(() => super.getOnTapped,
              name: '_GlobalState.getOnTapped'))
          .value;
  Computed<bool>? _$getLoadingComputed;

  @override
  bool get getLoading =>
      (_$getLoadingComputed ??= Computed<bool>(() => super.getLoading,
              name: '_GlobalState.getLoading'))
          .value;
  Computed<int>? _$getTotalCountComputed;

  @override
  int get getTotalCount =>
      (_$getTotalCountComputed ??= Computed<int>(() => super.getTotalCount,
              name: '_GlobalState.getTotalCount'))
          .value;
  Computed<String>? _$getUuidComputed;

  @override
  String get getUuid => (_$getUuidComputed ??=
          Computed<String>(() => super.getUuid, name: '_GlobalState.getUuid'))
      .value;
  Computed<String>? _$getHtmlStringComputed;

  @override
  String get getHtmlString =>
      (_$getHtmlStringComputed ??= Computed<String>(() => super.getHtmlString,
              name: '_GlobalState.getHtmlString'))
          .value;
  Computed<DateTime?>? _$getCurrentBackPressTimeComputed;

  @override
  DateTime? get getCurrentBackPressTime =>
      (_$getCurrentBackPressTimeComputed ??= Computed<DateTime?>(
              () => super.getCurrentBackPressTime,
              name: '_GlobalState.getCurrentBackPressTime'))
          .value;
  Computed<bool>? _$getDrawerComputed;

  @override
  bool get getDrawer => (_$getDrawerComputed ??=
          Computed<bool>(() => super.getDrawer, name: '_GlobalState.getDrawer'))
      .value;
  Computed<bool>? _$getIsInForegroundComputed;

  @override
  bool get getIsInForeground => (_$getIsInForegroundComputed ??= Computed<bool>(
          () => super.getIsInForeground,
          name: '_GlobalState.getIsInForeground'))
      .value;
  Computed<bool>? _$getRefreshComputed;

  @override
  bool get getRefresh =>
      (_$getRefreshComputed ??= Computed<bool>(() => super.getRefresh,
              name: '_GlobalState.getRefresh'))
          .value;
  Computed<bool>? _$getIsLoggedInComputed;

  @override
  bool get getIsLoggedIn =>
      (_$getIsLoggedInComputed ??= Computed<bool>(() => super.getIsLoggedIn,
              name: '_GlobalState.getIsLoggedIn'))
          .value;
  Computed<bool>? _$getShowPopUpComputed;

  @override
  bool get getShowPopUp =>
      (_$getShowPopUpComputed ??= Computed<bool>(() => super.getShowPopUp,
              name: '_GlobalState.getShowPopUp'))
          .value;
  Computed<bool>? _$getIsSearchComputed;

  @override
  bool get getIsSearch =>
      (_$getIsSearchComputed ??= Computed<bool>(() => super.getIsSearch,
              name: '_GlobalState.getIsSearch'))
          .value;
  Computed<Color>? _$getAppbarColorComputed;

  @override
  Color get getAppbarColor =>
      (_$getAppbarColorComputed ??= Computed<Color>(() => super.getAppbarColor,
              name: '_GlobalState.getAppbarColor'))
          .value;
  Computed<String>? _$getPrivateKeyComputed;

  @override
  String get getPrivateKey =>
      (_$getPrivateKeyComputed ??= Computed<String>(() => super.getPrivateKey,
              name: '_GlobalState.getPrivateKey'))
          .value;

  late final _$appbarColorAtom =
      Atom(name: '_GlobalState.appbarColor', context: context);

  @override
  Color get appbarColor {
    _$appbarColorAtom.reportRead();
    return super.appbarColor;
  }

  @override
  set appbarColor(Color value) {
    _$appbarColorAtom.reportWrite(value, super.appbarColor, () {
      super.appbarColor = value;
    });
  }

  late final _$maintenanceAtom =
      Atom(name: '_GlobalState.maintenance', context: context);

  @override
  bool get maintenance {
    _$maintenanceAtom.reportRead();
    return super.maintenance;
  }

  @override
  set maintenance(bool value) {
    _$maintenanceAtom.reportWrite(value, super.maintenance, () {
      super.maintenance = value;
    });
  }

  late final _$timeoutAtom =
      Atom(name: '_GlobalState.timeout', context: context);

  @override
  bool get timeout {
    _$timeoutAtom.reportRead();
    return super.timeout;
  }

  @override
  set timeout(bool value) {
    _$timeoutAtom.reportWrite(value, super.timeout, () {
      super.timeout = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_GlobalState.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$onTappedAtom =
      Atom(name: '_GlobalState.onTapped', context: context);

  @override
  bool get onTapped {
    _$onTappedAtom.reportRead();
    return super.onTapped;
  }

  @override
  set onTapped(bool value) {
    _$onTappedAtom.reportWrite(value, super.onTapped, () {
      super.onTapped = value;
    });
  }

  late final _$currentBackPressTimeAtom =
      Atom(name: '_GlobalState.currentBackPressTime', context: context);

  @override
  DateTime? get currentBackPressTime {
    _$currentBackPressTimeAtom.reportRead();
    return super.currentBackPressTime;
  }

  @override
  set currentBackPressTime(DateTime? value) {
    _$currentBackPressTimeAtom.reportWrite(value, super.currentBackPressTime,
        () {
      super.currentBackPressTime = value;
    });
  }

  late final _$drawerAtom = Atom(name: '_GlobalState.drawer', context: context);

  @override
  bool get drawer {
    _$drawerAtom.reportRead();
    return super.drawer;
  }

  @override
  set drawer(bool value) {
    _$drawerAtom.reportWrite(value, super.drawer, () {
      super.drawer = value;
    });
  }

  late final _$isInForegroundAtom =
      Atom(name: '_GlobalState.isInForeground', context: context);

  @override
  bool get isInForeground {
    _$isInForegroundAtom.reportRead();
    return super.isInForeground;
  }

  @override
  set isInForeground(bool value) {
    _$isInForegroundAtom.reportWrite(value, super.isInForeground, () {
      super.isInForeground = value;
    });
  }

  late final _$refreshAtom =
      Atom(name: '_GlobalState.refresh', context: context);

  @override
  bool get refresh {
    _$refreshAtom.reportRead();
    return super.refresh;
  }

  @override
  set refresh(bool value) {
    _$refreshAtom.reportWrite(value, super.refresh, () {
      super.refresh = value;
    });
  }

  late final _$showPopupAtom =
      Atom(name: '_GlobalState.showPopup', context: context);

  @override
  bool get showPopup {
    _$showPopupAtom.reportRead();
    return super.showPopup;
  }

  @override
  set showPopup(bool value) {
    _$showPopupAtom.reportWrite(value, super.showPopup, () {
      super.showPopup = value;
    });
  }

  late final _$totalCountAtom =
      Atom(name: '_GlobalState.totalCount', context: context);

  @override
  int get totalCount {
    _$totalCountAtom.reportRead();
    return super.totalCount;
  }

  @override
  set totalCount(int value) {
    _$totalCountAtom.reportWrite(value, super.totalCount, () {
      super.totalCount = value;
    });
  }

  late final _$htmlStringAtom =
      Atom(name: '_GlobalState.htmlString', context: context);

  @override
  String get htmlString {
    _$htmlStringAtom.reportRead();
    return super.htmlString;
  }

  @override
  set htmlString(String value) {
    _$htmlStringAtom.reportWrite(value, super.htmlString, () {
      super.htmlString = value;
    });
  }

  late final _$isLoggedInAtom =
      Atom(name: '_GlobalState.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$uuidAtom = Atom(name: '_GlobalState.uuid', context: context);

  @override
  String get uuid {
    _$uuidAtom.reportRead();
    return super.uuid;
  }

  @override
  set uuid(String value) {
    _$uuidAtom.reportWrite(value, super.uuid, () {
      super.uuid = value;
    });
  }

  late final _$isSearchAtom =
      Atom(name: '_GlobalState.isSearch', context: context);

  @override
  bool get isSearch {
    _$isSearchAtom.reportRead();
    return super.isSearch;
  }

  @override
  set isSearch(bool value) {
    _$isSearchAtom.reportWrite(value, super.isSearch, () {
      super.isSearch = value;
    });
  }

  late final _$privateKeyAtom =
      Atom(name: '_GlobalState.privateKey', context: context);

  @override
  String get privateKey {
    _$privateKeyAtom.reportRead();
    return super.privateKey;
  }

  @override
  set privateKey(String value) {
    _$privateKeyAtom.reportWrite(value, super.privateKey, () {
      super.privateKey = value;
    });
  }

  late final _$showAsyncAction =
      AsyncAction('_GlobalState.show', context: context);

  @override
  Future show() {
    return _$showAsyncAction.run(() => super.show());
  }

  late final _$dismissAsyncAction =
      AsyncAction('_GlobalState.dismiss', context: context);

  @override
  Future dismiss() {
    return _$dismissAsyncAction.run(() => super.dismiss());
  }

  late final _$_GlobalStateActionController =
      ActionController(name: '_GlobalState', context: context);

  @override
  dynamic setMaintenance(bool value) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setMaintenance');
    try {
      return super.setMaintenance(value);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTimeout(bool value) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setTimeout');
    try {
      return super.setTimeout(value);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOnTapped(bool data) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setOnTapped');
    try {
      return super.setOnTapped(data);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUuid(String id) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setUuid');
    try {
      return super.setUuid(id);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHtmlString(String value) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setHtmlString');
    try {
      return super.setHtmlString(value);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentBackPressTime(DateTime value) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setCurrentBackPressTime');
    try {
      return super.setCurrentBackPressTime(value);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAppbarColor(Color data) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setAppbarColor');
    try {
      return super.setAppbarColor(data);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDrawer(bool value) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setDrawer');
    try {
      return super.setDrawer(value);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsInForeground(bool value) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setIsInForeground');
    try {
      return super.setIsInForeground(value);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRefresh(bool data) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setRefresh');
    try {
      return super.setRefresh(data);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowPopup(bool v) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setShowPopup');
    try {
      return super.setShowPopup(v);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTotalCount(int count) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setTotalCount');
    try {
      return super.setTotalCount(count);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoggedIn(bool value) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setIsLoggedIn');
    try {
      return super.setIsLoggedIn(value);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsSearch(bool b) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setIsSearch');
    try {
      return super.setIsSearch(b);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPrivateKey(String priKey) {
    final _$actionInfo = _$_GlobalStateActionController.startAction(
        name: '_GlobalState.setPrivateKey');
    try {
      return super.setPrivateKey(priKey);
    } finally {
      _$_GlobalStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appbarColor: ${appbarColor},
maintenance: ${maintenance},
timeout: ${timeout},
loading: ${loading},
onTapped: ${onTapped},
currentBackPressTime: ${currentBackPressTime},
drawer: ${drawer},
isInForeground: ${isInForeground},
refresh: ${refresh},
showPopup: ${showPopup},
totalCount: ${totalCount},
htmlString: ${htmlString},
isLoggedIn: ${isLoggedIn},
uuid: ${uuid},
isSearch: ${isSearch},
privateKey: ${privateKey},
getMaintenance: ${getMaintenance},
getTimeout: ${getTimeout},
getOnTapped: ${getOnTapped},
getLoading: ${getLoading},
getTotalCount: ${getTotalCount},
getUuid: ${getUuid},
getHtmlString: ${getHtmlString},
getCurrentBackPressTime: ${getCurrentBackPressTime},
getDrawer: ${getDrawer},
getIsInForeground: ${getIsInForeground},
getRefresh: ${getRefresh},
getIsLoggedIn: ${getIsLoggedIn},
getShowPopUp: ${getShowPopUp},
getIsSearch: ${getIsSearch},
getAppbarColor: ${getAppbarColor},
getPrivateKey: ${getPrivateKey}
    ''';
  }
}
