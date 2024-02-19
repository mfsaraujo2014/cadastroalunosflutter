import 'package:flutter_application_cadastro_alunos/modules/course/pages/course_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CourseModule extends Module {

  @override
  void routes(r) {
    r.child('/', child: (context) => CourseListPage());
  }
}