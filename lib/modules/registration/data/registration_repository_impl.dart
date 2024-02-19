import 'dart:convert';
import 'package:flutter_application_cadastro_alunos/common/entities/registration.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_application_cadastro_alunos/common/repositories/registration_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final String baseUrl = 'http://localhost:9001';

  @override
  Future<String?> createRegistration(int studentCode, int courseCode) async {
    final url = Uri.parse('$baseUrl/enrollments');
    final Map<String, dynamic> data = {
      'studentcode': studentCode,
      'coursecode': courseCode,
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Matrícula realizada com sucesso');
      return null;
    } else {
      final responseBody = jsonDecode(response.body);
      final errorMessage = responseBody['erro'] ?? response.body;
      return errorMessage;
    }
  }
}