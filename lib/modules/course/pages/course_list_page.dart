
import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/modules/course/Widgets/course_list_item.dart';
import 'package:flutter_application_cadastro_alunos/modules/course/data/course_list_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/course/data/course_repository_impl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CourseListPage extends StatelessWidget {
  final CourseListStore _courseListStore = CourseListStore(CourseRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    _courseListStore.fetchCourses();
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Cursos'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar Cursos...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _courseListStore.setSearchTerm,
            ),
          ),
        ),
      ),
      body: Observer(
        builder: (context) {
          if (_courseListStore.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_courseListStore.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Erro ao carregar os Cursos'),
                  SizedBox(height: 10),
                  Text('Detalhes do erro: ${_courseListStore.error}'),
                ],
              ),
            );
          } else {
            final courses = _courseListStore.courses;
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return CourseListItem(course: course);
              },
            );
          }
        },
      ),
    );
  }
}