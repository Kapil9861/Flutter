class User {
  final int id;
  final String? sourceId;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final String password;
  final String? rememberToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    this.sourceId,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.password,
    this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create a User instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      sourceId: json['source_id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      password: json['password'],
      rememberToken: json['remember_token'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'source_id': sourceId,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'password': password,
      'remember_token': rememberToken,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
