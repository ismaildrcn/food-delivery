class User {
  String username;
  String email;
  String firstName = "";
  String lastName = "";
  String password;
  int countryCode = 90;
  String phoneNumber = "";


  User({
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.countryCode,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      password: json['password'],
      countryCode: json['country_code'],
      phoneNumber: json['phone_number'],
    );
  }
}
