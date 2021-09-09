class Register {
  String username;
  String password;
  String phone;

  Register(this.username,
      this.password,
      this.phone);

  Register.fromJson(Map<String, dynamic> json)
      :
        username = json['username'],
        password = json['password'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
    'phone' : phone
  };
}