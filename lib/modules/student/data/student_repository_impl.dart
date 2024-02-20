import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';
import 'package:flutter_application_cadastro_alunos/common/repositories/student_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class StudentRepositoryImpl implements StudentRepository {
  final String baseUrl = 'http://localhost:9001';

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
      final url = Uri.parse('$baseUrl/students');

      final Map<String, dynamic> data = {
        'name': student.name,
        'code': student.code,
      };

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('Estudante criado com sucesso');
      } else {
        final responseBody = jsonDecode(response.body);
        final errorMessage = responseBody['error'] ?? response.body;
        throw Exception(errorMessage);
      }
  }

  @override
  Future<void> updateStudent(Student student) async {
   final url = Uri.parse('$baseUrl/students/${student.code}');
    final Map<String, dynamic> data = {
      'name': student.name,
      'code': student.code,
    };

    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Estudante atualizado com sucesso');
    } else {
      final responseBody = jsonDecode(response.body);
      final errorMessage = responseBody['error'] ?? response.body;
      throw Exception(errorMessage);
    }
  }
}