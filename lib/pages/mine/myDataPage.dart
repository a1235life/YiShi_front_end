import 'package:flutter/material.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/global/login/globalmydata.dart';
import 'package:ingredients/pages/article/CollectionPage.dart';

import 'bindemail.dart';

class MyDataPage extends StatefulWidget{
  MyDataPage({Key key}) :super(key:key);
  @override
  _MyDataPageState createState() => _MyDataPageState();
}
class _MyDataPageState extends State<MyDataPage>{
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
          "个人信息",
          style: TextStyle(fontSize: WidgetInfo.get_topFontSize(),color:WidgetInfo.get_topFontColor()),
        ),
      ),
      body: Container(
        child: Container(
          child: ListView(
            children:<Widget> [
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Colors.white)),
                ),
                child:ListTile(
                  title:  Row(
                    children: [
                      Container(
                        child:  Text(
                          "头像"
                        ),
                      ),
                      Spacer(),
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
                        child:  Icon(
                          Icons.arrow_forward_ios,
                          size: Adapt.px(40),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onTap: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => new CollectionPage()));
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //昵称
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Colors.white)),
                ),
                child:ListTile(
                  title:  Row(
                    children: [
                      Container(
                        child:  Text(
                            "昵称"
                        ),
                      ),
                      Spacer(),
                      Container(
                        child:  Text(
                          globalmydata.get_username(),
                        ),
                      ),
                      Container(
                        child:  Icon(
                          Icons.arrow_forward_ios,
                          size: Adapt.px(40),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onTap: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => new CollectionPage()));
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //账号
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Colors.white)),
                ),
                child:ListTile(
                  title:  Row(
                    children: [
                      Container(
                        child:  Text(
                            "账号"
                        ),
                      ),
                      Spacer(),
                      Container(
                        child:  Text(
                            globalmydata.get_userid(),
                        ),
                      ),
                      Container(
                        child:  Icon(
                          Icons.arrow_forward_ios,
                          size: Adapt.px(40),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onTap: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => new CollectionPage()));
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //昵称
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: Adapt.px(1),
                          color: Colors.white)),
                ),
                child:ListTile(
                  title:  Row(
                    children: [
                      Container(
                        child:  Text(
                            "邮箱"
                        ),
                      ),
                      Spacer(),
                      Container(
                        child:  Text(
                            globalmydata.get_useremail()
                        ),
                      ),
                      Container(
                        child:  Icon(
                          Icons.arrow_forward_ios,
                          size: Adapt.px(40),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new BindEmailPage()));
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