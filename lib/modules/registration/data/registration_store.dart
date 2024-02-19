import 'package:flutter_application_cadastro_alunos/common/entities/registration.dart';
import 'package:flutter_application_cadastro_alunos/common/repositories/registration_repository.dart';
import 'package:mobx/mobx.dart';

part 'registration_store.g.dart';

class RegistrationStore = _RegistrationStore with _$RegistrationStore;

abstract class _RegistrationStore with Store {
  final RegistrationRepository _registrationRepository;

  _RegistrationStore(this._registrationRepository);

  @observable
  int studentCode = 0;

  @observable
  int courseCode = 0;

  @observable
  bool isError = false;

  @observable
  String? errorMessage;

  @action
  void setStudentCode(int code) {
    studentCode = code;
  }

  @action
  void setCourseCode(int code) {
    courseCode = code;
  }

  @action
  Future<void> enroll({required int studentCode, required int courseCode}) async {
    try {
    String? error = await _registrationRepository.createRegistration(studentCode, courseCode);
    if (error == null) {
      print('Matrícula realizada com sucesso');
    } else {
      throw Exception(error);
    }
    isError = false;
    errorMessage = null;
    } catch (e) {
      isError = true;
      errorMessage = '$e';
    }
  }
}