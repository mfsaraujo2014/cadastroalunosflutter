import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';

class Course {
  final int code;
  final String description;
  final String courseprogram;
  final List<Student>? students;

  Course({
    required this.code,
    required this.description,
    required this.courseprogram,
    this.students,
  });

  Course copyWith({
    String? description,
    String? courseprogram,
  }) {
    return Course(
      code: code,
      description: description ?? this.description,
      courseprogram: courseprogram ?? this.courseprogram,
    );
  }

  factory Course.fromJson(Map<String, dynamic> json) {
     List<Student>? students;
    if (json['students'] != null) {
      var studentList = json['students'] as List;
      students = studentList.map((studentJson) => Student.fromJson(studentJson)).toList();
    }
    return Course(
      code: json['code'],
      description: json['description'],
      courseprogram: json['courseprogram'],
      students: students,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? studentJsonList;
    if (students != null) {
      studentJsonList = students!.map((student) => student.toJson()).toList();
    }
    return {
      'code': code,
      'description': description,
      'courseprogram': courseprogram,
      'students': studentJsonList,
    };
  }
}