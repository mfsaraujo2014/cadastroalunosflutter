import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_repository_impl.dart';

class StudentSearchDelegate extends SearchDelegate<Student> {
    final StudentRepositoryImpl _studentRepository = StudentRepositoryImpl();


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  return FutureBuilder<List<Student>>(
    future: _studentRepository.getAllStudents(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('Erro ao carregar os alunos'),
        );
      } else {
        final List<Student> students = snapshot.data!;
        final searchQuery = query.toLowerCase();
        final List<Student> filteredStudents = students.where((student) {
          final nome = student.name.toLowerCase();
          return nome.contains(searchQuery);
        }).toList();

        return ListView.builder(
          itemCount: filteredStudents.length,
          itemBuilder: (context, index) {
            final student = filteredStudents[index];
            return ListTile(
              title: Text(student.code.toString()),
              subtitle: Text(student.name),
              onTap: () {
                close(context, student);
              },
            );
          },
        );
      }
    },
  );
}

  @override
  Widget buildResults(BuildContext context) {
    return Container(); 
  }

  @override
Widget buildLeading(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      final defaultStudent = Student(name: 'Nenhum aluno selecionado', code: 0);
      close(context, defaultStudent);
    },
  );
}
}