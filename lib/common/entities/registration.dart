class Registration {
  final int code;
  final int codeStudent;
  final List<int> codeCourse;

  Registration({
    required this.code,
    required this.codeStudent,
    required this.codeCourse,
  });

  factory Registration.fromJson(Map<String, dynamic> json) {
    List<int> courses = [];
    if (json['courses'] != null) {
      var courseList = json['courses'] as List;
      courses = courseList.map((courseJson) => courseJson as int).toList();
    }
    return Registration(
      code: json['code'],
      codeStudent: json['codeStudent'],
      codeCourse: courses,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'codeStudent': codeStudent,
      'courses': codeCourse,
    };
  }
}