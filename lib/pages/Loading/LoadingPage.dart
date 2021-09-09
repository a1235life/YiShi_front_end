import 'dart:convert';
import 'package:ingredients/pages/home/homeFoodInfo.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ingredients/global/global.dart';
import 'package:http/http.dart' as http;

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
    getallfood();
    //在加载页面停顿3s
    new Future.delayed(Duration(seconds: 3),(){
      Navigator.pushNamed(context, "/first");
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Image.asset("lib/assets/images/loading/openapp.jpg",fit:BoxFit.fill,),
    );
  }

  void getallfood() {

    http.get('http://47.98.201.222:8181/food/getFood').then((response){
      var jsonData =json.decode(response.body);
      // print(jsonData);
      // print(jsonData["result"]);
      List list=jsonData["result"];
      global.set_allfoodlist(list);
      // print(list[0]);
      print(global.get_allfoodlist()[2]["name"]);
      print(list[0]["recipe"][0]["picture_link"]);
    });
    http.get('http://47.98.201.222:8181/food/classify').then((response){
      var jsonData =json.decode(response.body);
      // print(jsonData["水果类"][2]['name']);
      List list1=jsonData["水果类"];
      homeFoodInfo.set_list1(list1);
      //print(homeFoodInfo.get_list1());
      List list2=jsonData["菌类"];
      homeFoodInfo.set_list2(list2);
      List list3=jsonData["蔬菜类"];
      homeFoodInfo.set_list3(list3);
      List list4=jsonData["谷类"];
      homeFoodInfo.set_list4(list4);
      List list5=jsonData["其他类"];
      homeFoodInfo.set_list5(list5);
    });
  }
}
