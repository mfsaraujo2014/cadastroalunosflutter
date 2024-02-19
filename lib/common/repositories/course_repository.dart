import 'package:flutter_application_cadastro_alunos/common/entities/course.dart';

abstract class CourseRepository {
  Future<List<Course>> getAllCourses([String searchTerm = '']);
  Future<void> createCourse(Course course);
  Future<void> updateCourse(Course course);
}