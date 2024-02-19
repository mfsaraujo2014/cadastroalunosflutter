import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';
import 'package:flutter_application_cadastro_alunos/common/repositories/student_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class StudentRepositoryImpl implements StudentRepository {
  @override
  Future<List<Student>> getAllStudents([String searchTerm = '']) async {
    final Uri uri = Uri.parse('http://localhost:9001/students?nome=$searchTerm');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> studentData = json.decode(response.body);
      return studentData.map((data) => Student.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }

  @override
  Future<void> createStudent(Student student) async {
    
  }

  @override
  Future<void> updateStudent(Student student) async {
   
  }
}