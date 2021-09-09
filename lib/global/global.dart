
import 'dart:io';

/**
 * 存放全局数据
 */
class global{
  static String _name="洋葱";
  static String _classification="蔬菜,葱蒜类";
  static String _introduction="洋葱为百合科草本植物，二年生或多年生植物，是一种很普通的廉价家常菜。"
      "原产亚洲西部，在我国各地均有栽培，四季都有供应。洋葱供食用的部位为地下的肥大鳞茎(即葱头)。"
      "根据其皮色可分为白皮、黄皮和红皮三种：\n1.白皮种：鳞茎小，外表白色或略带绿色，肉质柔嫩，汁多辣叶淡"
      "，品质佳，适于生食。\n2.黄皮种：鳞茎中等大小，鳞片较薄，外皮黄色，肉钯白里带黄，肉质细嫩柔软，水分较少，"
      "味甜而稍带辣味，品质极佳。\n3.红皮种：鳞茎大，外皮为紫红色或暗粉红色，肉白里带红，组织致密，质地较脆，"
      "肉质不及黄皮种细嫩，水分较多，辣味较重，品质较差，但耐贮藏。\n国人常惧怕其特有的辛辣香气，"
      "而在国外它却被誉为“菜中皇后”，营养价值不低。\n洋葱的品质要求：以葱头肥大，外皮光泽，不烂，"
      "无机械伤和泥土，鲜葱头不带叶；经贮藏后，不松软，不抽苔，鳞片紧密，含水量少，辛辣和甜味浓的为佳。";
  static String _suitable="一般人均可食用洋葱，三高人群适宜。";
  static String _unsuitable="有皮肤瘙痒、胃病的患者少吃洋葱。 \n1. 洋葱一次不宜食用过多，容易引起目糊和发热。";
  static String _nickname="洋葱头、玉葱、葱头、圆葱、球葱、葱头";
  static String _calorie="39大卡（100克可食部分）";
  static String _conflict="";
  static String _mate="";
  static String _choose="";
  static String _storage="";
  static String _benefits="";
  static String _picture_link1="";
  static String _picture_name1="";
  static String _picture_url1="";
  static String _picture_link2="";
  static String _picture_name2="";
  static String _picture_url2="";
  static File _imagetitle= null;
  //打开拍照
  static int _isopenphoto=0;
//邮箱
  static String _email="";
  //验证码
  static String _true="";


  static List _allfoodlist=[];
  static List _searchfoodlist=[];
  static String _allname="茄子";
  static String _username="点击头像登录";



  static String set_true(String i){
    _true=i;
    return _true;
  }
  static String get_true(){
    return _true;
  }
  static String set_email(String i){
    _email=i;
    return _email;
  }
  static String get_email(){
    return _email;
  }
  static String set_username(String i){
    _username=i;
    return _username;
  }
  static String get_username(){
    return _username;
  }
  static String set_allname(String i){
    _allname=i;
    return _allname;
  }
  static String get_allname(){
    return _allname;
  }
  static String set_name(String string){
    _name =string;
    return _name;
  }
  static String get_name(){
    return _name;
  }
  static String set_nickname(String string){
    _nickname =string;
    return _nickname;
  }
  static String get_nickname(){
    return _nickname;
  }
  static String set_introduction(String string){
    _introduction =string;
    return _introduction;
  }
  static String get_introduction(){
    return _introduction;
  }
  static String set_classification(String string){
    _classification =string;
    return _classification;
  }
  static String get_iclassification(){
    return _classification;
  }
  static String set_benefits(String string){
    _benefits =string;
    return _benefits;
  }
  static String get_benefits(){
    return _benefits;
  }
  static String set_suitable(String string){
    _suitable =string;
    return _suitable;
  }
  static String get_suitable(){
    return _suitable;
  }
  static String set_unsuitable(String string){
    _unsuitable =string;
    return _unsuitable;
  }
  static String get_unsuitable(){
    return _unsuitable;
  }
  static String set_calorie(String string){
    _calorie =string;
    return _calorie;
  }
  static String get_calorie(){
    return _calorie;
  }
  static String set_mate(String string){
    _mate =string;
    return _mate;
  }
  static String get_mate(){
    return _mate;
  }
  static String set_conflict(String string){
    _conflict =string;
    return _conflict;
  }
  static String get_conflict(){
    return _conflict;
  }
  static String set_choose(String string){
    _choose =string;
    return _choose;
  }
  static String get_choose(){
    return _choose;
  }
  static String set_storage(String string){
    _storage =string;
    return _storage;
  }
  static String get_storage(){
    return _storage;
  }
  //食谱
  static String set_picture_link1(String string){
    _picture_link1=string;
    return _picture_link1;
  }
  static String get_picture_link1(){
    return _picture_link1;
  }
  static String set_picture_name1(String string){
    _picture_name1=string;
    return _picture_name1;
  }
  static String get_picture_name1(){
    return _picture_name1;
  }
  static String set_picture_url1(String string){
    _picture_url1=string;
    return _picture_url1;
  }
  static String get_picture_url1(){
    return _picture_url1;
  }
  static String set_picture_link2(String string){
    _picture_link2=string;
    return _picture_link2;
  }
  static String get_picture_link2(){
    return _picture_link2;
  }
  static String set_picture_name2(String string){
    _picture_name2=string;
    return _picture_name2;
  }
  static String get_picture_name2(){
    return _picture_name2;
  }
  static String set_picture_url2(String string){
    _picture_url2=string;
    return _picture_url2;
  }
  static String get_picture_url2(){
    return _picture_url2;
  }

  static File set_imagetitle(var string){
    _imagetitle =string;
    return _imagetitle;
  }
  static File get_imagetitle(){
    return _imagetitle;
  }
  static int set_isopenphoto(int int){
    _isopenphoto=int;
    return _isopenphoto;
  }
  static int get_isopenphoto(){
    return _isopenphoto;
  }
  //推荐食材表
  static List set_allfoodlist(List list){
    _allfoodlist=list;
    return _allfoodlist;
  }
  static List get_allfoodlist(){
    return _allfoodlist;
  }
  //搜索食材表
  static List set_searchfoodlist(List list){
    _searchfoodlist=list;
    return _searchfoodlist;
  }
  static List get_searchfoodlist(){
    return _searchfoodlist;
  }
}