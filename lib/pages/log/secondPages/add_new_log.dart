import 'dart:async';
import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/global/toast.dart';
import 'package:ingredients/global/userInfo.dart';
import 'package:ingredients/pages/log/logBean.dart';
import 'package:provide/provide.dart';

import '../../article/DBUtils.dart';
import '../../article/DBUtils.dart';
import '../../article/DBUtils.dart';

/**
 * 日志展示页面 ---> 添加新日志
 * 类似于记事本模式的文字和图片穿插的文本未实现？？？
 */
class AddNewLog extends StatefulWidget {

  AddNewLog({Key key}) : super(key: key);

  @override
  _AddNewLogState createState() => _AddNewLogState();
}

class _AddNewLogState extends State<AddNewLog> {
  String nowDate; //日期  年月日
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  FocusNode _titleFocusNode = new FocusNode();
  FocusNode _contentFocusNode = new FocusNode();
  String id;//日志id
  String title;//日志标题
  String content;//日志内容
  String time;  //日志时间

  LogBean logBean = new LogBean();//创建一个log对象

//  Database database;
//
//  Future<void> initDataBase() async { //初始化数据库
//    database = await openDatabase(join(await getDatabasesPath(), 'log.db'),//打开数据库
//      onCreate: (db, version){//创建数据库
//        return db.execute("CREATE TABLE log(_id TEXT PRIMARY KEY, title TEXT, content TEXT,time TEXT)");
//      },
//      version: 1,
//      onUpgrade: (db, oldVersion, newVersion) {
//        print("old:$oldVersion,new:$newVersion");
//      },
//    );
//    print("database:$database");
//  }
//
//
//  Future<void> insertLog(Log log) async{//插入
//    Database db = await database;
//    await db.insert(
//      "log",
//      log.toMap(),
//      conflictAlgorithm: ConflictAlgorithm.replace,
//    );
//  }
//
//  //查询
//  Future<List<Log>> log asyns{
//    Database db = await database;
//    List<Map<String, dynamic>> maps = await db.query('log');//查询表中所有日志信息
//    return List.generate(maps.length,(i))
//  }

  //获取当前的 年月日 , 并且格式化
  getDate() {
    DateTime dateTime = DateTime.now();
    nowDate = formatDate(dateTime, [yyyy, " 年 ", mm, " 月 ", dd, " 日 "]);
    time = nowDate;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
    _titleFocusNode.addListener(_focusNodeListener); //设置焦点监听
    _contentFocusNode.addListener(_focusNodeListener); //设置焦点监听
  }

  @override
  void dispose() {//移除焦点监听
    super.dispose();
    _titleFocusNode.removeListener(_focusNodeListener);
    _contentFocusNode.removeListener(_focusNodeListener);
  }

  //监听焦点
  Future<Null> _focusNodeListener() async {
    if (_titleFocusNode.hasFocus) {
      print("日志标题获取焦点");
      setState(() {
        //取消日志内容的焦点
        _contentFocusNode.unfocus();
      });
    }
    if (_contentFocusNode.hasFocus) {
      print("日志内容获取焦点");
      setState(() {
        //取消日志标题的焦点
        _titleFocusNode.unfocus();
      });
    }
  }

//  PickImage _pickImage;//选取图片
//  ImgResource imgResource = new ImgResource();
//  File imgPath;//获取到的图片路径
//  final StreamController<File> _imgStreamController = StreamController<File>();//局部更新时使用
//
//  @override
//  void dispose(){
//    //关流，不关流会消耗资源，同时会引起内存泄漏
//    _imgStreamController.close();
//    super.dispose();
//  }

  //插入图片
//  Widget _insertImg(){
//    if(imgPath != null){
//      return Container(//使用StreamBuilder构造器
//        child: StreamBuilder<File>(// 监听Stream，每次值改变的时候，更新Text中的内容
//          stream: _imgStreamController.stream,
//          builder: (BuildContext context,AsyncSnapshot<File> snapshot){
//            return Container(
//              child: Image.file(imgPath, scale: 0.5, fit: BoxFit.fill),
//            );
//          },
//        ),
//      );
//    }else{
//      return Container(
//        child: Text(""),
//      );
//    }
//  }

