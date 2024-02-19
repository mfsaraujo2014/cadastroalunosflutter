
import 'package:flutter_application_cadastro_alunos/common/entities/course.dart';
import 'package:flutter_application_cadastro_alunos/common/repositories/course_repository.dart';
import 'package:mobx/mobx.dart';

part 'course_list_store.g.dart';

class CourseListStore = _CourseListStore with _$CourseListStore;

abstract class _CourseListStore with Store {
  final CourseRepository _courseRepository;

  _CourseListStore(this._courseRepository);

  @observable
  ObservableList<Course> courses = ObservableList<Course>();

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
    fetchCourses(searchTerm: term);
  }

  @action
  Future<void> fetchCourses({String searchTerm = ''}) async {
    try {
      isLoading = true;
      courses = ObservableList.of(await _courseRepository.getAllCourses(searchTerm));
      error = null;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}