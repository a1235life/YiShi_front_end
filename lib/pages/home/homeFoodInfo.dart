import 'package:ingredients/global/global.dart';
class homeFoodInfo{
   //首页轮播图片
  static List<Map> homeHandpickList = [
  ];

  //菜单 左侧大类  食材类别
  static List menuCatgegroyLsit =[{"name":"水果类"},{"name":"菌类"},{"name":"蔬菜类"},{"name":"豆谷类"},{"name":"其他"}];
  static String _classify="水果类";
  static List _classifylist=[];
  static List _list1=[];
  static List _list2=[];
  static List _list3=[];
  static List _list4=[];
  static List _list5=[];
  //食材百科本地信息
  static  List<Map> menuShiCaiBaiKeList =
  [
    {
      "name": "洋葱",
      "classification":"蔬菜,葱蒜类",
      "introduction": "洋葱为百合科草本植物，二年生或多年生植物，是一种很普通的廉价家常菜。"
          "原产亚洲西部，在我国各地均有栽培，四季都有供应。洋葱供食用的部位为地下的肥大鳞茎(即葱头)。"
          "根据其皮色可分为白皮、黄皮和红皮三种：\n1.白皮种：鳞茎小，外表白色或略带绿色，肉质柔嫩，汁多辣叶淡"
          "，品质佳，适于生食。\n2.黄皮种：鳞茎中等大小，鳞片较薄，外皮黄色，肉钯白里带黄，肉质细嫩柔软，水分较少，"
          "味甜而稍带辣味，品质极佳。\n3.红皮种：鳞茎大，外皮为紫红色或暗粉红色，肉白里带红，组织致密，质地较脆，"
          "肉质不及黄皮种细嫩，水分较多，辣味较重，品质较差，但耐贮藏。\n国人常惧怕其特有的辛辣香气，"
          "而在国外它却被誉为“菜中皇后”，营养价值不低。\n洋葱的品质要求：以葱头肥大，外皮光泽，不烂，"
          "无机械伤和泥土，鲜葱头不带叶；经贮藏后，不松软，不抽苔，鳞片紧密，含水量少，辛辣和甜味浓的为佳。",
      "suitable":"一般人均可食用洋葱，三高人群适宜。",
      "unsuitable":"有皮肤瘙痒、胃病的患者少吃洋葱。 \n1. 洋葱一次不宜食用过多，容易引起目糊和发热。",
      "nickname":"洋葱头、玉葱、葱头、圆葱、球葱、葱头",
      "calorie":"39大卡（100克可食部分）",
      "imagetitle":"lib/assets/images/lunBoTu/yang_cong.jpg"
    }
  ];


  static List set_list1(List imgList){
    _list1 = imgList;
    return _list1;
  }
  static List get_list1(){
    return _list1;
  }
  static List set_list2(List imgList){
    _list2 = imgList;
    return _list2;
  }
  static List get_list2(){
    return _list2;
  }
  static List set_list3(List imgList){
    _list3 = imgList;
    return _list3;
  }
  static List get_list3(){
    return _list3;
  }
  static List set_list4(List imgList){
    _list4 = imgList;
    return _list4;
  }
  static List get_list4(){
    return _list4;
  }
  static List set_list5(List imgList){
    _list5 = imgList;
    return _list5;
  }
  static List get_list5(){
    return _list5;
  }
  static List set_classifylist(List imgList){
    _classifylist = imgList;
    return _classifylist;
  }
  static List get_classifylist(){
    return _classifylist;
  }
  static String set_classify(String string){
    _classify = string;
    return _classify;
  }
  static String get_classify(){
    return _classify;
  }
  static void set_homeHandpickList(List<Map> handpickList){
    homeHandpickList = handpickList;
  }
  static List<Map> get_homeHandpickList(){
    return homeHandpickList;
  }

  static void set_menuCatgegroyLsit(List catgegroyLsit){
    menuCatgegroyLsit = catgegroyLsit;
  }
  static List get_menuCatgegroyLsit(){
    return menuCatgegroyLsit;
  }

  static void set_menuShiCaiBaiKeList(List<Map> shiCaiBaiKeList){
    menuShiCaiBaiKeList = shiCaiBaiKeList;
  }
  static List<Map> get_menuShiCaiBaiKeList(){
    return menuShiCaiBaiKeList;
  }

}