import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_list_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_repository_impl.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/widgets/student_list_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StudentListPage extends StatelessWidget {
  final StudentListStore _studentListStore = StudentListStore(StudentRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    _studentListStore.fetchStudents();
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Alunos'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar alunos...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _studentListStore.setSearchTerm,
            ),
          ),
        ),
      ),
      body: Observer(
        builder: (context) {
          if (_studentListStore.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_studentListStore.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Erro ao carregar os alunos'),
                  SizedBox(height: 10),
                  Text('Detalhes do erro: ${_studentListStore.error}'),
                ],
              ),
            );
          } else {
            final students = _studentListStore.students;
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return StudentListItem(student: student);
              },
            );
          }
        },
      ),
    );
  }
}