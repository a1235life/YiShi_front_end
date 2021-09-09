import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:ingredients/assets/iconfont/IconFont.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/global/global.dart';
import 'package:ingredients/global/toast.dart';
import 'package:http/http.dart' as http;
import 'package:ingredients/global/userInfo.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {
  final double fontSize = Adapt.px(30);
  final double iconSize = Adapt.px(40);
  final double borderWidth = Adapt.px(3);
  
//  看看别人关心的
  List OtherSearch = ["冠心病", "安神", "通便", "防癌", "消化不良"];

  //焦点
  FocusNode _focusNodeSearch = new FocusNode();
  //输入框控制器，此控制器可以监听用户输入框操作
  TextEditingController _searchController = new TextEditingController();
  var _isShowClear = false; //是否显示清楚按钮
  var _inputText = null;

  //清楚历史搜索
  void _historyClear() {
    setState(() {
      //重新渲染数据
      UserInfo.SearchHistory.clear();//全局上清空
    });
  }

  //将输入内容加入历史搜索列表
  void _historyAdd() {
    setState(() {
      if ((_searchController.text == "")) {
        ToastM.toast(context, msg: '内容不能为空!', textSize: 20.0,);
      }else if(UserInfo.SearchHistory.contains(_searchController.text)){
        print("本搜索内容与之前重复，搜索历史List中将不再添加。");
        getdata(); //请求数据
      }else {
        _inputText = _searchController.text; //获取输入内容
        UserInfo.set_SearchHistory(_inputText);
        getdata(); //请求数据
      }
    });
  }

  // 监听焦点
  Future<Null> _focusNodeListener() async {
    if (_focusNodeSearch.hasFocus) {
      _focusNodeSearch.unfocus(); // 取消搜索框的焦点状态
    }
  }

  @override
  void initState() {
    //设置焦点监听
    _focusNodeSearch.addListener(_focusNodeListener);
    //监听搜索框的输入改变
    _searchController.addListener(() {
      //是否显示清除按钮
      if (_searchController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      };
    });

    super.initState();
  }

  @override
  void dispose() {
    // 移除焦点监听
    _focusNodeSearch.removeListener(_focusNodeListener);
    _searchController.dispose();
    super.dispose();
  }

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
        title: Container(
          child: Text(
            "等你来搜索",
            style: TextStyle(fontSize: WidgetInfo.get_topFontSize(),color:WidgetInfo.get_topFontColor()),
          ),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode()); // 触摸收起键盘
        },
        child: Container(
          child: ListView(
            children: [
              _searchBox(),
              _searchHistory(),
              _searchOther(),
            ],
          ),
        ),
      ),
    );
  }

//  搜索框
  Widget _searchBox() {
    return Container(
      height: Adapt.px(80),
      margin: EdgeInsets.all(Adapt.px(5)),
      decoration: new BoxDecoration(
          borderRadius:
          new BorderRadius.all(new Radius.circular(Adapt.px(20))),
          border: new Border.all(
            width: Adapt.px(2),
            color: Theme.of(context).primaryColorLight,
          ),
          color: Colors.white),
      child: Row(
        children: [
          new IconButton(
              splashColor: Colors.transparent, //取消点击水波纹
              highlightColor: Colors.transparent, //取消点击水波纹
              icon: IconFont(
                IconNames.xingtaidu_icon_sousuo_copy,
                size: iconSize,
              )),
          new Container(width: Adapt.px(2), color: Colors.grey,),
          new Expanded(
            child: Container(
              margin: EdgeInsets.only(left: Adapt.px(10)),
              child: TextField(
                controller: _searchController,
                keyboardType: TextInputType.text, //键盘类型
                textInputAction: TextInputAction.done, //键盘右下角的按钮:完成
                cursorColor: Colors.green, //光标颜色
                maxLines: 1, //最多行数
                decoration: new InputDecoration(
                  hintText: "食材名称/功效",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize, fontStyle: FontStyle.italic),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.transparent)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.transparent)),
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  suffixIcon: IconButton(
                    splashColor: Colors.transparent, //取消点击水波纹
                    highlightColor: Colors.transparent, //取消点击水波纹
                    icon: Icon((_isShowClear) ? Icons.cancel : null),
                    onPressed: () {
                      _searchController.clear();
                    },
                  ),
                ),
                style: TextStyle(fontSize: fontSize,textBaseline: TextBaseline.alphabetic),
              ),
            ),
          ),
          new Container(
            height: Adapt.px(70),
            width: Adapt.px(150),
            padding: EdgeInsets.all(0),
            child: FlatButton(
                splashColor: Colors.transparent, //取消点击水波纹
                highlightColor: Colors.transparent, //取消点击水波纹
                child: Text("搜索", style: TextStyle(fontSize: fontSize, color: Colors.white),),
                onPressed: () {
                  _focusNodeSearch.unfocus();
                  setState(() {
                    _historyAdd();//添加历史搜索和请求数据
                  });
                }),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(Adapt.px(20))), color: Colors.green),
          )
        ],
      ),
    );
  }

