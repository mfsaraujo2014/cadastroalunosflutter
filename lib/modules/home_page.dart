import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(
              onPressed: () {
                Modular.to.pushNamed('/students');
              },
              icon: Icons.person,
              label: 'Alunos',
            ),
            _buildButton(
              onPressed: () {
                Modular.to.pushNamed('/courses');
              },
              icon: Icons.school,
              label: 'Cursos',
            ),
            _buildButton(
              onPressed: () {
                Modular.to.pushNamed('/registration');
              },
              icon: Icons.assignment,
              label: 'Matrícula',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
  }) {
    return SizedBox(
      width: 300,
      height: 300,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100.0), // Ícone
            SizedBox(height: 8.0),
            Text(label, style: TextStyle(fontSize: 20.0)), // Texto
          ],
        ),
      ),
    );
  }
}