import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';
import 'package:flutter_application_cadastro_alunos/common/repositories/student_repository.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_list_store.dart';
import 'package:mobx/mobx.dart';

part 'student_edit_store.g.dart';

class StudentEditStore = _StudentEditStore with _$StudentEditStore;

abstract class _StudentEditStore with Store {
  final StudentRepository _studentRepository;
  final StudentListStore _studentListStore;

  _StudentEditStore(this._studentRepository, this._studentListStore);

  @observable
  String name = '';

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  void setName(String value) => name = value;

  @computed
  bool get hasError => error != null;

  @action
  Future<void> updateStudent(Student student) async {
    try {
      isLoading = true;
      await _studentRepository.updateStudent(student.copyWith(name: name));
      error = null;
      _studentListStore.fetchStudents();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}