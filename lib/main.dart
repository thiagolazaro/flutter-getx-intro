import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  String definedValue = '';

  @override
  Widget build(BuildContext context) {
    print('Contruiu');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Valor
            Text('Valor definido: $definedValue'),

            // Campo
            TextField(
              controller: textController,
            ),

            // Botão
            ElevatedButton(
              onPressed: () {
                String value = textController.text;

                setState(() {
                  definedValue = value;
                });
              },
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
