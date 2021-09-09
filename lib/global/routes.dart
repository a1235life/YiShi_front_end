import 'package:flutter/material.dart';
import 'package:ingredients/pages/Loading/LoadingPage.dart';
import 'package:ingredients/pages/home/secondPages/choose_menu_page.dart';
import 'package:ingredients/pages/home/secondPages/match_menu_page.dart';
import 'package:ingredients/pages/home/secondPages/choose_page.dart';
import 'package:ingredients/pages/home/secondPages/match_page.dart';
//页面
import 'package:ingredients/pages/bottom/botAppBar.dart';
import 'package:ingredients/pages/home/secondPages/search_page.dart';
import 'package:ingredients/pages/home/secondPages/menu_page.dart';
import 'package:ingredients/pages/home/secondPages/more_page.dart';
import 'package:ingredients/pages/home/thirdPages/food_baseinfo.dart';
import 'package:ingredients/pages/home/thirdPages/photoresultpage.dart';
import 'package:ingredients/pages/log/secondPages/add_new_log.dart';
import 'package:ingredients/pages/bottom/photoaffirm.dart';
import 'package:ingredients/pages/log/secondPages/edit_log.dart';
import 'package:ingredients/pages/search/SearchResultPage.dart';
//配置路由
final routes ={
  '/first': (context) =>BotAppBar(),
  '/SearchPage': (context) =>SearchPage(),
  '/MenuPage': (context) =>MenuPage(),
  '/MorePage': (context) =>MorePage(),
  "/FoodBaseInfoPage":(context) =>FoodBaseInfoPage(),
  "/PhotoResultPage":(context) =>PhotoResultPage(),
  "/MatchPage":(context) =>MatchPage(),
  "/ChoosePage":(context) =>ChoosePage(),
  "/AddNewLog":(context) =>AddNewLog(),
  "/PhotoAffirm":(context) =>PhotoAffirm(),
  "/LoadingPage":(context) =>LoadingPage(),
  "/SearchResultPage":(context)=>SearchResultPage(),
  "/MatchMenuPage":(context)=>MatchMenuPage(),
  "/ChooseMenuPage":(context)=>ChooseMenuPage(),
  "/EditLog":(context,{arguments})=>EditLog(arguments:arguments),//传参
};



//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};