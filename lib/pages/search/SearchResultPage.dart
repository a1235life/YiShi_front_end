import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/global/global.dart';
import 'package:ingredients/global/Adapt.dart';//适配器

//搜索结果
class SearchResultPage extends StatefulWidget {
  SearchResultPage({Key key}) : super(key: key);
  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: IconFont(IconNames.fanhui, size: WidgetInfo.get_topIconSize(), color: WidgetInfo.get_topIconColor()),
          splashColor: Colors.transparent, //取消点击水波纹
          highlightColor: Colors.transparent, //取消点击水波纹
          onPressed: () {
              Navigator.pushNamed(context, '/first');//返回到首页
          },
        ),
        title: Text("搜索推荐",style: TextStyle(fontSize: WidgetInfo.get_topFontSize(),color:WidgetInfo.get_topFontColor())),
      ),
      body:ListView(
        children: [
          Column(
            children:[
              _searchfood(),
            ],
          ),
        ],
      ) ,
    );
  }


Widget _searchfood() {
  return Container(
    child: Column(
      children:[
        _searchfoodtitle(),
        _searchfoodresult(),
      ],
    ),
  );
}

Widget _searchfoodtitle() {
  return Container(
    width: Adapt.px(750),
    height: Adapt.px(70),
    child: Text("相关食材",style: TextStyle(fontSize: Adapt.px(40),color: Colors.green,letterSpacing: Adapt.px(10.0),fontWeight: FontWeight.w600),),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.white,
          width: Adapt.px(4),
        ),
      ),
    ),
  );
}
Widget _searchfoodresult(){
        return Container(
          padding: EdgeInsets.all(Adapt.px(9)),
          child: Column(
            children: [
              _wrapList(),
            ],
          ),
        );
      // );
}
Widget _wrapList() {
  if (global
      .get_searchfoodlist()
      .length != 0) {
    List<Widget> listWidget = global.get_searchfoodlist().map((val) {
      return GestureDetector(
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
        child: Container(
          margin: EdgeInsets.only(top: Adapt.px(30), bottom: Adapt.px(20)),
          child: Column(
            children: [
              new Container(
                margin: EdgeInsets.only(bottom: Adapt.px(20)),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          Adapt.px(300)))),
                  elevation: Adapt.px(10), //阴影高度
                  child: Container(
                    width: Adapt.px(120),
                    height: Adapt.px(120),
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
                ),
              ),
              Text(
                val["name"],
                style: TextStyle(fontSize: Adapt.px(30)),
              ),
            ],
          ),
        ),
      );
    }).toList();
    return Wrap(
      spacing: 2,
      children: listWidget,
    );
  } else {
    return Text("暂无食材!");
  }
}
}
