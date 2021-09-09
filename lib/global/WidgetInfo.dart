import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ingredients/global/Adapt.dart';//适配器

class WidgetInfo{
  //顶部AppBar
  static double topFontSize = Adapt.px(40); //字体大小
  static Color topFontColor = Colors.white;//字体颜色
     //阿里云多彩图标
  static double topIconSize = Adapt.px(40);//图标大小  （首页搜索按钮）
  static String topIconColor = "white";//图标颜色  （首页搜索按钮）


  static void set_topFontSize(double fontSize){
    topFontSize =fontSize;
  }
  static double get_topFontSize(){
    return topFontSize;
  }

  static void set_topFontColor(Color fontColor){
    topFontColor = fontColor;
  }
  static Color get_topFontColor(){
    return topFontColor;
  }

  static void set_topIconSize(double iconSize){
    topIconSize =iconSize;
  }
  static double get_topIconSize(){
    return topIconSize;
  }

  static void set_topIconColor(String iconColor){
    topIconColor = iconColor;
  }
  static String get_topIconColor(){
    return topIconColor;
  }


}