class UserModel1 {
  final String id;
  final String username;
  final String email;
  final bool isEmailVerified;
  final int v;

  UserModel1({
    required this.id,
    required this.username,
    required this.email,
    required this.isEmailVerified,
    required this.v,
  });

  // Factory method to create a UserModel1 from JSON
  factory UserModel1.fromJson(Map<String, dynamic> json) {
    return UserModel1(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      isEmailVerified: json['isEmailVerified'],
      v: json['__v'],
    );
  }

  // Method to convert a UserModel1 to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'isEmailVerified': isEmailVerified,
      '__v': v,
    };
  }
}
