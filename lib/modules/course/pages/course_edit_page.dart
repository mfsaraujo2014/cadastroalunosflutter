
import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/common/entities/course.dart';
import 'package:flutter_application_cadastro_alunos/modules/course/data/course_edit_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/course/data/course_list_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/course/data/course_repository_impl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CourseEditPage extends StatelessWidget {
  final Course course;
  final CourseEditStore _courseEditStore;

  CourseEditPage({required this.course, required CourseListStore courseListStore})
      : _courseEditStore = CourseEditStore(CourseRepositoryImpl(), courseListStore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Curso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Descrição do Curso:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Observer(
              builder: (_) => TextFormField(
                initialValue: _courseEditStore.description = course.description,
                onChanged: (newValue) => _courseEditStore.setDescription(newValue),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ementa do Curso:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Observer(
              builder: (_) => TextFormField(
                initialValue: _courseEditStore.courseprogram = course.courseprogram,
                onChanged: (newValue) => _courseEditStore.setCourseProgram(newValue),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_courseEditStore.description != course.description || _courseEditStore.courseprogram != course.courseprogram) {
                  await _courseEditStore.updateCourse(course);
                  if (_courseEditStore.hasError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Erro: ${_courseEditStore.error!}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Curso atualizado com sucesso!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Nenhuma alteração foi feita.'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                    Navigator.of(context).pop();
                }
              },
              child: Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}