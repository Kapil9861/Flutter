class User {
  final int? id;
  final String? sourceId;
  final String name;
  final String email;
  final String phoneNumber;
  final DateTime? emailVerifiedAt;
  final String password;
  final String? rememberToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.sourceId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.emailVerifiedAt,
    required this.password,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
  });

  // Factory method to create a User instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      sourceId: json['source_id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone'],
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
      'source_id': sourceId,
      'name': name,
      'email': email,
      'phone': phoneNumber,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'password': password,
      'remember_token': rememberToken,
    };
  }

  @override
  String toString() {
    return 'User{sourceId: $sourceId, name: $name, email: $email, phone_number: $phoneNumber, emailVerifiedAt: ${emailVerifiedAt?.toIso8601String()}, password: $password, rememberToken: $rememberToken}';
  }
}
