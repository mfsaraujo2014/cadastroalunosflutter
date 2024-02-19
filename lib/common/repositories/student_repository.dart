import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';

abstract class StudentRepository {
  Future<List<Student>> getAllStudents([String searchTerm = '']);
  Future<void> createStudent(Student student);
  Future<void> updateStudent(Student student);
}