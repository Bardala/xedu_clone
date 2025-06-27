class User {
  final String email;
  final String name;
  final String phone;
  final String job;
  final String address;
  final String username;

  User({
    required this.email,
    required this.name,
    required this.phone,
    required this.job,
    required this.address,
    required this.username,
  });

  // The 'factory' keyword allows custom constructor logic. It can return a new instance,
  // a cached instance, or even a subtype — often used for parsing JSON into models.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json["email"] as String,
      name: json["name"] as String,
      phone: json["phone"] as String,
      job: json["job"] as String,
      address: json["address"] as String,
      username: json["username"] as String,
    );
  }
}

class LoginRes {
  final User user;
  final String token;

  LoginRes({required this.user, required this.token});

  factory LoginRes.fromJson(Map<String, dynamic> json) {
    return LoginRes(
      user: User.fromJson(json["user"] as Map<String, dynamic>),
      token: json['token'] as String,
    );
  }
}
