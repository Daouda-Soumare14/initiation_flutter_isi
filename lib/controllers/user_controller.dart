import 'package:get/get.dart';

class UserController extends GetxController {
  // les variable reactive 
  // cela veux dire que toute modification de leur valeur peut etre 
  // ecoutee et refletee immediatement dans l'interface utilisateur
  var name = ''.obs;
  var prenom = ''.obs;
  var email = ''.obs;

  // une methode qui permet de mettre a jour les donnees
  void updateUserInfo(
      {required String newName, required String newPrenom, required String NewEmail}) {
    name.value = newName;
    prenom.value = newPrenom;
    email.value = NewEmail;
  }
}
