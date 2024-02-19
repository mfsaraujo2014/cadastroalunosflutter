// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentListStore on _StudentListStore, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_StudentListStore.hasError'))
          .value;

  late final _$studentsAtom =
      Atom(name: '_StudentListStore.students', context: context);

  @override
  ObservableList<Student> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(ObservableList<Student> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  late final _$searchTermAtom =
      Atom(name: '_StudentListStore.searchTerm', context: context);

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
      Atom(name: '_StudentListStore.isLoading', context: context);

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
      Atom(name: '_StudentListStore.error', context: context);

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

  late final _$fetchStudentsAsyncAction =
      AsyncAction('_StudentListStore.fetchStudents', context: context);

  @override
  Future<void> fetchStudents({String searchTerm = ''}) {
    return _$fetchStudentsAsyncAction
        .run(() => super.fetchStudents(searchTerm: searchTerm));
  }

  late final _$_StudentListStoreActionController =
      ActionController(name: '_StudentListStore', context: context);

  @override
  void setSearchTerm(String term) {
    final _$actionInfo = _$_StudentListStoreActionController.startAction(
        name: '_StudentListStore.setSearchTerm');
    try {
      return super.setSearchTerm(term);
    } finally {
      _$_StudentListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
students: ${students},
searchTerm: ${searchTerm},
isLoading: ${isLoading},
error: ${error},
hasError: ${hasError}
    ''';
  }
}
