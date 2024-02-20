

import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/common/entities/student.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_edit_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_list_store.dart';
import 'package:flutter_application_cadastro_alunos/modules/student/data/student_repository_impl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StudentEditPage extends StatelessWidget {
  final Student student;
  final StudentEditStore _studentEditStore;

  StudentEditPage({required this.student, required StudentListStore studentListStore})
      : _studentEditStore = StudentEditStore(StudentRepositoryImpl(), studentListStore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Estudante'),
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
                initialValue: student.name,
                onChanged: _studentEditStore.setName,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _studentEditStore.updateStudent(student);
                if (_studentEditStore.hasError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erro: ${_studentEditStore.error!}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Estudante atualizado com sucesso!'),
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