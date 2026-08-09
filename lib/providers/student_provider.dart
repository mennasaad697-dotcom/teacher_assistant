import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/student_model.dart';

class StudentProvider with ChangeNotifier {
  List<StudentModel> _students = [];
  bool _isLoading = false;

  List<StudentModel> get students => _students;
  bool get isLoading => _isLoading;

  StudentProvider() {
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    _isLoading = true;
    notifyListeners();

    try {
      final snapshot = await FirebaseFirestore.instance.collection('students').get();
      _students = snapshot.docs
          .map((doc) => StudentModel.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      debugPrint('Error fetching students: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addStudent(StudentModel student) async {
    try {
      final docRef = await FirebaseFirestore.instance.collection('students').add(student.toMap());
      _students.add(StudentModel(
        id: docRef.id,
        name: student.name,
        qrCode: student.qrCode,
        grade: student.grade,
        parentPhone: student.parentPhone,
        balance: student.balance,
      ));
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding student: $e');
    }
  }
}
