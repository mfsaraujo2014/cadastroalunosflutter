
import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';
import 'package:flutter_application_cadastro_alunos/common/repositories/student_repository.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_list_store.dart';
import 'package:mobx/mobx.dart';

part 'student_create_store.g.dart';

class StudentCreateStore = _StudentCreateStore with _$StudentCreateStore;

abstract class _StudentCreateStore with Store {
  final StudentRepository _studentRepository;
  final StudentListStore _studentListStore;

  _StudentCreateStore(this._studentRepository, this._studentListStore);

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
  Future<void> createStudent() async {
    try {
      isLoading = true;
      final newStudent = Student(
        code: 0,
        name: name,
      );
      await _studentRepository.createStudent(newStudent);
      error = null;
      _studentListStore.fetchStudents();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}