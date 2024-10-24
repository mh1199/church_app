
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../helpers/enums.dart';
import '/helpers/constants.dart';

import '/stores/base_store.dart';

class CustomBottomNavigation extends StatelessWidget {
  final BaseStore store;

  const CustomBottomNavigation({Key? key, required this.store})
      : super(key: key);

  BottomNavigationBarItem _buildItem(
      {required TabItemEnum tabItem}) {
    var text = store.getNavDescription(tabItem);
    var icon = store.getNavIconPath(tabItem);

    // var img;
    // var img = AssetImage(Constants.PATH_PLACE_HOLDER_PERSONAL);

    print('WHYWHYWHYWHYWHYWHY');

    // if (store.globalState.getSettingStore!.getImageFile != null) {
    //   img = store.globalState.getSettingStore!.getImageFile != null
    //       ? FileImage(store.globalState.getSettingStore!.getImageFile!)
    //       : NetworkImage(store.globalState.getSettingStore!.getImage!);
    // } else {
    //   img = store.globalState.getSettingStore!.getImage != null
    //       ? NetworkImage(store.globalState.getSettingStore!.getImage!)
    //       : AssetImage(Constants.PATH_PLACE_HOLDER_PERSONAL);
    // }

    // if (tabItem == TabItemEnum.CHAT) {
    //   enabled = store.globalState.getIndicatorSync;
    // } else if (tabItem == TabItemEnum.METER_READING) {
    //   enabled = store.globalState.getIndicatorMeterReading;
    // } else if (tabItem == TabItemEnum.AD_HOC_TASK) {
    //   enabled = store.globalState.getIndicatorAdHocTask;
    // }
    var count = store.globalState.getTotalCount;
    return BottomNavigationBarItem(
      // label: '$text',
      label: '',
      icon: Stack(
        children: [
          Container(
            //TODO change to pretty
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(icon,
                      width: 24,
                      height: 24,
                      color: store.getNavTabColor(item: tabItem),
                      fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              // backgroundColor: AppColors.WHITE,
              type: BottomNavigationBarType.fixed,
              // selectedFontSize: Constants.FONT_10.sp,
              selectedItemColor: Colors.blueAccent,
              // unselectedFontSize: Constants.FONT_10.sp,
              unselectedItemColor: Colors.grey,
              items: [
                _buildItem(tabItem: TabItemEnum.HOME),
                _buildItem(tabItem: TabItemEnum.CERT),
                _buildItem(tabItem: TabItemEnum.PROFILE)
              ],
              currentIndex: store.getCurrentIndex,
              onTap: (index) {
                store.setCurrentIndex(index);
                store.setCurrentTab(store.getNavItem(index: index));
              },
            ),
          ),
        ),
      ),
    );
  }
}
