import 'package:flutter/material.dart';
import 'package:ingredients/global/Adapt.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ingredients/global/global.dart';

/**
 * 食材百科信息展现页面的组件 组合
 * 食材图片来自 手机相册 或者 拍照获取
 */
class PhotoResult extends StatelessWidget {
  PhotoResult({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
            _foodImg(global.get_imagetitle()),
        _foodOneInfo(global.get_name(), global.get_nickname(), global.get_iclassification(), global.get_calorie()),
        _foodTwoInfo(global.get_introduction()),
        _foodThreeInfo(global.get_suitable()),
        _foodFourInfo(global.get_unsuitable()),
        _foodMenu(
          global.get_picture_link1(),
          global.get_picture_name1(),
          global.get_picture_url1(),
          global.get_picture_link2(),
          global.get_picture_name2(),
          global.get_picture_url2(),),
      ],
    );
  }

  //菜谱点击响应     启动浏览器打开URL
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '不能打开 $url';
    }
  }

  //  食材样图(传参：食材图片)  拍照或者相册获取的图片
  Widget _foodImg(image){
    return Container(
      margin: EdgeInsets.all(Adapt.px(5)),
      child: Card(
        //设置圆角
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(Adapt.px(16)))),
        elevation: Adapt.px(10), //阴影高度
        child: Image.file(image, height: 200,),
      ),
    );
  }

