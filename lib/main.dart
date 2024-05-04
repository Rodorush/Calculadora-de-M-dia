import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tarefa Final D2DM1 2024.1",
      home: AverageCalculator(),
    );
  }
}

class AverageCalculator extends StatefulWidget {
  @override
  _AverageCalculatorState createState() => _AverageCalculatorState();
}

class _AverageCalculatorState extends State<AverageCalculator> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _grade1Controller = TextEditingController();
  final TextEditingController _grade2Controller = TextEditingController();
  final TextEditingController _grade3Controller = TextEditingController();

  String name = '';
  String email = '';
  double? grade1;
  double? grade2;
  double? grade3;
  String average = '';

  void _calculateAverage() {
    grade1 = double.tryParse(_grade1Controller.text) ?? 0;
    grade2 = double.tryParse(_grade2Controller.text) ?? 0;
    grade3 = double.tryParse(_grade3Controller.text) ?? 0;
    double avg = ((grade1 ?? 0) + (grade2 ?? 0) + (grade3 ?? 0)) / 3;

    setState(() {
      name = _nameController.text;
      email = _emailController.text;
      average = avg.toStringAsFixed(2);
    });
  }

  void _clearFields() {
    _nameController.clear();
    _emailController.clear();
    _grade1Controller.clear();
    _grade2Controller.clear();
    _grade3Controller.clear();

    setState(() {
      name = '';
      email = '';
      grade1 = null;
      grade2 = null;
      grade3 = null;
      average = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefa Final D2DM1 2024.1'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'CALCULADORA DE MÉDIA',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'NOME',
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'EMAIL',
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _grade1Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nota 1',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: _grade2Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nota 2',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: _grade3Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nota 3',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _calculateAverage,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                child: const Text(
                  'CALCULA MÉDIA',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Center(child: Text('RESULTADO', style: TextStyle(fontSize: 24))),
            const SizedBox(height: 7),
            Text('Nome: $name', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 7),
            Text('Email: $email', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 7),
            Text('Notas: ${grade1 ?? ''} - ${grade2 ?? ''} - ${grade3 ?? ''}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 7),
            Text('Média: $average', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _clearFields,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                child: const Text(
                  'APAGA OS CAMPOS',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}