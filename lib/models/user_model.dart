class User {
  final String email;
  final String name;
  final String? phone;
  final String? job;
  final String? address;
  final String username;
  final String? password;

  User({
    required this.email,
    required this.name,
    this.phone,
    this.job,
    this.address,
    required this.username,
    this.password,
  });

  // The 'factory' keyword allows custom constructor logic. It can return a new instance,
  // a cached instance, or even a subtype — often used for parsing JSON into models.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json["email"] as String,
      name: json["name"] as String,
      phone: json["phone"] as String?,
      job: json["job"] as String?,
      address: json["address"] as String?,
      username: json["username"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "phone": phone,
      "job": job,
      "address": address,
      "username": username,
      if (password != null) "password": password,
    };
  }
}
