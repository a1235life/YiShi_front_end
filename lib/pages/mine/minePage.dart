import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ingredients/Global/Adapt.dart';
import 'package:ingredients/global/global.dart';
import 'package:ingredients/global/login/globalmydata.dart';
import 'package:ingredients/pages/article/CollectionPage.dart';
import 'package:ingredients/pages/login/loginPage.dart';
import 'package:ingredients/global/WidgetInfo.dart';

import 'myDataPage.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : false,//去掉leading位置的返回箭头
        title: Text("我的",
            style:
                TextStyle(fontSize: WidgetInfo.get_topFontSize(),color:WidgetInfo.get_topFontColor())),
      ),
      body:  Container(
        child:Container(
          child: ListView(
            children: <Widget>[
              //个人
              new Container(
                      padding: EdgeInsets.only(
                          top: 29,
                          left: 20,
                          right: 0,
                          bottom: 25),
                      color: Colors.white,
                      child: Container(
                        child:GestureDetector(
                          onTap: (){
                            if(globalmydata.get_username()=="点击登录"){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => new RootPage()));
                            } else{Navigator.push(context,
                                MaterialPageRoute(builder: (context) => new MyDataPage()));}
                          },

                          child: Row(
                            children: <Widget>[
                              // 头像
                              Container(
                                  width: 70,
                                  height: 70,
                                  // 圆角 (需要宽高)
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0), // 设置圆角
                                      image: DecorationImage(  // 这是图片，fill填充
                                          image: AssetImage("lib/assets/images/login/touxiang.jpg"),
                                          fit: BoxFit.fill))),
                              Container(
                                margin:
                                EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 15),
                                width: MediaQuery.of(context).size.width - 115,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        globalmydata.get_username(),
                                        style: TextStyle(fontSize: 25, color: Colors.black),
                                      ),
                                    ),
                                    Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              globalmydata.get_userid(),
                                              style: TextStyle(fontSize: 17, color: Colors.grey),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: Adapt.px(40),
                                              color: Colors.black,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              SizedBox(
                height: 40,
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Colors.white)),
                ),
                child: ListTile(
                  title: Text(
                    '收藏',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new CollectionPage()));
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Colors.white)),
                ),
                child: ListTile(
                  title: Text(
                    '分享',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Colors.black,
                  ),
                  onTap: () {

                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Colors.white)),
                ),
                child: ListTile(
                  title: Text(
                    '相册',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Colors.black,
                  ),
                  onTap: () {
                    ImagePicker.pickImage(source: ImageSource.gallery);
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Colors.white)),
                ),
                child: ListTile(
                  title: Text(
                    '更多',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Colors.black,
                  ),
                  onTap: () {

                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Colors.white)),
                ),
                child: ListTile(
                  title: Text(
                    '关于我们',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Colors.black,
                  ),
                  onTap: () {

                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Colors.white)),
                ),
                child: ListTile(
                  title: Text(
                    '设置',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Adapt.px(28)),
                  ),
                  //   leading: Icon(Icons.build),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: Adapt.px(30),
                    color: Colors.black,
                  ),
                  onTap: () {

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

