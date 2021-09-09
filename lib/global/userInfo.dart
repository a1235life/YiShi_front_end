import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo with ChangeNotifier{
  //历史搜索
  static List SearchHistory= [];
  //"苹果", "茄子", "西红柿", "香菇", "洋葱", "胡萝卜", "草莓", "鱼", "西兰花", "玉米"
  //看看别人关心的
//  static List OtherSearch = ["抗癌", "美颜", "养心安神", "补钙", "补益脾胃", "降血压", "减肥", "提高免疫力"];

  static int LogId;//记录日志id
  static List<Map> LogList=[]; //日志信息

  static List set_SearchHistory(String search){
    SearchHistory.add(search);
  }

  static List get_SearchHistory(){
    return SearchHistory;
  }

  static List<Map> set_LogList(Map logList){
    LogList.add(logList);
  }

  static List<Map> get_LogList(){
    return LogList;
  }

  getLogList(List<Map> list){
    LogList = list;
    notifyListeners();//通知听众，局部刷新
  }





}