//历史搜索
  Widget _searchHistory() {
    //  数据
    Widget _data() {
      if (UserInfo.SearchHistory.length != 0) {
        List<Widget> listWidget = UserInfo.SearchHistory.asMap().keys.map((index) {
          return InkWell(
            splashColor: Colors.transparent, //取消点击水波纹
            highlightColor: Colors.transparent, //取消点击水波纹
            onTap: () {
              _inputText = UserInfo.SearchHistory[index];
              getdata();//请求数据
            },
            child: Container(
                child: Chip(
                    label: Text(UserInfo.SearchHistory[index], style: TextStyle(fontSize: fontSize),))
            ),
          );
        }).toList();
        return Wrap(
          alignment: WrapAlignment.start,
          spacing: Adapt.px(5), //主轴空隙间距
          direction: Axis.horizontal,//扩展方式
          children: listWidget,
        );
      } else {
        return Container(
          child: Text(
            "历史搜索为空！",
            style: TextStyle(fontSize: fontSize, color: Colors.grey),
          ),
        );
      }
    }

    //返回组件
    return Container(
      margin: EdgeInsets.only(top: Adapt.px(10)),
      child: Column(
        children: [
          //标题
          new Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                new Container(
                  width: Adapt.px(300),
                  child: Text(
                    "历史搜索",
                    style: TextStyle(fontSize: Adapt.px(50), color: Colors.green, letterSpacing: Adapt.px(10.0), fontWeight: FontWeight.w600),
                  ),
                ),
                new Container(
                    //删除按钮
                    margin: EdgeInsets.only(left: Adapt.px(300)),
                    child: IconButton(
                        splashColor: Colors.transparent, //取消点击水波纹
                        highlightColor: Colors.transparent, //取消点击水波纹
                        icon: IconFont(
                          IconNames.shanchu_2,
                          size: iconSize,
                        ),
                        onPressed: () {_historyClear(); //清空
                        }))
              ],
            ),
            decoration: BoxDecoration(color: Colors.white, border: Border.all(width: borderWidth, color: Colors.white,)),
          ),
          //内容
          new Container(
            margin: EdgeInsets.all(Adapt.px(5)),
            child: Container(
              child: _data(),
            ),
          ),
        ],
      ),
    );
  }

//其他用户的搜索（热搜）
  Widget _searchOther() {
    //  数据
    Widget _data() {
      if (OtherSearch.length != 0) {
        List<Widget> listWidget = OtherSearch.asMap().keys.map((index) {
          return InkWell(
            splashColor: Colors.transparent, //取消点击水波纹
            highlightColor: Colors.transparent, //取消点击水波纹
            onTap: () {
              _inputText = OtherSearch[index];
              getdata();//请求数据
            },
            child: Container(
                child: Chip(label: Text(OtherSearch[index], style: TextStyle(fontSize: fontSize),))
            ),
          );
        }).toList();
        return Wrap(
          spacing: Adapt.px(5),
          children: listWidget,
        );
      } else {
        return Container(
          child: Text("暂无数据！"),
        );
      }
    }

    //返回组件
    return Container(
      margin: EdgeInsets.only(top: Adapt.px(50)),
      child: Column(
        children: [
//          标题
          new Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "看看别人关心的",
              style: TextStyle(
                  fontSize: Adapt.px(50),
                  color: Colors.green,
                  letterSpacing: Adapt.px(10.0),
                  fontWeight: FontWeight.w600),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: borderWidth,
                  color: Colors.white,
                )),
//                color: Colors.white,
          ),
//          内容
          new Container(
//            margin: EdgeInsets.all(Adapt.px(5)),
            child: Container(
              child: _data(),
            ),
          ),
        ],
      ),
    );
  }

  Future getdata() async{
  var url='http://47.98.201.222:8181/food/search/'+_inputText;
  http.get(url).then((response){
    var jsonData =json.decode(response.body);
    List list=jsonData["result"];
    global.set_searchfoodlist(list);
    Navigator.pushNamed(context, "/SearchResultPage");
  });
  }

}
