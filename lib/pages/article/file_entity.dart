/// msg : "The query succeeds!"
/// result : [{"article_name":"草莓连续5年被评为最脏水果！怎样才能避开果蔬农残的危害？","id":14,"location":"http://47.98.201.222:8080/ingredients/article/article_491_5.html","weight":0},{"article_name":"吃橘子别扔皮，橘子皮还有这些妙用","id":15,"location":"http://47.98.201.222:8080/ingredients/article/article_644_64.html","weight":0},{"article_name":"喝了假蜂蜜会怎么样？假蜂蜜是怎么做出来的？","id":16,"location":"http://47.98.201.222:8080/ingredients/article/article_151_785.html","weight":0},{"article_name":"黑枸杞和红枸杞的区别","id":17,"location":"http://47.98.201.222:8080/ingredients/article/article_400_74.html","weight":0},{"article_name":"食用油开封后，能用多久？超过几个时间，宁可丢掉也别吃","id":18,"location":"http://47.98.201.222:8080/ingredients/article/article_718_438.html","weight":0},{"article_name":"香蕉买回家没几天就变黑了！教你香蕉的正确储存方式","id":19,"location":"http://47.98.201.222:8080/ingredients/article/article_47_445.html","weight":0},{"article_name":"新冠肺炎疫情期间这样囤菜，买一趟吃一周，天天都吃新鲜菜","id":20,"location":"http://47.98.201.222:8080/ingredients/article/article_913_577.html","weight":0},{"article_name":"长霉、发芽？快来看看怎么保存蔬菜最新鲜","id":21,"location":"http://47.98.201.222:8080/ingredients/article/article_719_483.html","weight":0},{"article_name":"注意：这3种食物不能放冰箱，会导致营养流失，记得提醒家人清理","id":22,"location":"http://47.98.201.222:8080/ingredients/article/article_257_725.html","weight":0},{"article_name":"为什么大米放久了会长小虫子？哪儿来的？一个方法“赶尽杀绝”","id":23,"location":"http://47.98.201.222:8080/ingredients/article/article_839_826.html","weight":0}]

class FileEntity {
  String msg;
  List<Result> result;

  FileEntity({
      this.msg, 
      this.result});

  FileEntity.fromJson(dynamic json) {
    msg = json["msg"];
    if (json["result"] != null) {
      result = [];
      json["result"].forEach((v) {
        result.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["msg"] = msg;
    if (result != null) {
      map["result"] = result.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// article_name : "草莓连续5年被评为最脏水果！怎样才能避开果蔬农残的危害？"
/// id : 14
/// location : "http://47.98.201.222:8080/ingredients/article/article_491_5.html"
/// weight : 0

class Result {
  String articleName;
  int id;
  String location;
  int weight;
  String coverPic;
  int score;

  Result({
      this.articleName, 
      this.id, 
      this.location, 
      this.weight,
      this.coverPic,
      this.score
  });

  Result.fromJson(dynamic json) {
    articleName = json["article_name"];
    id = json["id"];
    location = json["location"];
    weight = json["weight"];
    coverPic = json["cover_pic"];
    score = json["mark"];
  }

  Result.fromSql(dynamic json) {
    articleName = json["articleName"];
    id = json["id"];
    location = json["location"];
    weight = json["weight"];
    coverPic = json["coverPic"];
    score = json["mark"];
  }
  Map<String, dynamic> toSql() {
    var map = <String, dynamic>{};
    map["articleName"] = articleName;
    map["id"] = id;
    map["location"] = location;
    map["weight"] = weight;
    map["coverPic"] = coverPic;
    map["mark"] = score;
    return map;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["article_name"] = articleName;
    map["id"] = id;
    map["location"] = location;
    map["weight"] = weight;
    map["cover_pic"] = coverPic;
    map["mark"] = score;
    return map;
  }

}