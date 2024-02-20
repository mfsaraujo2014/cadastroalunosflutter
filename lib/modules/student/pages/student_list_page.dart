import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_list_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_repository_impl.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/pages/student_create_page.dart';
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
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentCreatePage(studentListStore: _studentListStore),
                  ),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Criar Aluno'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                ),
              ),
            ),
          ),
        ],
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
                return StudentListItem(student: student, studentListStore: _studentListStore,);
              },
            );
          }
        },
      ),
    );
  }
}