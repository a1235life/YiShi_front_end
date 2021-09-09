import 'package:flutter/material.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/pages/home/thirdPages/photoresult.dart';
import 'package:ingredients/global/global.dart';
import 'package:url_launcher/url_launcher.dart';


/**
 * 用户拍照识别结果  信息展示页面
 */
class PhotoResultPage extends StatefulWidget {
  PhotoResultPage({Key key}) : super(key: key);

  @override
  _PhotoResultPageState createState() => _PhotoResultPageState();
}

class _PhotoResultPageState extends State<PhotoResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: IconFont(IconNames.fanhui, size: WidgetInfo.get_topIconSize(),color: WidgetInfo.get_topIconColor()),
          splashColor: Colors.transparent, //取消点击水波纹
          highlightColor: Colors.transparent, //取消点击水波纹
          onPressed: () {
            Navigator.pushNamed(context, '/first');
          },
        ),
        title: Text(
          "你感兴趣的食材",
          style: TextStyle(fontSize: WidgetInfo.get_topFontSize(),color:WidgetInfo.get_topFontColor()),
        ),
      ),
      body: Container(
        child: PhotoResult(),
      )
    );
  }

}