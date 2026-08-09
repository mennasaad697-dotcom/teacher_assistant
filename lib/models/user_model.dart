import '../core/enums/user_role.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final UserRole role;
  final String? phoneNumber;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.role,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'role': role.toShortString(),
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      role: UserRoleExtension.fromString(map['role'] ?? 'parent'),
      phoneNumber: map['phoneNumber'],
    );
  }
}
