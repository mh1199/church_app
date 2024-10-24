// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStore on _BaseStore, Store {
  Computed<TabItemEnum>? _$getCurrentTabComputed;

  @override
  TabItemEnum get getCurrentTab => (_$getCurrentTabComputed ??=
          Computed<TabItemEnum>(() => super.getCurrentTab,
              name: '_BaseStore.getCurrentTab'))
      .value;
  Computed<int>? _$getCurrentIndexComputed;

  @override
  int get getCurrentIndex =>
      (_$getCurrentIndexComputed ??= Computed<int>(() => super.getCurrentIndex,
              name: '_BaseStore.getCurrentIndex'))
          .value;
  Computed<List<Widget>>? _$getChildrenComputed;

  @override
  List<Widget> get getChildren =>
      (_$getChildrenComputed ??= Computed<List<Widget>>(() => super.getChildren,
              name: '_BaseStore.getChildren'))
          .value;
  Computed<int>? _$getCurrentMenuIndexComputed;

  @override
  int get getCurrentMenuIndex => (_$getCurrentMenuIndexComputed ??=
          Computed<int>(() => super.getCurrentMenuIndex,
              name: '_BaseStore.getCurrentMenuIndex'))
      .value;
  Computed<bool>? _$getPasscodeErrorComputed;

  @override
  bool get getPasscodeError => (_$getPasscodeErrorComputed ??= Computed<bool>(
          () => super.getPasscodeError,
          name: '_BaseStore.getPasscodeError'))
      .value;

  late final _$currentTabAtom =
      Atom(name: '_BaseStore.currentTab', context: context);

  @override
  TabItemEnum get currentTab {
    _$currentTabAtom.reportRead();
    return super.currentTab;
  }

  @override
  set currentTab(TabItemEnum value) {
    _$currentTabAtom.reportWrite(value, super.currentTab, () {
      super.currentTab = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_BaseStore.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$childrenAtom =
      Atom(name: '_BaseStore.children', context: context);

  @override
  List<Widget> get children {
    _$childrenAtom.reportRead();
    return super.children;
  }

  @override
  set children(List<Widget> value) {
    _$childrenAtom.reportWrite(value, super.children, () {
      super.children = value;
    });
  }

  late final _$passcodeErrorAtom =
      Atom(name: '_BaseStore.passcodeError', context: context);

  @override
  bool get passcodeError {
    _$passcodeErrorAtom.reportRead();
    return super.passcodeError;
  }

  @override
  set passcodeError(bool value) {
    _$passcodeErrorAtom.reportWrite(value, super.passcodeError, () {
      super.passcodeError = value;
    });
  }

  late final _$currentMenuIndexAtom =
      Atom(name: '_BaseStore.currentMenuIndex', context: context);

  @override
  int get currentMenuIndex {
    _$currentMenuIndexAtom.reportRead();
    return super.currentMenuIndex;
  }

  @override
  set currentMenuIndex(int value) {
    _$currentMenuIndexAtom.reportWrite(value, super.currentMenuIndex, () {
      super.currentMenuIndex = value;
    });
  }

  late final _$initBaseDataAsyncAction =
      AsyncAction('_BaseStore.initBaseData', context: context);

  @override
  Future initBaseData() {
    return _$initBaseDataAsyncAction.run(() => super.initBaseData());
  }

  late final _$initTabsAsyncAction =
      AsyncAction('_BaseStore.initTabs', context: context);

  @override
  Future initTabs() {
    return _$initTabsAsyncAction.run(() => super.initTabs());
  }

  late final _$gotoTabAsyncAction =
      AsyncAction('_BaseStore.gotoTab', context: context);

  @override
  Future gotoTab(int index) {
    return _$gotoTabAsyncAction.run(() => super.gotoTab(index));
  }

  late final _$_BaseStoreActionController =
      ActionController(name: '_BaseStore', context: context);

  @override
  dynamic setCurrentTab(TabItemEnum tabItem) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setCurrentTab');
    try {
      return super.setCurrentTab(tabItem);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentIndex(int index) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setCurrentIndex');
    try {
      return super.setCurrentIndex(index);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChildren(List<Widget> data) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setChildren');
    try {
      return super.setChildren(data);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentMenuIndex(int index) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setCurrentMenuIndex');
    try {
      return super.setCurrentMenuIndex(index);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPasscodeError(bool value) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setPasscodeError');
    try {
      return super.setPasscodeError(value);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  TabItemEnum getNavItem({int? index}) {
    final _$actionInfo =
        _$_BaseStoreActionController.startAction(name: '_BaseStore.getNavItem');
    try {
      return super.getNavItem(index: index);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getNavDescription(TabItemEnum tabItem) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.getNavDescription');
    try {
      return super.getNavDescription(tabItem);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getNavIconPath(TabItemEnum tabItem) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.getNavIconPath');
    try {
      return super.getNavIconPath(tabItem);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Color getNavTabColor({required TabItemEnum item}) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.getNavTabColor');
    try {
      return super.getNavTabColor(item: item);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTab: ${currentTab},
currentIndex: ${currentIndex},
children: ${children},
passcodeError: ${passcodeError},
currentMenuIndex: ${currentMenuIndex},
getCurrentTab: ${getCurrentTab},
getCurrentIndex: ${getCurrentIndex},
getChildren: ${getChildren},
getCurrentMenuIndex: ${getCurrentMenuIndex},
getPasscodeError: ${getPasscodeError}
    ''';
  }
}
