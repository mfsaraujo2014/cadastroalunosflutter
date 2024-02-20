import 'package:flutter_application_cadastro_alunos/common/entities/course.dart';

class Student {
  final int code;
  final String name;
  final List<Course>? courses;

  Student({
    required this.code,
    required this.name,
    this.courses,
  });

  Student copyWith({
    String? name,
  }) {
    return Student(
      code: code,
      name: name ?? this.name,
    );
  }

  

  factory Student.fromJson(Map<String, dynamic> json) {
    List<Course>? courses;
    if (json['courses'] != null) {
      var courseList = json['courses'] as List;
      courses = courseList.map((courseJson) => Course.fromJson(courseJson)).toList();
    }
    return Student(
      code: json['code'],
      name: json['name'],
      courses: courses,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? courseJsonList;
    if (courses != null) {
      courseJsonList = courses!.map((course) => course.toJson()).toList();
    }
    return {
      'code': code,
      'name': name,
      'courses': courseJsonList,
    };
  }
}