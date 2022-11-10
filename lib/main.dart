import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegação!'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Center(
                // Apresentação de valor
                child: Text(
                  'Valor: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Botão para navegação
            ElevatedButton(
              onPressed: () async {
                // final result = await Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return DataScreen();
                // }));

                final result = await Get.to(() => DataScreen());

                print(result);
              },
              child: const Text('Segunda tela'),
            ),
          ],
        ),
      ),
    );
  }
}

class DataScreen extends StatelessWidget {
  DataScreen({Key? key}) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Definição de dado'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de definição de valor
            TextField(
              controller: textController,
            ),

            // Espaçamento
            const SizedBox(height: 10),

            // Botão para voltar passando o valor
            ElevatedButton(
              onPressed: () {
                final value = textController.text;

                // Navigator.of(context).pop(value);

                Get.back(result: value);
              },
              child: const Text('Retornar'),
            ),
          ],
        ),
      ),
    );
  }
}
