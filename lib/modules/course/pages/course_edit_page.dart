
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
                initialValue: course.description,
                onChanged: _courseEditStore.setDescription,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ementa do Curso:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Observer(
              builder: (_) => TextFormField(
                initialValue: course.courseprogram,
                onChanged: _courseEditStore.setCourseProgram,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
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
                  Navigator.of(context).pop(); // Voltar para a página anterior
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