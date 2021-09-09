import 'package:flutter/material.dart';

/**
 * Provide  管理全局食材信息的改变
 */
class FoodDetail with ChangeNotifier{

  List<Map> shiCaiBaiKeList;//食材百科
  List<Map> xiangKeDaPeiList;//相克搭配
  List<Map> tiaoXuanCunChuList;//挑选存储

  List<Map> childCategoryList;//菜单右边孩子


  //更新食材信息

  getShiCaiBaiKe(List list){ //不用管理听众
    shiCaiBaiKeList = list;
    notifyListeners(); //变化后通知听众，局部刷新Widget
  }

  getXiangKeDaPei(List list){ //不用管理听众
    xiangKeDaPeiList = list;
    notifyListeners(); //变化后通知听众，局部刷新Widget
  }

  getTiaoXuanCunChu(List list){ //不用管理听众
    tiaoXuanCunChuList = list;
    notifyListeners(); //变化后通知听众，局部刷新Widget
  }

  getChildCategory(List list){ //不用管理听众
    childCategoryList = list;
    notifyListeners(); //变化后通知听众，局部刷新Widget
  }

}