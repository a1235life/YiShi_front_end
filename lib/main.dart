import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ingredients/global/routes.dart';
import 'package:ingredients/global/userInfo.dart';
import 'package:ingredients/pages/Loading/LoadingPage.dart';
import 'package:provide/provide.dart';


void main() {
  var userInfo = new UserInfo();
  var providers = Providers();
  providers
    ..provide(Provider<UserInfo>.value(userInfo));

  runApp(ProviderNode(child: MyApp(),providers: providers,));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //右上角debug横幅

      //全局字体  fontFamily: "BQ"
      theme: ThemeData(primarySwatch: Colors.green),
      //primarySwatch主色，决定导航栏颜色
       home:LoadingPage(),
      //初始化的时候加载的路由
      //initialRoute: "/LoadingPage",
      onGenerateRoute: onGenerateRoute,
      //日历  支持中文
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      locale: const Locale('zh'),
    );
  }

}

