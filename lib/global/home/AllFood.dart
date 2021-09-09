import 'dart:convert' show json;

class AllFood {

  List<T> result;

  AllFood.fromParams({this.result});

  factory AllFood(jsonStr) => jsonStr == null ? null : jsonStr is String ? new AllFood.fromJson(json.decode(jsonStr)) : new AllFood.fromJson(jsonStr);

  AllFood.fromJson(jsonRes) {
    result = jsonRes['result'] == null ? null : [];

    for (var resultItem in result == null ? [] : jsonRes['result']){
      result.add(resultItem == null ? null : new T.fromJson(resultItem));
    }
  }

  @override
  String toString() {
    return '{"result": $result}';
  }
}

class T {

  Object tag;
  int id;
  int weight;
  String benefits;
  String calorie;
  String choose;
  String classification;
  String conflict;
  String dishes;
  String introduction;
  String mate;
  String name;
  String nickname;
  String storage;
  String suitable;
  String unsuitable;

  T.fromParams({this.tag, this.id, this.weight, this.benefits, this.calorie, this.choose, this.classification, this.conflict, this.dishes, this.introduction, this.mate, this.name, this.nickname, this.storage, this.suitable, this.unsuitable});

  T.fromJson(jsonRes) {
    tag = jsonRes['tag'];
    id = jsonRes['id'];
    weight = jsonRes['weight'];
    benefits = jsonRes['benefits'];
    calorie = jsonRes['calorie'];
    choose = jsonRes['choose'];
    classification = jsonRes['classification'];
    conflict = jsonRes['conflict'];
    dishes = jsonRes['dishes'];
    introduction = jsonRes['introduction'];
    mate = jsonRes['mate'];
    name = jsonRes['name'];
    nickname = jsonRes['nickname'];
    storage = jsonRes['storage'];
    suitable = jsonRes['suitable'];
    unsuitable = jsonRes['unsuitable'];
  }

  @override
  String toString() {
    return '{"tag": $tag,"id": $id,"weight": $weight,"benefits": ${benefits != null?'${json.encode(benefits)}':'null'},"calorie": ${calorie != null?'${json.encode(calorie)}':'null'},"choose": ${choose != null?'${json.encode(choose)}':'null'},"classification": ${classification != null?'${json.encode(classification)}':'null'},"conflict": ${conflict != null?'${json.encode(conflict)}':'null'},"dishes": ${dishes != null?'${json.encode(dishes)}':'null'},"introduction": ${introduction != null?'${json.encode(introduction)}':'null'},"mate": ${mate != null?'${json.encode(mate)}':'null'},"name": ${name != null?'${json.encode(name)}':'null'},"nickname": ${nickname != null?'${json.encode(nickname)}':'null'},"storage": ${storage != null?'${json.encode(storage)}':'null'},"suitable": ${suitable != null?'${json.encode(suitable)}':'null'},"unsuitable": ${unsuitable != null?'${json.encode(unsuitable)}':'null'}}';
  }
}