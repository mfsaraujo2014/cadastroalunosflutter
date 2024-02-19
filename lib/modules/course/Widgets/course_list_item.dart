
import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/common/entities/course.dart';

class CourseListItem extends StatelessWidget {
  final Course course;

  const CourseListItem({required this.course});

  @override
  Widget build(BuildContext context) {
    bool isClassOpen = course.students == null || course.students!.length < 5;
    bool isClassClose = course.students != null && course.students!.length >= 10;
    return ListTile(
      title: Row(
        children: [
          Text('${course.code} - ${course.description}'),
          if (isClassOpen) ...{
            Container(
              margin: EdgeInsets.only(left: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                'Turma não fechada',
                style: TextStyle(color: Colors.red, fontSize: 9.0),
              ),
            ),
          } else if (isClassClose) ...{
            Container(
              margin: EdgeInsets.only(left: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                'Turma fechada',
                style: TextStyle(color: Colors.green, fontSize: 9.0),
              ),
            ),
          }
        ],
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Detalhes do Curso'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome: ${course.code}'),
                  Text('Código: ${course.description}'),
                  Text('Alunos Matriculados: '),
                  if (course.students != null) ...{
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: course.students!.map((student) {
                        return Text('${student.name}');
                      }).toList(),
                    ),
                  } else ...{
                    Text("Não há alunos matriculados no curso")
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