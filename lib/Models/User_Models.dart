class UserModel {
  final String id;
  final String username;
  final String email;
  final bool isEmailVerified;
  final int v;
  final String token;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.isEmailVerified,
    required this.v,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      isEmailVerified: json['isEmailVerified'] ?? false,
      v: json['__v'] ?? 0,
      token: json['token'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['isEmailVerified'] = isEmailVerified;
    data['__v'] = v;
    data['token'] = token;
    return data;
  }

}
