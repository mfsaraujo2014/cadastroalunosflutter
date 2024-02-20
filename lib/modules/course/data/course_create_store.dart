
import 'package:flutter_application_cadastro_alunos/common/entities/course.dart';
import 'package:flutter_application_cadastro_alunos/common/repositories/course_repository.dart';
import 'package:flutter_application_cadastro_alunos/modules/course/data/course_list_store.dart';
import 'package:mobx/mobx.dart';

part 'course_create_store.g.dart';

class CourseCreateStore = _CourseCreateStore with _$CourseCreateStore;

abstract class _CourseCreateStore with Store {
  final CourseRepository _courseRepository;
  final CourseListStore _courseListStore;

  _CourseCreateStore(this._courseRepository, this._courseListStore);

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
  Future<void> createCourse() async {
    try {
      isLoading = true;
      final newCourse = Course(
        code: 0,
        description: description,
        courseprogram: courseprogram,
      );
      await _courseRepository.createCourse(newCourse);
      error = null;
      _courseListStore.fetchCourses();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}