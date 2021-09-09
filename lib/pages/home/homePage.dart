import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ingredients/global/WidgetInfo.dart';
import 'package:ingredients/global/global.dart';
import 'package:ingredients/pages/home/homeFoodInfo.dart';
import 'package:flutter_swiper/flutter_swiper.dart';//图片轮播
import 'package:ingredients/global/Adapt.dart';//适配器
import 'package:ingredients/assets/iconfont/IconFont.dart';//阿里云图标

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //首页轮播图
  final double imgHeight = Adapt.px(320);
  //首页功能模块区
  final double mHeight = Adapt.px(150);
  final double mBottom = Adapt.px(10);//字体距离底部的距离
  final double mFontSize = Adapt.px(25);//字体大小
  final Color mFontColor = Colors.green;//字体颜色
  final double mIconSize = Adapt.px(120);//图标大小


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : false,//去掉leading位置的返回箭头
        title: Text("健康生活每一天",style: TextStyle(fontSize: WidgetInfo.get_topFontSize(),color:WidgetInfo.get_topFontColor())),
//        搜索按钮
        actions: [
          IconButton(
            icon: IconFont(IconNames.xingtaidu_icon_sousuo_copy,size: WidgetInfo.get_topIconSize(),color: WidgetInfo.get_topIconColor()),
            splashColor: Colors.transparent,//取消点击水波纹
            highlightColor: Colors.transparent,//取消点击水波纹
            onPressed: (){
              Navigator.pushNamed(context, "/SearchPage");
            },
          ),
        ],
      ),
      body:ListView(
        children: [
          Column(
            children: [
//          首页轮播图
              new Container(
                width: MediaQuery.of(context).size.width,
                height: imgHeight,
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Swiper(
                    key: UniqueKey(),
                    itemCount:  global.get_allfoodlist().length,
                    itemBuilder: (BuildContext context,int index){
                      return InkWell(
                        onTap: (){
                          print("已经点击了");
                          global.set_allname(global.get_allfoodlist()[index]['pic']);
                          global.set_name(global.get_allfoodlist()[index]["name"]);
                          global.set_nickname(global.get_allfoodlist()[index]['nickname']);
                          global.set_calorie(global.get_allfoodlist()[index]['calorie']);
                          global.set_classification(global.get_allfoodlist()[index]['classification']);
                          global.set_introduction(global.get_allfoodlist()[index]['introduction']);
                          global.set_suitable(global.get_allfoodlist()[index]['suitable']);
                          global.set_unsuitable(global.get_allfoodlist()[index]['unsuitable']);
                          global.set_picture_name1(global.get_allfoodlist()[index]["recipe"][0]["recipe_name"]);
                          global.set_picture_link1(global.get_allfoodlist()[index]["recipe"][0]["picture_link"]);
                          global.set_picture_url1(global.get_allfoodlist()[index]["recipe"][0]["url"]);
                          global.set_picture_name2(global.get_allfoodlist()[index]["recipe"][1]["recipe_name"]);
                          global.set_picture_link2(global.get_allfoodlist()[index]["recipe"][1]["picture_link"]);
                          global.set_picture_url2(global.get_allfoodlist()[index]["recipe"][1]["url"]);
                          Navigator.pushNamed(context, "/FoodBaseInfoPage");
                        },
                        child: Image.network( global.get_allfoodlist()[index]['pic'],fit: BoxFit.fill),
                      );
                    },
                    pagination: new SwiperPagination(//分页器
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.grey,
                          activeColor: Colors.green,)),
                    loop: true,   //无限循环
                    autoplay: true, //图片自动轮播
                    control: new SwiperControl(),   //设置：左右的箭头
                  ),
                ),
              ),
//      首页功能模块区
              new Container(
                padding: EdgeInsets.all(0),
                height: mHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize:MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/MenuPage");
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: new Container(
//                                  height: Adapt.px(90),
//                                  width: Adapt.px(90),
                                  child: IconButton(
                                    icon: IconFont(IconNames.shicaibaike,size: mIconSize),
                                    splashColor: Colors.transparent,//取消点击水波纹
                                    highlightColor: Colors.transparent,//取消点击水波纹
                                    onPressed: (){
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
                                child: Text("食材百科",style: TextStyle(color: mFontColor,fontSize: mFontSize),),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/MatchMenuPage");
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: new Container(
                                  height: Adapt.px(90),
                                  width: Adapt.px(90),
                                  child: IconButton(
                                    icon: IconFont(IconNames.jinzhi_1,size: mIconSize),
                                    splashColor: Colors.transparent,//取消点击水波纹
                                    highlightColor: Colors.transparent,//取消点击水波纹
                                    onPressed: (){
                                      Navigator.pushNamed(context, "/MatchMenuPage");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              new Container(
                                margin: EdgeInsets.only(bottom: mBottom),
                                child: Text("相克搭配",style: TextStyle(color: mFontColor,fontSize: mFontSize),),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/ChooseMenuPage");
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: new Container(
                                  height: Adapt.px(90),
                                  width: Adapt.px(90),
                                  child: IconButton(
                                    icon: IconFont(IconNames.chucunguan,size: mIconSize),
                                    splashColor: Colors.transparent,//取消点击水波纹
                                    highlightColor: Colors.transparent,//取消点击水波纹
                                    onPressed: (){
                                      Navigator.pushNamed(context, "/ChooseMenuPage");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                             new Container(
                               margin: EdgeInsets.only(bottom: mBottom),
                               child: Text("挑选存储",style: TextStyle(color: mFontColor,fontSize: mFontSize),),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/MenuPage");
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: new Container(
                                  height: Adapt.px(90),
                                  width: Adapt.px(90),
                                  child: IconButton(
                                    icon: IconFont(IconNames.gengduo_1,size: mIconSize),
                                    splashColor: Colors.transparent,//取消点击水波纹
                                    highlightColor: Colors.transparent,//取消点击水波纹
                                    onPressed: (){
                                      Navigator.pushNamed(context, "/MorePage");
                                    },
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                             new Container(
                               margin: EdgeInsets.only(bottom: mBottom),
                               child: Text("更多",style: TextStyle(color: mFontColor,fontSize: mFontSize),),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).accentColor,width: Adapt.px(3),
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
//          精选食材
              _handPick(),
            ],
          ),
        ],
      ),
    );
  }

  //  精选食材，标题
  Widget _handPickTitle = Container(
    width: Adapt.px(750),
    height: Adapt.px(70),
    child: Text("精选食材",style: TextStyle(fontSize: Adapt.px(40),color: Colors.green,letterSpacing: Adapt.px(10.0),fontWeight: FontWeight.w600),),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.white,
          width: Adapt.px(4),
        ),
      ),
    ),
  );

//  精选食材,采用流布局
                                         //期待效果：左右卡片参差不齐摆放  【待实现】
  Widget _wrapList(){
    if(global.get_allfoodlist().length!=0){
      List<Widget> listWidget = global.get_allfoodlist().map((val){
        return GestureDetector(
          onTap: (){
            global.set_allname(val['pic']);
            global.set_name(val["name"]);
            global.set_nickname(val['nickname']);
            global.set_calorie(val['calorie']);
            global.set_classification(val['classification']);
            global.set_introduction(val['introduction']);
            global.set_suitable(val['suitable']);
            global.set_conflict(val['conflict']);
            global.set_mate(val['mate']);
            global.set_benefits(val['benefits']);
            global.set_unsuitable(val['unsuitable']);
            global.set_choose(val['choose']);
            global.set_storage(val['storage']);
            global.set_picture_name1(val["recipe"][0]["recipe_name"]);
            global.set_picture_link1(val["recipe"][0]["picture_link"]);
            global.set_picture_url1(val["recipe"][0]["url"]);
            global.set_picture_name2(val["recipe"][1]["recipe_name"]);
            global.set_picture_link2(val["recipe"][1]["picture_link"]);
            global.set_picture_url2(val["recipe"][1]["url"]);
            Navigator.pushNamed(context, "/FoodBaseInfoPage");

          },
          child: Container(
            child: Card(
              //设置圆角
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(Adapt.px(16)))
              ),
//            color: Colors.green, //阴影颜色
              elevation: Adapt.px(5),//阴影高度
              child: Container(
                margin: EdgeInsets.all(Adapt.px(5.0)),
                padding: EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Image.network(val["pic"],width: Adapt.px(320),height:Adapt.px(200),fit: BoxFit.fitWidth,),
                    Text(val["name"],style: TextStyle(fontSize: Adapt.px(30),color: Colors.green),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white, width: Adapt.px(3),),
                    bottom: BorderSide(color: Colors.white, width: Adapt.px(3),),
                    left: BorderSide(color: Colors.white, width: Adapt.px(3),),
                    right: BorderSide(color: Colors.white, width: Adapt.px(3),),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    }else{
      return Text("暂无食材!");
    }
  }

//精选食材，组合
  Widget _handPick(){
    return Container(
      child: Column(
        children: [
          _handPickTitle,
          _wrapList()
        ],
      ),
    );
  }

}