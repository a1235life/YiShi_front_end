import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/WidgetInfo.dart';

class MorePage extends StatefulWidget {
  MorePage({Key key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final double iconSize = Adapt.px(90);
  final double fontSize = Adapt.px(25);
  final double boderWith = Adapt.px(3);
  final double mBottom = Adapt.px(10);//字体距离底部的距离

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
          "更多功能等你来",
          style: TextStyle(fontSize: WidgetInfo.get_topFontSize(),color:WidgetInfo.get_topFontColor()),
        ),
      ),
      body: ListView(
        children: [
          _firstRow(),
        ],
      ),
    );
  }

//  功能模块，第一行3个
Widget _firstRow(){
    return Container(
      margin: EdgeInsets.all(Adapt.px(20)),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize:MainAxisSize.max,
          children: [
            Card(
              //设置圆角
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(Adapt.px(16)))
              ),
              elevation: Adapt.px(10),//阴影高度
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/MenuPage");
                },
                child: Container(
                  width: Adapt.px(180),
                  height: Adapt.px(180),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            height: Adapt.px(100),
                            width: Adapt.px(100),
                            child: IconButton(
                              icon: IconFont(
                                IconNames.shicaibaike,
                                size: iconSize,
                              ),
                              splashColor: Colors.transparent, //取消点击水波纹
                              highlightColor: Colors.transparent, //取消点击水波纹
                              onPressed: () {
                                Navigator.pushNamed(context, "/MenuPage");
                              },
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        new Container(
                          margin: EdgeInsets.only(bottom: mBottom),
                          child: Text(
                            "食材百科",
                            style:
                            TextStyle(color: Colors.green, fontSize: fontSize),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            ),
            Card(
              //设置圆角
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(Adapt.px(16)))
              ),
              elevation: Adapt.px(10),//阴影高度
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/MenuPage");
                },
                child: Container(
                  width: Adapt.px(180),
                  height: Adapt.px(180),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          height: Adapt.px(100),
                          width: Adapt.px(100),
                          child: IconButton(
                            icon: IconFont(
                              IconNames.jinzhi_1,
                              size: iconSize,
                            ),
                            splashColor: Colors.transparent, //取消点击水波纹
                            highlightColor: Colors.transparent, //取消点击水波纹
                            onPressed: () {
                              Navigator.pushNamed(context, "/MenuPage");
                            },
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(bottom: mBottom),
                        child: Text(
                          "相克搭配",
                          style:
                          TextStyle(color: Colors.green, fontSize: fontSize),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              //设置圆角
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(Adapt.px(16)))
              ),
              elevation: Adapt.px(10),//阴影高度
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/MenuPage");
                },
                child: Container(
                  width: Adapt.px(180),
                  height: Adapt.px(180),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          height: Adapt.px(100),
                          width: Adapt.px(100),
                          child: IconButton(
                            icon: IconFont(
                              IconNames.chucunguan,
                              size: iconSize,
                            ),
                            splashColor: Colors.transparent, //取消点击水波纹
                            highlightColor: Colors.transparent, //取消点击水波纹
                            onPressed: () {
                              Navigator.pushNamed(context, "/MenuPage");
                            },
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.only(bottom: mBottom),
                        child: Text(
                          "挑选存储",
                          style:
                          TextStyle(color: Colors.green, fontSize: fontSize),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
}

}
