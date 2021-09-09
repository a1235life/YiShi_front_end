import 'package:ingredients/global/userInfo.dart';
import 'package:provide/provide.dart';

class LogBean{
  static String id;//日志id
  String title;//日志标题
  String content;  //日志内容
  String time;  //日志时间


  //转换成map类型，并添加到日志信息列表
  Map<dynamic,dynamic> toMap(String id,String title,String content,String time){
    Map myMap;
    myMap = {"id": id, "title":title, "content":content, "time":time};
//    UserInfo.set_LogList(myMap);//添加到日志信息列表
    return myMap;
  }

  //添加到日志信息列表
  void addLogLit(Map map){
    UserInfo.set_LogList(map);
  }

  //修改日志内容
  void editLogById(Map map){
    List<Map> logList = UserInfo.LogList;
    for(int i=0;i<logList.length;i++){//遍历日志列表
      if (logList[i]["id"] == map["id"]) {//存在
        print("原来的日志信息${logList[i]}");
        logList[i] = map;//覆盖
        print("修改后日志信息${logList[i]}");
      }
    }
  }

  //删除某条日志
  void delLogByMap(Map map){
    List<Map> logList = UserInfo.LogList;
    int delId = int.parse(map["id"]);//要删除的id

    if (logList.contains(map)) {//存在
      print("删除前的日志信息列表${logList}");
      logList.remove(map);//删除

      //将删除的位置及后面的id前移
      for(int i=delId-1;i<logList.length;i++){//遍历
        int id = int.parse(logList[i]["id"]);//取出id值 ， 并转换为整型
        id--;
        logList[i]["id"] = id.toString();
      }

      print("删除后的日志信息列表${logList}");
    }else{
      print("该条日志已经不存在了！");
    }
  }



}