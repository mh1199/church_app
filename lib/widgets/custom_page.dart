import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:after_layout/after_layout.dart';
// import 'package:bot_toast/bot_toast.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../helpers/enums.dart';
import '../configs/routes_handler.dart';
// import '/helpers/colors.dart';
import '/helpers/constants.dart';
// import '/helpers/styles.dart';
// import '/helpers/utils.dart';

import '/configs/locator.dart';

import '/services/navigation_service.dart';

import '/stores/global_state.dart';

// import 'app_bar.dart';

Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
  return Center(
    child: Text('SomethingWentWrongWidget'.tr(),
        textScaleFactor: 0.7,),
        // style: Theme.of(context)
        //     .textTheme
        //     .copyWith(color: AppColors.GRAY)),
  );
}

customizeText(String text, TextStyle style) {
  return Text(
    text,
    style: style,
    textAlign: TextAlign.center,
    // textScaleFactor: scale,
  );
}

// void showToast(String txt, bool status, bool title, String? titletxt) {
//   BotToast.showCustomNotification(
//     duration: Duration(seconds: 4),
//     animationDuration: Duration(milliseconds: 200),
//     toastBuilder: (cancel) => Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         width: 500,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: AppColors.WHITE,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 10,
//               offset: Offset(-2, 10), // changes the position of the shadow
//             ),
//           ],
//           border: Border.all(color: AppColors.LIGHT2),
//         ),
//         child: Row(
//           children: [
//             Padding(
//               padding:
//                   const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
//               child: status
//                   ? Icon(Icons.check, color: Colors.green)
//                   : Icon(size: 20, Icons.warning_amber, color: Colors.red),
//             ),
//             Flexible(
//               child: ListView(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 children: [
//                   titletxt != "" && titletxt != null
//                       ? Column(
//                           children: [
//                             Text(
//                               titletxt ?? "",
//                               style: textStyleBold16,
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 8),
//                           ],
//                         )
//                       : Container(),
//                   Text(
//                     txt,
//                     style: textStyle16,
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        // backgroundColor: AppColors.PURPLE_1,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: const Text('Error',
              textScaleFactor: 1.0),
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Pages Not Found'),
            ],
          ),
        ),
      ),
    );
  }
}

