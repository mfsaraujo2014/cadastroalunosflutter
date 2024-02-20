import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_list_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/pages/student_edit_page.dart';

class StudentListItem extends StatelessWidget {
  final Student student;
  final StudentListStore studentListStore;

  const StudentListItem({required this.student, required this.studentListStore});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${student.code} - ${student.name}'),
      trailing: IconButton(
        icon: Icon(Icons.edit, color: Colors.purple,),
        onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentEditPage(student: student, studentListStore: studentListStore),
                        ),
                      );
                    },
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Detalhes do Aluno'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Código: ${student.code}'),
                  Text('Nome: ${student.name}'),
                  Text('Cursos do aluno: '),
                  if (student.courses != null) ...{
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: student.courses!.map((course) {
                        return Text('${course.description}');
                      }).toList(),
                    ),
                  } else ...{
                    Text("O aluno não está matriculado em nenhum curso!")
                  }
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Fechar'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}