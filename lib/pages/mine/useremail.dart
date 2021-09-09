class Useremail{
  String email;
  String phone;

  Useremail(
      this.email,
      this.phone,
      );
  Useremail.fromJson(Map<String, dynamic> json)
      :
        email = json['email'],
        phone=json['phone'];


  Map<String, dynamic> toJson() => {
    'email': email,
    'phone':phone,
  };
}