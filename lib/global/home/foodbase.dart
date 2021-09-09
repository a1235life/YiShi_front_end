class Fooodbase {
  String id;
  String name;
  String introduction;
  String nickname;
  String calorie;
  String classification;
  String dishes;
  String benefits;
  String suitable;
  String unsuitable;
  String tag;
  String weight;
  String choose;
  String storage;
  String conflict;
  String mate;

  Fooodbase(
      {this.id,
        this.name,
        this.introduction,
        this.nickname,
        this.calorie,
        this.classification,
        this.dishes,
        this.benefits,
        this.suitable,
        this.unsuitable,
        this.tag,
        this.weight,
        this.choose,
        this.storage,
        this.conflict,
        this.mate});

  Fooodbase.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    introduction = json['introduction'],
    nickname = json['nickname'],
    calorie = json['calorie'],
    classification = json['classification'],
    dishes = json['dishes'],
    benefits = json['benefits'],
    suitable = json['suitable'],
    unsuitable = json['unsuitable'],
    tag = json['tag'],
    weight = json['weight'],
    choose = json['choose'],
    storage = json['storage'],
    conflict = json['conflict'],
    mate = json['mate'];


  Map<String, dynamic> toJson()=> {
    'id':id,
    'name':name,
    'introduction':introduction,
    'nickname':nickname,
    'calorie':calorie,
    'classification': classification,
    'dishes': dishes,
    'benefits':benefits,
    'suitable':suitable,
    'unsuitable':unsuitable,
    'tag': tag,
    'weight':weight,
    'choose': choose,
    'storage':storage,
    'conflict': conflict,
    'mate':mate,
  };
}