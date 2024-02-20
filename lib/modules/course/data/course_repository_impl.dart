import 'package:flutter_application_cadastro_alunos/common/entities/course.dart';
import 'package:flutter_application_cadastro_alunos/common/repositories/course_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseRepositoryImpl implements CourseRepository {
  final String baseUrl = 'http://localhost:9001';
  @override
  Future<List<Course>> getAllCourses([String searchTerm = '']) async {
    final Uri uri = Uri.parse('http://localhost:9001/courses?descricao=$searchTerm');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> courseData = json.decode(response.body);
      return courseData.map((data) => Course.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Courses');
    }
  }

  @override
  Future<void> createCourse(Course course) async {
    final url = Uri.parse('$baseUrl/courses');

      final Map<String, dynamic> data = {
        'description': course.description,
        'courseprogram': course.description,
        'code': course.code,
      };

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('Curso criado com sucesso');
      } else {
        final responseBody = jsonDecode(response.body);
        final errorMessage = responseBody['error'] ?? response.body;
        throw Exception(errorMessage);
      }
  }

  @override
  Future<void> updateCourse(Course course) async {
    final url = Uri.parse('$baseUrl/courses/${course.code}');
    final Map<String, dynamic> data = {
      'description': course.description,
      'code': course.code,
      'courseprogram': course.courseprogram,
    };

    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Curso atualizado com sucesso');
    } else {
      final responseBody = jsonDecode(response.body);
      final errorMessage = responseBody['error'] ?? response.body;
      throw Exception(errorMessage);
    }
  }
}