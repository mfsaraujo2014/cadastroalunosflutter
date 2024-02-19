import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';

class StudentListItem extends StatelessWidget {
  final Student student;

  const StudentListItem({required this.student});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${student.code} - ${student.name}'),
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
                  Text('Nome: ${student.code}'),
                  Text('Código: ${student.name}'),
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