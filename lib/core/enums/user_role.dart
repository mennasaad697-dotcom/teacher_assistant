enum UserRole { admin, teacher, assistant, parent }

extension UserRoleExtension on UserRole {
  String toShortString() {
    return toString().split('.').last;
  }

  static UserRole fromString(String role) {
    return UserRole.values.firstWhere(
      (e) => e.toShortString() == role,
      orElse: () => UserRole.parent,
    );
  }
}
