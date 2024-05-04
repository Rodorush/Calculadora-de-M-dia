import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exercício Montagem GUI",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício Montagem GUI'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'TELA DE CADASTRO',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text('NOME:'),
              const SizedBox(height: 7),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite o nome'
                ),
              ),
              const SizedBox(height: 28),
              const Text('ENDEREÇO:'),
              const SizedBox(height: 7),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite o endereço',
                ),
              ),
              const SizedBox(height: 28),
              const Text('eMAIL:'),
              const SizedBox(height: 7),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite o email',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      _mostrarDialogo(context, 'Cancelar');
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4.0),
                                )
                            )
                        )
                    ),
                    child: const Text('CANCELAR',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      _mostrarDialogo(context, 'Salvar');
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4.0),
                                )
                            )
                        )
                    ),
                    child: const Text('SALVAR',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDialogo(BuildContext context, String acao) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Caixa de Diálogo'),
          content: Text('Pressionado botão $acao.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}