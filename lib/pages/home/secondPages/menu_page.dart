import 'package:flutter/material.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/pages/home/homeFoodInfo.dart';
import 'package:ingredients/global/global.dart';

/**
 * 功能模块的菜单页面
 */
class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final double iconSize = Adapt.px(80);
   List _classifylist=homeFoodInfo.get_list1();

   var listName = "水果类";//暂存当前左侧大类名称
   bool isClick = false;//记录左侧大类的点击

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: IconFont(IconNames.fanhui,
              size: WidgetInfo.get_topIconSize(),
              color: WidgetInfo.get_topIconColor()),
          splashColor: Colors.transparent, //取消点击水波纹
          highlightColor: Colors.transparent, //取消点击水波纹
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "食材百科",
          style: TextStyle(
              fontSize: WidgetInfo.get_topFontSize(),
              color: WidgetInfo.get_topFontColor()),
        ),
        //        搜索按钮
        // actions: [
        //   IconButton(
        //     icon: IconFont(IconNames.xingtaidu_icon_sousuo_copy,
        //         size: WidgetInfo.get_topIconSize(),
        //         color: WidgetInfo.get_topIconColor()),
        //     splashColor: Colors.transparent, //取消点击水波纹
        //     highlightColor: Colors.transparent, //取消点击水波纹
        //     onPressed: () {
        //       Navigator.pushNamed(context, "/SearchPage");
        //     },
        //   ),
        // ],
      ),
      body: Container(
        child: Row(
          children: [
            MenuLeft(),
            MenuRightCategory(), //菜单右侧孩子
          ],
        ),
      ), //左侧分类菜单
    );
  }

  MenuLeft() {
    return Container(
      width: Adapt.px(160),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: Adapt.px(2), color: Colors.black12),
        ),
      ),
      child: ListView(
        children: [
          leftdata(),
        ],
      ),
    );
  }

  Widget leftdata() {
    List<Widget> listWidget = homeFoodInfo.get_menuCatgegroyLsit().map((val) {
      isClick=(listName == val["name"]) ? true : false;

      return InkWell(
        onTap: () {
          setState(() {
            if(val['name']=="水果类"){
              listName = "水果类";
              //print(_classifylist);
              _classifylist=homeFoodInfo.get_list1();
            } else if(val['name']=="菌类"){
              listName = "菌类";
              _classifylist=homeFoodInfo.get_list2();
              //print(_classifylist);
            }else if(val['name']=="蔬菜类"){
              listName = "蔬菜类";
              _classifylist=homeFoodInfo.get_list3();
              //print(_classifylist);
            }else if(val['name']=="豆谷类"){
              listName = "豆谷类";
              _classifylist=homeFoodInfo.get_list4();
              //print(_classifylist);
            }else if(val['name']=="其他"){
              listName = "其他";
              _classifylist=homeFoodInfo.get_list5();
              //print(_classifylist);
            }
            print(val['name']);
            //homeFoodInfo.set_classify(val['name']);
            //print(homeFoodInfo.get_classify());
            MenuRightCategory();
          });
        },
        child: Container(
          height: Adapt.px(80),
          width: Adapt.px(160),
          padding: EdgeInsets.only(left: Adapt.px(10), top: Adapt.px(20)),
          decoration: BoxDecoration(
            color: isClick?Color.fromRGBO(236, 236, 236, 0): Colors.white,
            border: Border(
                bottom: BorderSide(width: Adapt.px(2), color: Colors.black12)),
          ),
          child: Text(
            val['name'],
            style: TextStyle(fontSize: Adapt.px(30)),
          ),
        ),
      );
    }).toList();
    return Wrap(
      spacing: 2,
      children: listWidget,
    );
  }

  //菜单右侧孩子
  MenuRightCategory() {
    // 食材展示(流布局)
    Widget _categoryInfo() {
      if (_classifylist
          .length != 0) {
        List<Widget> listWidget =
        _classifylist.map((val) {
          return Container(
            child: InkWell(
              splashColor: Colors.transparent, //取消点击水波纹
              highlightColor: Colors.transparent, //取消点击水波纹
              onTap: () {
                global.set_allname(val['pic']);
                global.set_name(val["name"]);
                global.set_nickname(val['nickname']);
                global.set_calorie(val['calorie']);
                global.set_classification(val['classification']);
                global.set_introduction(val['introduction']);
                global.set_suitable(val['suitable']);
                global.set_conflict(val['conflict']);
                global.set_mate(val['mate']);
                global.set_benefits(val['benefits']);
                global.set_unsuitable(val['unsuitable']);
                global.set_choose(val['choose']);
                global.set_storage(val['storage']);
                global.set_picture_name1(val["recipe"][0]["recipe_name"]);
                global.set_picture_link1(val["recipe"][0]["picture_link"]);
                global.set_picture_url1(val["recipe"][0]["url"]);
                global.set_picture_name2(val["recipe"][1]["recipe_name"]);
                global.set_picture_link2(val["recipe"][1]["picture_link"]);
                global.set_picture_url2(val["recipe"][1]["url"]);
                Navigator.pushNamed(context, "/FoodBaseInfoPage");
              },
              child: Expanded(
                child: Column(
                  children: [
                    new Container(
                      margin: EdgeInsets.all(Adapt.px(15)),
                      width: Adapt.px(100),
                      height: Adapt.px(100),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            val["pic"],
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      child: Text(
                        val["name"],
                        style: TextStyle(fontSize: Adapt.px(30)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList();
        return Wrap(
          spacing: 4,
          children: listWidget,
        );
      }
    }
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width - Adapt.px(160),
      child: ListView(
        children: [
          _categoryInfo(),
        ],
      ),
    );
  }
}

