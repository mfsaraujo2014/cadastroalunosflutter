import 'package:mobx/mobx.dart';
import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';
import 'package:flutter_application_cadastro_alunos/common/repositories/student_repository.dart';

part 'student_list_store.g.dart';

class StudentListStore = _StudentListStore with _$StudentListStore;

abstract class _StudentListStore with Store {
  final StudentRepository _studentRepository;

  _StudentListStore(this._studentRepository);

  @observable
  ObservableList<Student> students = ObservableList<Student>();

  @observable
  String searchTerm = '';

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @computed
  bool get hasError => error != null;

  @action
  void setSearchTerm(String term) {
    searchTerm = term;
    fetchStudents(searchTerm: term);
  }

  @action
  Future<void> fetchStudents({String searchTerm = ''}) async {
    try {
      isLoading = true;
      students = ObservableList.of(await _studentRepository.getAllStudents(searchTerm));
      error = null; 
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}