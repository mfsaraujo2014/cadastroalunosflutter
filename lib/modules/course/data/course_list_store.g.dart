// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CourseListStore on _CourseListStore, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_CourseListStore.hasError'))
          .value;

  late final _$coursesAtom =
      Atom(name: '_CourseListStore.courses', context: context);

  @override
  ObservableList<Course> get courses {
    _$coursesAtom.reportRead();
    return super.courses;
  }

  @override
  set courses(ObservableList<Course> value) {
    _$coursesAtom.reportWrite(value, super.courses, () {
      super.courses = value;
    });
  }

  late final _$searchTermAtom =
      Atom(name: '_CourseListStore.searchTerm', context: context);

  @override
  String get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CourseListStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_CourseListStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$fetchCoursesAsyncAction =
      AsyncAction('_CourseListStore.fetchCourses', context: context);

  @override
  Future<void> fetchCourses({String searchTerm = ''}) {
    return _$fetchCoursesAsyncAction
        .run(() => super.fetchCourses(searchTerm: searchTerm));
  }

  late final _$_CourseListStoreActionController =
      ActionController(name: '_CourseListStore', context: context);

  @override
  void setSearchTerm(String term) {
    final _$actionInfo = _$_CourseListStoreActionController.startAction(
        name: '_CourseListStore.setSearchTerm');
    try {
      return super.setSearchTerm(term);
    } finally {
      _$_CourseListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
courses: ${courses},
searchTerm: ${searchTerm},
isLoading: ${isLoading},
error: ${error},
hasError: ${hasError}
    ''';
  }
}
