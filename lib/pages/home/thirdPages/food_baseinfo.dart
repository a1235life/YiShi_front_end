import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/pages/home/thirdPages/foodbaseinfo_widgets.dart';
import 'package:ingredients/global/WidgetInfo.dart';


/**
 * 食材百科  信息展示页面
 */
class FoodBaseInfoPage extends StatefulWidget {
  FoodBaseInfoPage({Key key}) : super(key: key);

  @override
  _FoodBaseInfoPageState createState() => _FoodBaseInfoPageState();
}

class _FoodBaseInfoPageState extends State<FoodBaseInfoPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: IconFont(IconNames.fanhui, size: WidgetInfo.get_topIconSize(),color: WidgetInfo.get_topIconColor()),
          splashColor: Colors.transparent, //取消点击水波纹
          highlightColor: Colors.transparent, //取消点击水波纹
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "食材百科",
          style: TextStyle(fontSize: WidgetInfo.get_topFontSize(),color:WidgetInfo.get_topFontColor()),
        ),
      ),
      body: Container(
        child: FoodBaseInfoWidgets(),//组合组件
      ),
      );
  }
}
