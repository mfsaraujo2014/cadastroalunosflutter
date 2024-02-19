import 'package:flutter_application_cadastro_alunos/common/entities/course.dart';
import 'package:flutter_application_cadastro_alunos/common/repositories/course_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseRepositoryImpl implements CourseRepository {
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
    
  }

  @override
  Future<void> updateCourse(Course course) async {
    
  }
}