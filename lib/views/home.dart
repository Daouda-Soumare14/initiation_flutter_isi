import 'package:email_validator_flutter/email_validator_flutter.dart';
import 'package:flutter/material.dart';
import 'package:initiation_flutter/common/constants_color.dart';
import 'package:initiation_flutter/common/size_config.dart';
import 'package:initiation_flutter/views/info_user.dart';

class Home extends StatefulWidget {
  // on creer une route pour naviger facilement
  static const String routeNama = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final prenomcontroller = TextEditingController();
  final emailController = TextEditingController();

  // Appel dispose de l'objet TextEditingController lorsqu'on termine
  // de l'utitiser. cela garantit qu'on supprime toutes les ressources
  // utiliser par l'objet
  @override
  void dispose() {
    nameController.dispose();
    prenomcontroller.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        title: Text('Application'),
        // actions permet de prendre plusieurs icons
        actions: [Icon(Icons.add), Icon(Icons.notifications)],
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez remplir le champ email";
                  }
                  if (!EmailValidatorFlutter().validateEmail(value)) {
                    return "email non valide";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                  hintText:
                      "Entrer votre email", // indiquer l'utilisateur a l'interieur du champ
                  // helper: Text(
                  //     "Entrer votre email"), // indiquer l'utilisateur en bas du champ
                ),
              ),
              // permet de mettre de l'espace entre les champs
              SizedBox(
                height: 20,
              ),

              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez remplir le champ nom";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Name"),
                    hintText: "Entrer le nom"),
              ),
              // permet de mettre de l'espace entre les champs
              SizedBox(
                height: 20,
              ),

              TextFormField(
                controller: prenomcontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez remplir le champ prenom";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Prenom"),
                    hintText: "Entrer le prenom"),
              ),

              SizedBox(height: 20,),
              
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Affichage des donnees")));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InfoUser(
                                  nom: nameController.text,
                                  prenom: prenomcontroller.text,
                                  email: emailController.text,
                                )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Veuillez corriger les erreurs dans le formulaire",
                        style: TextStyle(
                          color: kWhiteColor,
                        ),
                      ),
                      backgroundColor: kErrorColor,
                    ));
                  }
                },
                child: const Text("Envoyer"),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          iconSize: 34.0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          onTap: (value) {},
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Acceuil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Parametre'),
            BottomNavigationBarItem(
                icon: Icon(Icons.group), label: 'Discussion'),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Acceuil'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Parametres'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Deconnection'),
            )
          ],
        ),
      ),
    );
  }

  saveActionBtn() {
    print("Salut");
  }
}
