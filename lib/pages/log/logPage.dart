import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/global/userInfo.dart';
import 'package:ingredients/pages/log/logBean.dart';
import 'package:ingredients/pages/log/secondPages/edit_log.dart';
import 'package:provide/provide.dart';

import '../article/DBUtils.dart';

/**
 * 日志展示页面
 * 日志 ： 标题 、 内容 、时间
 */
class LogPage extends StatefulWidget {
  LogPage({Key key}) : super(key: key);

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  LogBean logBean = new LogBean();

  List<Book> books = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLog();
  }

  void getLog(){
    DBUtils.instance().then((value){
      value.getAllBooks().then((value){
        books.clear();
        books.addAll(value);
        setState(() {

        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //去掉leading位置的返回箭头
        title: Text("健康小天地",
            style: TextStyle(
                fontSize: WidgetInfo.get_topFontSize(),
                color: WidgetInfo.get_topFontColor())),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, //屏幕高度
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: Adapt.px(1)),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    prefixIcon: Icon(Icons.search),
                    hintText: '搜索笔记',
                    contentPadding: EdgeInsets.zero
                ),
                onChanged: (data){
                  if(data.isEmpty){
                    getLog();
                  }else{
                    DBUtils.instance().then((value){
                      value.queryTitle(title: data).then((value){
                        books.clear();
                        books.addAll(value);
                        setState(() {

                        });
                      });
                    });
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Adapt.px(1)),
            ),
            Positioned(
              top: Adapt.px(130),
              child: SingleChildScrollView(
                child: _LogCardWidget(context),
              ),
              bottom: 0,
              right: 0,
              left: 0,
            ),
            Positioned(
              bottom: Adapt.px(10),
              right: Adapt.px(10),
              child: _LogAddButton(context),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(Map val){//删除提示框
    return  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          content: Text("确定要删除此记录吗？"),
          actions: <Widget>[
            new FlatButton(
              child: new Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('确定'),
              onPressed: () {//删除
                DBUtils.instance().then((value){
                  value.deleteBook(fileId: val['id']).then((value){
                    Navigator.pop(context);//退回到日志展示界面
                  });
                });
              },
            ),
          ],
        );
      },
    ).then((value){
      getLog();
    });
  }

  //日志卡片
  Widget _LogCardWidget(BuildContext context) {

    List<Widget> listWidget = books.map((book) {
      var val = book.toJson();
      return GestureDetector(
        onLongPress: (){//长按 删除
          _showDialog(val);//删除提示框
        },
        onTap: () {
          Navigator.pushNamed(context,"/EditLog",arguments: {
            "id": val["id"].toString(),
            "title": val["title"],
            "content": val["content"],
            "time": val["time"],
          }
          ).then((value){
            getLog();
          });
          print("点击了${val["id"]}卡片");
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          elevation: Adapt.px(10), //阴影
          margin: EdgeInsets.all(20),
          semanticContainer: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Adapt.px(15))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //1.标题 、 日志内容
              ListTile(
                title: Text(
                  val["title"],
                  style: TextStyle(
                      fontSize: Adapt.px(35), fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  val["content"],
                  maxLines: 2, //最大行数
                ),
              ),
              //2.时间
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(
                    right: Adapt.px(20), bottom: Adapt.px(20)),
                child: Text(val["time"],
                    style: TextStyle(fontSize: Adapt.px(25))),
              ),
            ],
          ),
        ),
      );
    }).toList();
    return Wrap(
      spacing: 1,
      children: listWidget,
    );
  }

  //日志添加按钮
  Widget _LogAddButton(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(bottom: Adapt.px(30), right: Adapt.px(30)),
      child: InkWell(
        splashColor: Colors.transparent, //取消点击水波纹
        highlightColor: Colors.transparent, //取消点击水波纹
        child: IconFont(
          IconNames.tianjia,
          size: Adapt.px(100),
        ),
        onTap: () {
          print("点击了添加日志按钮");
          Navigator.pushNamed(context, "/AddNewLog").then((value){
            getLog();
          }); //跳转到 添加新日志
        },
      ),
    );
  }
}


