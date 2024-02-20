// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationStore on _RegistrationStore, Store {
  late final _$studentCodeAtom =
      Atom(name: '_RegistrationStore.studentCode', context: context);

  @override
  int get studentCode {
    _$studentCodeAtom.reportRead();
    return super.studentCode;
  }

  @override
  set studentCode(int value) {
    _$studentCodeAtom.reportWrite(value, super.studentCode, () {
      super.studentCode = value;
    });
  }

  late final _$courseCodeAtom =
      Atom(name: '_RegistrationStore.courseCode', context: context);

  @override
  int get courseCode {
    _$courseCodeAtom.reportRead();
    return super.courseCode;
  }

  @override
  set courseCode(int value) {
    _$courseCodeAtom.reportWrite(value, super.courseCode, () {
      super.courseCode = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_RegistrationStore.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_RegistrationStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$enrollAsyncAction =
      AsyncAction('_RegistrationStore.enroll', context: context);

  @override
  Future<void> enroll({required int studentCode, required int courseCode}) {
    return _$enrollAsyncAction.run(
        () => super.enroll(studentCode: studentCode, courseCode: courseCode));
  }

  late final _$_RegistrationStoreActionController =
      ActionController(name: '_RegistrationStore', context: context);

  @override
  void setStudentCode(int code) {
    final _$actionInfo = _$_RegistrationStoreActionController.startAction(
        name: '_RegistrationStore.setStudentCode');
    try {
      return super.setStudentCode(code);
    } finally {
      _$_RegistrationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCourseCode(int code) {
    final _$actionInfo = _$_RegistrationStoreActionController.startAction(
        name: '_RegistrationStore.setCourseCode');
    try {
      return super.setCourseCode(code);
    } finally {
      _$_RegistrationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
studentCode: ${studentCode},
courseCode: ${courseCode},
isError: ${isError},
errorMessage: ${errorMessage}
    ''';
  }
}
