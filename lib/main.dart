import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro/user_controller.dart';

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

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  TextStyle commonStyle() => const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      );

  final userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Apresentação do nome
            Obx(() => Text(
                  'Nome: ${userController.user.value.name}',
                  style: commonStyle(),
                )),

            // Apresentação da idade
            Obx(() => Text(
                  'idade: ${userController.user.value.age}',
                  style: commonStyle(),
                )),

            const Divider(
              thickness: 1.5,
              color: Colors.blue,
              height: 20,
            ),

            // Espaçamento
            const SizedBox(height: 20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Campo de Nome
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                ),

                // Botão para salvar a nome
                ElevatedButton(
                  onPressed: () {
                    userController.setUserName(nameController.text);
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),

            // Espaçamento
            const SizedBox(height: 10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Campo de Idade
                Expanded(
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      labelText: 'Idade',
                    ),
                  ),
                ),

                // Botão para salvar a idade
                ElevatedButton(
                  onPressed: () {
                    userController.setUserAge(int.parse(ageController.text));
                  },
                  child: const Text('Salvar'),
                ),

                // Espaçamento
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
