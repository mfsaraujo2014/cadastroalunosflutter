
import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/modules/course/data/course_create_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/course/data/course_list_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/course/data/course_repository_impl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CourseCreatePage extends StatelessWidget {
  final CourseCreateStore _courseCreateStore;

  CourseCreatePage({ required CourseListStore courseListStore})
      : _courseCreateStore = CourseCreateStore(CourseRepositoryImpl(), courseListStore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Curso'),
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
                onChanged: _courseCreateStore.setDescription,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ementa do Curso:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _courseCreateStore.setCourseProgram,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _courseCreateStore.createCourse();
                if (_courseCreateStore.hasError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erro: ${_courseCreateStore.error!}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Curso criado com sucesso!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.of(context).pop(); // Voltar para a página anterior
                }
              },
              child: Text('Criar Curso'),
            ),
          ],
        ),
      ),
    );
  }
}