  @override
  Widget build(BuildContext context) {
//    _pickImage = new PickImage(context);//创建类对象

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            //标题栏返回按钮
            splashColor: Colors.transparent, //取消点击水波纹
            highlightColor: Colors.transparent, //取消点击水波纹
            icon: IconFont(IconNames.fanhui,
                size: WidgetInfo.get_topIconSize(),
                color: WidgetInfo.get_topIconColor()),
            onPressed: () {
              Navigator.pop(context); //返回日志展示页面
            },
          ),
          title: Text(
            "添加日志",
            style: TextStyle(
                fontSize: WidgetInfo.get_topFontSize(),
                color: WidgetInfo.get_topFontColor()),
          ),
          actions: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: Adapt.px(10)),
              child:  InkWell(//保存按钮
                splashColor: Colors.black12,
                child: Text("保存",style: TextStyle(fontSize: WidgetInfo.get_topFontSize(),color: WidgetInfo.get_topFontColor())),
                onTap: (){
                  if (nowDate != null) {
                    time = nowDate;
                  }

                  if(title != null && content != null){
                    DBUtils.instance().then((value){
                      value.insertBook(game: Book(
                        time: time,
                        title: title,
                        content: content,
                      )).then((value){
                        Navigator.pop(context);//退回到日志展示界面
                      });
                    });
                  }else{
                    ToastM.toast(context, msg: '请添加日志内容', textSize: Adapt.px(40),);
                  }
                },
              ),
            )
          ],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            print("点击了空白区域");
            FocusScope.of(context).requestFocus(FocusNode()); // 触摸收起键盘
          },
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //1.顶部标题
                        Container(
                          margin: EdgeInsets.only(
                              left: Adapt.px(10), right: Adapt.px(10)),
                          child: TextField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              hintText: "请输入标题",
                              hintStyle: TextStyle(fontSize: Adapt.px(30)),
                              border: InputBorder.none, //去掉边框下划线
                            ),
                            cursorColor: Colors.green, //光标颜色
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              //输入框值改变时调用
                              title = value;
//                              print("输入的日志标题是:" + title);
                            },
                          ),
                        ),
                        //2.标题与内容的分界线
                        Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: Adapt.px(2), color: Colors.grey)),
                            )),
                        //3.内容
                        Container(
                          margin: EdgeInsets.only(
                              top: Adapt.px(30),
                              left: Adapt.px(10),
                              right: Adapt.px(10)),
                          child: TextField(
                            controller: _contentController,
                            decoration: InputDecoration(
                              border: InputBorder.none, //去掉边框下划线
                            ),
                            maxLines: 20,
                            cursorColor: Colors.green, //光标颜色
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              content = value;
//                              print("输入的日志内容是：" + content);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(height: Adapt.px(5)), //分割线
                //4.底部功能模块
                Container(
                  child: GestureDetector(
                    onTap: () async {
                      print("点击了日历");
                      await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now()
                              .subtract(new Duration(days: 30)),
                          lastDate:
                          DateTime.now().add(new Duration(days: 30)))
                          .then((DateTime val) {
                        setState(() {
                          nowDate = formatDate(val, [yyyy, " 年 ", mm, " 月 ", dd, " 日 "]);
                          time = nowDate;
                        });
                      });
                    },
                    behavior: HitTestBehavior.opaque, //解决空白区域点击无效问题
                    child: Container(
                      //日期
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(Adapt.px(20)),
                            child: InkWell(
                              child: IconFont(
                                IconNames
                                    .calender_office_date_schedule_manage_cfdfcadc,
                                size: Adapt.px(35),
                              ),
                            ),
                          ),
                          Text("当前日期",
                              style: TextStyle(fontSize: Adapt.px(30))),
                          Container(
//                          alignment: Alignment.centerRight,//失效？？？
                            margin: EdgeInsets.only(left: Adapt.px(100)),
                            child: Text(nowDate, style: TextStyle(fontSize: Adapt.px(30))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(height: Adapt.px(5)), //分割线
//                GestureDetector(
//                  onTap: (){
//                    print("点击了插入图片");
//                    _pickImage.showBottomDialog(context);
//                  },
//                  behavior: HitTestBehavior.opaque,//解决空白区域点击无效问题
//                  child: Container(//图片
//                    child: Row(
//                      children: [
//                        Container(
//                          margin: EdgeInsets.all(Adapt.px(20)),
//                          child: InkWell(
//                            child: IconFont(IconNames.tupian, size: Adapt.px(35),),
//                          ),
//                        ),
//                        Text("插入图片", style: TextStyle(fontSize: Adapt.px(30))),
//                      ],
//                    ),
//                  ),
//                ),
              ],
            ),
          ),
        ));
  }

}

//      if (imgPath != null) {
//        return Container(
//          child: Image.file(imgPath, scale: 0.5, fit: BoxFit.fill),
//        );
//      }else{
//        return Container(
//          child: Text("暂未插入图片",style: TextStyle(fontSize: Adapt.px(30),color: Colors.grey),),
//        );
//      }
