import 'package:flutter_modular/flutter_modular.dart';

import 'pages/student_list_page.dart';

class StudentModule extends Module {

  @override
  void routes(r) {
    r.child('/', child: (context) => StudentListPage());
  }
}