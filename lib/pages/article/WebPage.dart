import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ingredients/pages/article/Http.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ingredients/global/global.dart';

import 'DBUtils.dart';
import 'file_entity.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DBUtils.dart';
import 'WebPage.dart';
import 'file_entity.dart';

import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';

class WebPage extends StatefulWidget {
  final Result url;

  const WebPage({Key key, this.url}) : super(key: key);
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  bool isCollection = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    DBUtils.instance().then((value){
      value.queryIsCollection(fileId: widget.url.id).then((value){
        setState(() {
          isCollection = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : false,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: IconFont(IconNames.fanhui, size: WidgetInfo.get_topIconSize(),color: WidgetInfo.get_topIconColor()),
          splashColor: Colors.transparent, //取消点击水波纹
          highlightColor: Colors.transparent, //取消点击水波纹
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("文章详情"),//界面一样
        centerTitle: true,
        actions: [
          isCollection==null?null:IconButton(icon: Icon(isCollection?Icons.grade:Icons.grade_outlined), onPressed: () {
            print('收藏');
            DBUtils.instance().then((value){
              if(isCollection){
                value.delete(fileId:widget.url.id).then((value){
                  if(value!=-1){
                    isCollection =!isCollection;
                  }
                  setState(() {

                  });
                });
              }else{
                value.insert(game:widget.url).then((value){
                  if(value!=-1){
                    isCollection =!isCollection;
                  }
                  setState(() {

                  });
                });
              }

              Http.instance.collection({
                "user_id": 'String get_userid()',//用户名
                "article_id": widget.url.id.toString()

              }
                  ,onSuccessful: (data){
                print(data);
                Fluttertoast.showToast(
                    msg: '$data',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    backgroundColor: Colors.black87,
                );
              },onError: (){

              });
            });
          }),
        ],
      ),

      body: WebView(
        initialUrl: widget.url.location,  //需要打开的url
      ),
    );
  }
}
