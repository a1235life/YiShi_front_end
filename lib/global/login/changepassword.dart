class Changepassword{
  String email;
  String password;

  Changepassword(
      this.email,
      this.password,
      );
  Changepassword.fromJson(Map<String, dynamic> json)
      :
        email = json['email'],
        password=json['password'];


  Map<String, dynamic> toJson() => {
    'email': email,
    'password':password,
  };
}