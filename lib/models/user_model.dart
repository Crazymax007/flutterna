class UserModel {
  final String id;
  final String email;
  final String role;
  final String createdAt;
  final String updateAt;

  UserModel({
    required this.id,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updateAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      role: json['role'],
      createdAt: json['createAt'],
      updateAt: json['updateAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'email':email,
      'role': role,
      'createAt':createdAt,
      'updateAt': updateAt,
    };
  }
}
