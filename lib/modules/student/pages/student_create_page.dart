
import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_create_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_list_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_repository_impl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StudentCreatePage extends StatelessWidget {
  final StudentCreateStore _studentCreateStore;

  StudentCreatePage({ required StudentListStore studentListStore})
      : _studentCreateStore = StudentCreateStore(StudentRepositoryImpl(), studentListStore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Estudante'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome do Estudante:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: _studentCreateStore.setName,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _studentCreateStore.createStudent();
                if (_studentCreateStore.hasError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erro: ${_studentCreateStore.error!}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Aluno criado com sucesso!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.of(context).pop(); // Voltar para a página anterior
                }
              },
              child: Text('Adicionar Aluno'),
            ),
          ],
        ),
      ),
    );
  }
}