// class MaintenancePage extends StatelessWidget {
//   final String? url;
//
//   const MaintenancePage({Key? key, required this.url}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final globalState = Provider.of<GlobalState>(
//         locator<NavigationService>().context(),
//         listen: false);
//     var logout = false;
//     // if (url != null && url == Constants.URL_LOGOUT) logout = true;
//     return WillPopScope(
//       // onWillPop: () async {
//       //   await Future.delayed(Duration(milliseconds: 100));
//       //   return SystemChannels.platform.invokeMethod('SystemNavigator.pop') as bool;
//       // },
//       onWillPop: () {
//         return Future.value(false);
//       },
//       child: Scaffold(
//         backgroundColor: AppColors.LIGHT_1,
//         // appBar: CustomAppBar(
//         //   isHomepage: false,
//         //   title: Constants.APP_NAME,
//         //   store: null,
//         //   showLogo: false,
//         //   showBack: true,
//         //   main: false,
//         // ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               flex: 1,
//               child: Container(),
//             ),
//             Expanded(
//               flex: 5,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 50.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     // Image.asset(Constants.PATH_ICON_MAIN_LOGO, scale: 4, fit: BoxFit.cover),
//                     SizedBox(height: 70.0),
//                     Text('MaintenanceDesc1'.tr(),
//                         textAlign: TextAlign.center,
//                         style: textStyleBlackBold20),
//                     SizedBox(height: 30.0),
//                     Text('MaintenanceDesc2'.tr(),
//                         textAlign: TextAlign.center, style: textStyleBlack18),
//                     SizedBox(height: 10.0),
//                     Text('MaintenanceDesc3'.tr(),
//                         textAlign: TextAlign.center, style: textStyleBlack18),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Column(
//                 children: [
//                   Visibility(
//                     visible: logout,
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           width: 250.0,
//                           child: TextButton(
//                             style: TextButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 side: BorderSide(
//                                   color: AppColors.LIGHT_1,
//                                 ),
//                                 borderRadius: BorderRadius.circular(4.0),
//                               ),
//                             ),
//                             onPressed: () async {
//                               if (logout) {
//                                 Navigator.pop(context);
//
//                                 // await globalState.removeUserCredentialsWithoutClearData();
//                               }
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 10.0, horizontal: 50.0),
//                               child: Text('ForceLogout'.tr(),
//                                   style: textStyleBlackBold18),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20.0),
//                       ],
//                     ),
//                   ),
//                   // SizedBox(
//                   //   width: 250.0,
//                   //   child: TextButton(
//                   //     style: TextButton.styleFrom(
//                   //       shape: RoundedRectangleBorder(
//                   //         side: BorderSide(
//                   //           color: AppColors.LIGHT_1,
//                   //         ),
//                   //         borderRadius: BorderRadius.circular(4.0),
//                   //       ),
//                   //     ),
//                   //     onPressed: () async {
//                   //       if (globalState.getIsAutoLogin) {
//                   //         var internet = await NetworkCheck().getConnectivity();
//                   //         if (internet) {
//                   //           var uptime = await globalState.fetchUptimeCheck();
//                   //           print('uptime : $uptime');
//                   //
//                   //           if (uptime) {
//                   //             Navigator.pop(context, false);
//                   //           }
//                   //         } else {
//                   //           Navigator.pop(context, false);
//                   //         }
//                   //       } else {
//                   //
//                   //         print("=====close");
//                   //         print(globalState.getBaseStore!.getIsLoadCompleted);
//                   //
//                   //         print(globalState.getUploadTask);
//                   //         print(globalState.getBaseStore?.getPhotoUploadStatus);
//                   //         // print(baseStore.getIsLoadCompleted);
//                   //         // baseStore.getPhotoUploadStatus
//                   //         if(globalState.getUploadTask || globalState.getBaseStore?.getPhotoUploadStatus != StatusTypeEnum.COMPLETED && globalState.getBaseStore?.getPhotoUploadStatus != StatusTypeEnum.NONE){
//                   //
//                   //           // await globalState.getSyncStore?.getUnuploadedCount();
//                   //           Navigator.pop(locator<NavigationService>().context());
//                   //           // globalState.getSyncStore!.uploadAllTask();
//                   //         }
//                   //
//                   //         Navigator.pop(context);
//                   //       }
//                   //     },
//                   //     child: Container(
//                   //       padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
//                   //       child: Text(globalState.getIsAutoLogin ? 'TryAgain'.tr() : 'Close'.tr(), style: textStyleButtonGrayBold18),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class TimeOutDialog {
//   final String? url;
//
//   final VoidCallback action;
//
//   final globalState = Provider.of<GlobalState>(
//       locator<NavigationService>().context(),
//       listen: false);
//
//   TimeOutDialog(this.url, this.action);
//
//   void show() {
//     globalState.setTimeout(true);
//     _showDialog();
//   }
//
//   bool isShowing() {
//     return globalState.getTimeout;
//   }
//
//   Future _showDialog() {
//     var tryAgain = true;
//     if (url != null) tryAgain = false;
//     return showDialog(
//       context: locator<NavigationService>().context(),
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return WillPopScope(
//           onWillPop: () {
//             return Future.value(false);
//           },
//           child: AlertDialog(
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).pop();
//                         globalState.setTimeout(false);
//                       },
//                       child: Icon(Icons.close,
//                           color: AppColors.SILVER, size: 30.0),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 30.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       // Image.asset(Constants.PATH_ICON_MAIN_LOGO_X, fit: BoxFit.cover),
//                       SizedBox(height: 30.0),
//                       Text('Whoops'.tr(), style: textStyleBlack18),
//                       SizedBox(height: 20.0),
//                       Text('TimeOut'.tr(),
//                           textAlign: TextAlign.center,
//                           style: textStyleBlackBold16),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 40.0),
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 20.0),
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       padding: EdgeInsets.symmetric(
//                           vertical: 15.0, horizontal: 40.0),
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           color: AppColors.SILVER,
//                         ),
//                         borderRadius: BorderRadius.circular(4.0),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                       globalState.setTimeout(false);
//                       if (tryAgain) action();
//                     },
//                     child: Text(tryAgain ? 'TryAgain'.tr() : 'Close'.tr(),
//                         style: textStyleBlackBold18),
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

compulsoryField() {
  return Container(
    padding: const EdgeInsets.only(left: 0),
    alignment: Alignment.topRight,
    child: const Text(
      "*",
      style: TextStyle(color: Colors.red, fontSize: 16),
    ),
  );
}

dividerHorizontal() {
  return Divider(
    height: 1,
    endIndent: 1,
    color: Colors.grey.withOpacity(1),
  );
}
