class Student {
  final String id;
  final String username;

  Student({
    required this.id,
    required this.username,
  });

  // Factory constructor to create a Student from a JSON map
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      username: json['username'],
    );
  }

  // Method to convert a Student instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
    };
  }

  // Method to copy a Student instance with updated fields
  Student copyWith({
    String? id,
    String? username,
  }) {
    return Student(
      id: id ?? this.id,
      username: username ?? this.username,
    );
  }

  @override
  String toString() {
    return 'Student{id: $id, username: $username}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Student &&
        other.id == id &&
        other.username == username;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode;
}
