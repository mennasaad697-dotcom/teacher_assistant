enum DiscountType { fixed, percentage }

class PaymentModel {
  final String id;
  final String studentId;
  final double originalAmount;
  final DiscountType discountType;
  final double discountValue;
  final double finalAmount;
  final DateTime timestamp;

  PaymentModel({
    required this.id,
    required this.studentId,
    required this.originalAmount,
    required this.discountType,
    required this.discountValue,
    required this.finalAmount,
    required this.timestamp,
  });
}
