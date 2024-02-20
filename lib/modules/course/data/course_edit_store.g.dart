// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CourseEditStore on _CourseEditStore, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_CourseEditStore.hasError'))
          .value;

  late final _$descriptionAtom =
      Atom(name: '_CourseEditStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$courseprogramAtom =
      Atom(name: '_CourseEditStore.courseprogram', context: context);

  @override
  String get courseprogram {
    _$courseprogramAtom.reportRead();
    return super.courseprogram;
  }

  @override
  set courseprogram(String value) {
    _$courseprogramAtom.reportWrite(value, super.courseprogram, () {
      super.courseprogram = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CourseEditStore.isLoading', context: context);

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
      Atom(name: '_CourseEditStore.error', context: context);

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

  late final _$updateCourseAsyncAction =
      AsyncAction('_CourseEditStore.updateCourse', context: context);

  @override
  Future<void> updateCourse(Course course) {
    return _$updateCourseAsyncAction.run(() => super.updateCourse(course));
  }

  late final _$_CourseEditStoreActionController =
      ActionController(name: '_CourseEditStore', context: context);

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_CourseEditStoreActionController.startAction(
        name: '_CourseEditStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CourseEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCourseProgram(String value) {
    final _$actionInfo = _$_CourseEditStoreActionController.startAction(
        name: '_CourseEditStore.setCourseProgram');
    try {
      return super.setCourseProgram(value);
    } finally {
      _$_CourseEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
courseprogram: ${courseprogram},
isLoading: ${isLoading},
error: ${error},
hasError: ${hasError}
    ''';
  }
}
