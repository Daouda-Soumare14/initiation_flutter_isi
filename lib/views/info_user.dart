import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:initiation_flutter/controllers/user_controller.dart';

class InfoUser extends StatelessWidget {
  InfoUser({super.key});

  // recuperation du controller
  //Récupère une instance existante du contrôleur pour accéder aux données stockées.
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infos User"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // reagir au modification en temps reel en utilisant Obx
              // pour ecoutee les changements de valeur et mettre a jour
              // automatiquement l'interface utilisateur
              Obx(() => Text(
                    "Email : ${userController.email.value}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Obx(() => Text(
                    "Nom: ${userController.name.value}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Obx(() => Text(
                    "Prenom: ${userController.prenom.value}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              // Text(
              //   "Email: ${userController.email.value}",
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Text(
              //   "Nom: ${userController.name.value}",
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Text(
              //   "Prenom: ${userController.prenom.value}",
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
