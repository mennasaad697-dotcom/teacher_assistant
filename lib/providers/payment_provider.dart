import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentProvider with ChangeNotifier {
  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;

  Future<bool> processPayment({
    required String studentId,
    required double amount,
    required double discount,
  }) async {
    _isProcessing = true;
    notifyListeners();

    try {
      final finalAmount = amount - discount;
      await FirebaseFirestore.instance.collection('payments').add({
        'studentId': studentId,
        'originalAmount': amount,
        'discount': discount,
        'finalAmount': finalAmount,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // تحديث رصيد الطالب في قاعدة البيانات
      await FirebaseFirestore.instance.collection('students').doc(studentId).update({
        'balance': FieldValue.increment(-finalAmount),
      });

      _isProcessing = false;
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Error processing payment: $e');
      _isProcessing = false;
      notifyListeners();
      return false;
    }
  }
}
