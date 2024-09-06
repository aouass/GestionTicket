import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/Pages/LoginPage.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // Déclaration des contrôleurs pour les champs de texte
  final TextEditingController Nom = TextEditingController();
  final TextEditingController Prenom = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController Mdp = TextEditingController();

  // Déclaration du rôle sélectionné
  String selectedRole = 'Apprenant';

  // Liste des rôles
  final List<String> roles = ['Apprenant', 'Formateur', 'Administrateur'];

  @override
  Widget build(BuildContext context) {
    // Fonction pour créer un compte utilisateur
    void CreerCompte() async {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: Email.text,
          password: Mdp.text,
        );

        String userId = userCredential.user?.uid ?? '';

        await FirebaseFirestore.instance.collection('Users').doc(userId).set({
          'nom': Nom.text,
          'prenom': Prenom.text,
          'email': Email.text,
          'role': selectedRole,
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } catch (e) {
        // Gérer l'erreur
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: ${e.toString()}')),
        );
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Créer un compte!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: Nom,
              decoration: const InputDecoration(
                labelText: 'Nom',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(
                    243, 243, 243, 243), // Couleur de fond du champ
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: Prenom,
              decoration: const InputDecoration(
                labelText: 'Prénom',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(
                    243, 243, 243, 243), // Couleur de fond du champ
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: Email,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(
                    243, 243, 243, 243), // Couleur de fond du champ
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: Mdp,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mot de Passe',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(
                    243, 243, 243, 243), // Couleur de fond du champ
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedRole,
              decoration: InputDecoration(
                labelText: 'Rôle',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(
                    243, 243, 243, 243), // Couleur de fond du champ
              ),
              items: roles.map((role) {
                return DropdownMenuItem(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: CreerCompte,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF83758), // Couleur du bouton
                maximumSize: Size(200, 50),
              ),
              child: const Text(
                'Créer Un Compte',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "J’ai déjà un Compte.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigue vers la page de connexion
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const LoginPage()), // Remplace par la page de connexion appropriée
                    );
                  },
                  child: const Text(
                    "Se Connecter",
                    style: TextStyle(
                      color: Color(0xFFF83758),
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