//名称、别名、分类、热量
  Widget _foodOneInfo(name,otherName,sort,calories){
    return Container(
      child: Card(
        //设置圆角
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(Adapt.px(5)))),
        elevation: Adapt.px(5), //阴影高度
        child: Container(
          padding: EdgeInsets.all(Adapt.px(10)),
          child: Column(
            children: [
              new Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    child: Text(
                      "名称：",
                      style: TextStyle(
                          fontSize: Adapt.px(35),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    padding: EdgeInsets.all(Adapt.px(5)),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: Adapt.px(40)),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: Adapt.px(2),
                        ),
                        borderRadius:
                        BorderRadius.circular(Adapt.px(15))),
                  )
                ],
              ),
              new Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    child: Text(
                      "别名：",
                      style: TextStyle(
                          fontSize: Adapt.px(35),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: Adapt.px(10)),
                      padding: EdgeInsets.all(Adapt.px(5)),
                      child: Text(
                        otherName,
                        style: TextStyle(fontSize: Adapt.px(40)),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                            width: Adapt.px(2),
                          ),
                          borderRadius:
                          BorderRadius.circular(Adapt.px(15))),
                    ),
                  )
                ],
              ),
              new Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    child: Text(
                      "分类：",
                      style: TextStyle(
                          fontSize: Adapt.px(35),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    padding: EdgeInsets.all(Adapt.px(5)),
                    child: Text(
                      sort,
                      style: TextStyle(fontSize: Adapt.px(40)),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: Adapt.px(2),
                        ),
                        borderRadius:
                        BorderRadius.circular(Adapt.px(15))),
                  )
                ],
              ),
              new Row(
                children: [
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    child: Text(
                      "热量：",
                      style: TextStyle(
                          fontSize: Adapt.px(35),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: Adapt.px(10)),
                    padding: EdgeInsets.all(Adapt.px(5)),
                    child: Text(
                      calories,
                      style: TextStyle(fontSize: Adapt.px(40)),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: Adapt.px(2),
                        ),
                        borderRadius:
                        BorderRadius.circular(Adapt.px(15))),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//食材介绍
  Widget _foodTwoInfo(introduce){
    return Container(
      child: Card(
        //设置圆角
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(Adapt.px(5)))),
          elevation: Adapt.px(5), //阴影高度
          child: Container(
            padding: EdgeInsets.all(Adapt.px(10)),
            child: Column(
              children: [
                new Row(
                  children: [
                    new Container(
                      width: Adapt.px(20),
                      height: Adapt.px(50),
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(Adapt.px(10)),
                        child: Text(
                          "食材介绍：",
                          style: TextStyle(
                              fontSize: Adapt.px(35),
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: Adapt.px(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                new Container(
                  padding: EdgeInsets.all(Adapt.px(5)),
                  child: Text(
                    introduce,
                    style: TextStyle(fontSize: Adapt.px(40)),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: Adapt.px(2),
                      ),
                      borderRadius:
                      BorderRadius.circular(Adapt.px(15))),
                )
              ],
            ),
          )),
    );
  }

//适宜人群
  Widget _foodThreeInfo(appropriate_crowd){
    return Container(
      child: Card(
        //设置圆角
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(Adapt.px(5)))),
          elevation: Adapt.px(5), //阴影高度
          child: Container(
            padding: EdgeInsets.all(Adapt.px(10)),
            child: Column(
              children: [
                new Row(
                  children: [
                    new Container(
                      width: Adapt.px(20),
                      height: Adapt.px(50),
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(Adapt.px(10)),
                        child: Text(
                          "适宜人群：",
                          style: TextStyle(
                              fontSize: Adapt.px(35),
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: Adapt.px(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                new Container(
                  padding: EdgeInsets.all(Adapt.px(5)),
                  child: Text(
                    appropriate_crowd,
                    style: TextStyle(fontSize: Adapt.px(40)),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: Adapt.px(2),
                      ),
                      borderRadius:
                      BorderRadius.circular(Adapt.px(15))),
                )
              ],
            ),
          )),
    );
  }

//禁忌人群
  Widget _foodFourInfo(taboo_crowd){
    return Container(
      child: Card(
        //设置圆角
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(Adapt.px(5)))),
          elevation: Adapt.px(5), //阴影高度
          child: Container(
            padding: EdgeInsets.all(Adapt.px(10)),
            child: Column(
              children: [
                new Row(
                  children: [
                    new Container(
                      width: Adapt.px(20),
                      height: Adapt.px(50),
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(Adapt.px(10)),
                        child: Text(
                          "禁忌人群：",
                          style: TextStyle(
                              fontSize: Adapt.px(35),
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: Adapt.px(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                new Container(
                  padding: EdgeInsets.all(Adapt.px(5)),
                  child: Text(
                    taboo_crowd,
                    style: TextStyle(fontSize: Adapt.px(40)),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: Adapt.px(2),
                      ),
                      borderRadius:
                      BorderRadius.circular(Adapt.px(15))),
                )
              ],
            ),
          )),
    );
  }

//菜谱
  Widget _foodMenu(menu1_image,menu1_name,menu1_url,menu2_image,menu2_name,menu2_url){
    return Container(
      child: Card(
        //设置圆角
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(Adapt.px(5)))),
        elevation: Adapt.px(5), //阴影高度
        child: Container(
            padding: EdgeInsets.all(Adapt.px(10)),
            child: Column(
              children: [
                new Row(
                  children: [
                    new Container(
                      width: Adapt.px(20),
                      height: Adapt.px(50),
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(Adapt.px(10)),
                        child: Text(
                          "食谱推荐：",
                          style: TextStyle(
                              fontSize: Adapt.px(35),
                              fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.green,
                              width: Adapt.px(5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                new Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(Adapt.px(10)),
                            child: GestureDetector(
                              onTap: (){
                                _launchURL("$menu1_url");
                              },
                              child:  Column(
                                children: [
                                  //食谱图片
                                  new Container(
                                    child: InkWell(
                                      onTap: (){
                                        _launchURL("$menu1_url");
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(Adapt.px(15)),
                                        width: Adapt.px(200),
                                        height: Adapt.px(200),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              menu1_image,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //食谱名称
                                  new Container(
                                    child: Text(menu1_name,style:TextStyle(fontSize: Adapt.px(40)),),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(Adapt.px(10)),
                            child: GestureDetector(
                              onTap: (){
                                _launchURL("$menu2_url");
                              },
                              child:  Column(
                                children: [
                                  //食谱图片
                                  new Container(
                                    child: InkWell(
                                      onTap: (){
                                        _launchURL("$menu2_url");
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(Adapt.px(15)),
                                        width: Adapt.px(200),
                                        height: Adapt.px(200),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              menu2_image,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //食谱名称
                                  new Container(
                                    child: Text(menu2_name,style:TextStyle(fontSize: Adapt.px(40)),),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: Adapt.px(2),
                      ),
                      borderRadius:
                      BorderRadius.circular(Adapt.px(15))),
                ),

              ],
            )
        ),
      ),
    );
  }
}
