
import 'package:flutter_application_cadastro_alunos/common/entities/course.dart';
import 'package:flutter_application_cadastro_alunos/common/repositories/course_repository.dart';
import 'package:flutter_application_cadastro_alunos/modules/course/data/course_list_store.dart';
import 'package:mobx/mobx.dart';

part 'course_edit_store.g.dart';

class CourseEditStore = _CourseEditStore with _$CourseEditStore;

abstract class _CourseEditStore with Store {
  final CourseRepository _courseRepository;
  final CourseListStore _courseListStore;

  _CourseEditStore(this._courseRepository, this._courseListStore);

  @observable
  String description = '';

  @observable
  String courseprogram = '';

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  void setDescription(String value) => description = value;

  @action
  void setCourseProgram(String value) => courseprogram = value;

  @computed
  bool get hasError => error != null;

  @action
  Future<void> updateCourse(Course course) async {
    try {
      isLoading = true;
      await _courseRepository.updateCourse(course.copyWith(description: description, courseprogram: courseprogram));
      error = null;
      _courseListStore.fetchCourses();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}