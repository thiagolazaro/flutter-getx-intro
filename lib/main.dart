import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro/value_controller.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final textController = TextEditingController();

  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    print('Criou arvore');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Valor
          GetX<ValueController>(
            init: valueController, // Atenção
            builder: (ctrl) {
              return Text('Valor definido: ${ctrl.definedValue}');
            },
          ),

          // Campo
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: TextField(
              controller: textController,
            ),
          ),

          // Botão
          GetX<ValueController>(
              init: valueController,
              builder: (ctrl) {
                return ctrl.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          String value = textController.text;

                          ctrl.setValue(value);
                        },
                        child: const Text('Confirmar'),
                      );
              }),
        ]),
      ),
    );
  }
}
