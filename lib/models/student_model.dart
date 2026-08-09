class StudentModel {
  final String id;
  final String name;
  final String qrCode;
  final String grade;
  final String parentPhone;
  final double balance;

  StudentModel({
    required this.id,
    required this.name,
    required this.qrCode,
    required this.grade,
    required this.parentPhone,
    this.balance = 0.0,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'qrCode': qrCode,
        'grade': grade,
        'parentPhone': parentPhone,
        'balance': balance,
      };

  factory StudentModel.fromMap(Map<String, dynamic> map, String id) => StudentModel(
        id: id,
        name: map['name'] ?? '',
        qrCode: map['qrCode'] ?? '',
        grade: map['grade'] ?? '',
        parentPhone: map['parentPhone'] ?? '',
        balance: (map['balance'] as num?)?.toDouble() ?? 0.0,
      );
}
