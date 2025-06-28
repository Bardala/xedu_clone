class Advisor {
  final int id;
  final String name;
  final String specialty;
  final double rating;
  final String email;
  final String bio;
  final String imageUrl;
  final List<Sessions> sessions;

  Advisor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.email,
    required this.bio,
    required this.imageUrl,
    List<Sessions>? sessions,
  }) : sessions = sessions ?? [];

  factory Advisor.fromJson(Map<String, dynamic> json) {
    return Advisor(
      id: json['id'],
      name: json['name'],
      specialty: json['specialty'],
      rating: json['rating'],
      email: json['email'],
      bio: json['bio'],
      imageUrl: json['imageUrl'],
    );
  }
}

class Sessions {
  final int id;
  final DateTime date;
  final String studentName;

  Sessions({required this.id, required this.date, required this.studentName});
}
