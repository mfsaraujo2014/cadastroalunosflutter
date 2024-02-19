import 'package:flutter_application_cadastro_alunos/modules/registration/pages/registration_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationModule extends Module {

  @override
  void routes(r) {
    r.child('/', child: (context) => RegistrationPage());
  }
}