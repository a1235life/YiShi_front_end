
class user {
  String username;
  String passeord;
  String phone;

  user(this.username, this.passeord, this.phone);

  user.fromJson(Map<String, dynamic> json) :
    username = json['username'],
    passeord = json['passeord'],
    phone = json['phone'];


  Map<String, dynamic> toJson() =>{
    'username': username,
    'passeord': passeord,
    'phone' : phone
  };
}