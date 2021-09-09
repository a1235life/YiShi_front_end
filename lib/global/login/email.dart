class Email{
  String email;

  Email(
      this.email,

      );
  Email.fromJson(Map<String, dynamic> json)
      :
        email = json['email'];


  Map<String, dynamic> toJson() => {
    'email': email,
  };
}