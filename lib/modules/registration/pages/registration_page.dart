import 'package:flutter/material.dart';
import 'package:flutter_application_cadastro_alunos/modules/registration/data/registration_repository_impl.dart';
import 'package:flutter_application_cadastro_alunos/modules/registration/data/registration_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegistrationPage extends StatelessWidget {
  final RegistrationStore _registrationStore = RegistrationStore(RegistrationRepositoryImpl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrícula'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Código do Aluno:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _registrationStore.setStudentCode(int.parse(value));
                  }
                },
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Código do Curso:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Observer(
              builder: (_) => TextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _registrationStore.setCourseCode(int.parse(value));
                  }
                },
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _registrationStore.enroll(
                  studentCode: _registrationStore.studentCode,
                  courseCode: _registrationStore.courseCode,
                );
                if (_registrationStore.isError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erro: ${_registrationStore.errorMessage!}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Matrícula realizada com sucesso!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Text('Enviar Matrícula'),
            ),
          ],
        ),
      ),
    );
  }
}