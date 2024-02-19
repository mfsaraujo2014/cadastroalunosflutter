import 'package:flutter_application_cadastro_alunos/modules/course/course_module.dart';
import 'package:flutter_application_cadastro_alunos/modules/home_page.dart';
import 'package:flutter_application_cadastro_alunos/modules/registration/registration_module.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/student_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
   @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
    r.module('/students', module: StudentModule());
    r.module('/courses', module: CourseModule());
    r.module('/registration', module: RegistrationModule());
  }
}