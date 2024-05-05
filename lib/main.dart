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
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _grade1Controller.text.isEmpty ||
        _grade2Controller.text.isEmpty ||
        _grade3Controller.text.isEmpty) {
      _showWarningDialog("Todos os campos devem ser preenchidos.");
      return;
    }

    if (!(_isGradeValid(_grade1Controller.text) &&
        _isGradeValid(_grade2Controller.text) &&
        _isGradeValid(_grade3Controller.text))) {
      _showWarningDialog("Nota inválida");
      return;
    }

    grade1 = double.parse(_grade1Controller.text);
    grade2 = double.parse(_grade2Controller.text);
    grade3 = double.parse(_grade3Controller.text);
    double avg = (grade1! + grade2! + grade3!) / 3;

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

    name = '';
    email = '';
    grade1 = null;
    grade2 = null;
    grade3 = null;

    setState(() {
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
            const Center(
                child: Text('RESULTADO',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text('Nome: ', style: TextStyle(fontSize: 24)),
                Text(name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 7),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              const Text('Email: ', style: TextStyle(fontSize: 24)),
              Text(email,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold))
            ]),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text('Notas: ', style: TextStyle(fontSize: 24)),
                Text(
                  '${grade1 ?? ''} - ${grade2 ?? ''} - ${grade3 ?? ''}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text('Média: ', style: TextStyle(fontSize: 24)),
                Text(average,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
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

  void _showWarningDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Aviso"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  bool _isGradeValid(String value) {
    double? grade = double.tryParse(value);
    return grade != null && grade >= 0 && grade <= 10;
  }
}
