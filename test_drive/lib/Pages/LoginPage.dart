import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/Role/navigation_bar.dart';
// import 'package:test_drive/Pages/HomePageAdmin.dart';
// import 'package:test_drive/Pages/HomePageFormateur.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  Future<void> loginUser() async {
    try {
      // Connexion via Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Récupérer l'ID de l'utilisateur connecté
      String userId = userCredential.user?.uid ?? '';

      // Récupérer les informations de l'utilisateur dans Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();

      // if (userDoc.exists) {
      // Récupérer le rôle de l'utilisateur
      // String userRole = userDoc['role'];

      // Redirection en fonction du rôle
      // if (userRole == 'Apprenant') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyNavigationBar()),
      );
      // }
      // }
      // else {
      //   setState(() {
      //     _errorMessage =
      //         "Utilisateur non trouvé. Veuillez vérifier vos informations.";
      //   });
      // }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? 'Une erreur est survenue';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Erreur inattendue: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenue!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Nom d’utilisateur ou Email',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(
                    243, 243, 243, 243), // Couleur de fond du champ
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
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
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Implémenter la fonctionnalité "Mot de passe oublié"
              },
              child: const Text(
                'Mot de passe oublié ?',
                style: TextStyle(
                  color: Color(0xFFF83758),
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginUser,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF83758), // Couleur du bouton
                maximumSize: const Size(200, 50),
              ),
              child: const Text(
                'Se Connecter',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
