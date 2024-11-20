
import 'package:bot_toast/bot_toast.dart';
import 'package:church_system/ui/base_page.dart';
import 'package:church_system/ui/register_page.dart';
import 'package:church_system/ui/splash_page.dart';
import 'package:church_system/widgets/custom_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart' as l;

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

// import 'helpers/argument.dart';
// import 'helpers/colors.dart';
import 'helpers/constants.dart';

import 'configs/locator.dart';
import 'configs/routes_handler.dart';
import 'package:sizer/sizer.dart';

import 'helpers/enums.dart';
// import 'helpers/utils.dart';

import 'services/navigation_service.dart';

import 'stores/global_state.dart';

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  final _botToastBuilder = BotToastInit();


  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  init() async {

  }

  @override
  Widget build(BuildContext context) {
    final app = MultiProvider(
      providers: [
        Provider<GlobalState>(create: (_) => GlobalState()),
      ],
      child: Sizer(
        builder: (cx, orientation, deviceType) {
          return MaterialApp(
            navigatorKey: locator<NavigationService>().navigatorKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            localeResolutionCallback: (locale, supportedLocales) {

              for (var supportedLocale in supportedLocales) {

                if(supportedLocale.languageCode == context.locale.languageCode){
                  return supportedLocale;
                }

              }
              return supportedLocales.first;
            },

            title: 'CHURCH',
            debugShowCheckedModeBanner: false,
            // initialRoute: Routes.register,
            initialRoute: Routes.root,
            routes: <String, WidgetBuilder>{
              // Routes.base: (context) => const BasePage(page: 0,),
              // Routes.register: (context) => const RegisterPage(),
              Routes.root: (context) => const SplashPage(),
            },
            onGenerateRoute: Routes.router.generator,
            navigatorObservers: [
              BotToastNavigatorObserver(),
            ],
            builder: EasyLoading.init(
              builder: (context, widget) {
                widget = _botToastBuilder(context, widget);
                ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                  return getErrorWidget(context, errorDetails);
                };

                return Directionality(
                  textDirection: l.TextDirection.ltr,
                  child: Theme(
                    data: ThemeData(
                      // accentColor: AppColors.WHITE,
                      primaryColor: Colors.black,
                      canvasColor: Colors.white,
                      // fontFamily: Constants.FONT_CALIBRI,
                      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
                    ),
                    child:
                    MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: widget,
                    ),
                  ),
                );


              },
            ),
          );
        },
      ),
    );
    return app;
  }

}
