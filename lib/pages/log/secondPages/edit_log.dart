import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/global/toast.dart';
import 'package:ingredients/global/userInfo.dart';
import 'package:ingredients/pages/log/logBean.dart';
import 'package:provide/provide.dart';

import '../../article/DBUtils.dart';

//编辑日志信息
//接收上个页面的参数
class EditLog extends StatefulWidget {
  Map arguments;
  EditLog({Key key, this.arguments}) : super(key: key);

  @override
  _EditLogState createState() => _EditLogState(arguments:this.arguments);
}

class _EditLogState extends State<EditLog> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  FocusNode _titleFocusNode = new FocusNode();
  FocusNode _contentFocusNode = new FocusNode();
  String id;//日志id
  String title;//日志标题
  String content;//日志内容
  String time;  //日志时间

  Map arguments;

  _EditLogState({this.arguments});//可选的命名参数

  getArguments(){
    print("传入的参数:id=${arguments["id"]},title=${arguments["title"]},content=${arguments["content"]},time=${arguments["time"]}");
    id = arguments["id"];
    title = arguments["title"];
    content = arguments["content"];
    time = arguments["time"];
  }

  @override
  void initState() {
    super.initState();
    getArguments();

    String preTitleText = title;//预设输入框的内容
    _titleController = TextEditingController.fromValue(
        TextEditingValue(
          text: preTitleText, //预设输入框内容
          selection : TextSelection.fromPosition(//用来设置文本的位置
              TextPosition(
                  affinity: TextAffinity.downstream,
                  /// 光标向后移动的长度
                  offset: preTitleText.length)
          ),
        )
    );

    String preContentText = content;//预设输入框的内容
    _contentController = TextEditingController.fromValue(
        TextEditingValue(
          text: preContentText, //预设输入框内容
          selection : TextSelection.fromPosition(//用来设置文本的位置
              TextPosition(
                  affinity: TextAffinity.downstream,
                  /// 光标向后移动的长度
                  offset: preContentText.length)
          ),
        )
    );

  }


  @override
  Widget build(BuildContext context) {
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
            "编辑日志",
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
                  if(title != null || content != null){
                    DBUtils.instance().then((value){
                      value.insertBook(game: Book(
                        id: int.parse(id),
                        time: time,
                        title: title,
                        content: content,
                      )).then((value){
                        Navigator.pop(context);//退回到日志展示界面
                      });
                    });
                    // LogBean logBean = new LogBean();//创建一个log对象
                    // Map logInfo = logBean.toMap(id,title,content,time);//id值没变
                    // logBean.editLogById(logInfo);
                    // print("日志信息修改完成，并且已保存！");
                    // Provide.value<UserInfo>(context).getLogList(UserInfo.LogList);//通知
                    //Navigator.pop(context);//退回到日志展示界面
                  }else{
                    ToastM.toast(context, msg: '内容为空!', textSize: Adapt.px(40),);
                  }
                },
              ),
            )
          ],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
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
                              border: InputBorder.none, //去掉边框下划线
                            ),
                            cursorColor: Colors.green, //光标颜色
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              title = value;
                            },
                          ),
                        ),
                        //2.标题与内容的分界线
                        Container(
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(2), color: Colors.grey)),)
                        ),
                        //3.内容
                        Container(
                          margin: EdgeInsets.only(top: Adapt.px(30), left: Adapt.px(10), right: Adapt.px(10)),
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
                          time = formatDate(val, [yyyy, " 年 ", mm, " 月 ", dd, " 日 "]);
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
                                IconNames.calender_office_date_schedule_manage_cfdfcadc,
                                size: Adapt.px(35),
                              ),
                            ),
                          ),
                          Text("当前日期",
                              style: TextStyle(fontSize: Adapt.px(30))),
                          Container(
//                          alignment: Alignment.centerRight,//失效？？？
                            margin: EdgeInsets.only(left: Adapt.px(100)),
                            child: Text(time, style: TextStyle(fontSize: Adapt.px(30))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(height: Adapt.px(5)), //分割线

              ],
            ),
          ),
        )
    );
  }
}

