// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentCreateStore on _StudentCreateStore, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_StudentCreateStore.hasError'))
          .value;

  late final _$nameAtom =
      Atom(name: '_StudentCreateStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_StudentCreateStore.isLoading', context: context);

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
      Atom(name: '_StudentCreateStore.error', context: context);

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

  late final _$createStudentAsyncAction =
      AsyncAction('_StudentCreateStore.createStudent', context: context);

  @override
  Future<void> createStudent() {
    return _$createStudentAsyncAction.run(() => super.createStudent());
  }

  late final _$_StudentCreateStoreActionController =
      ActionController(name: '_StudentCreateStore', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_StudentCreateStoreActionController.startAction(
        name: '_StudentCreateStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_StudentCreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
isLoading: ${isLoading},
error: ${error},
hasError: ${hasError}
    ''';
  }
}
