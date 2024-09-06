import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/Pages/AccueilPage.dart';

class ProfilePageAdmin extends StatefulWidget {
  const ProfilePageAdmin({super.key});

  @override
  _ProfilePageAdminState createState() => _ProfilePageAdminState();
}

class _ProfilePageAdminState extends State<ProfilePageAdmin> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  User? _user;
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _getUserDetails();
  }

  Future<void> _getUserDetails() async {
    if (_user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('Users').doc(_user!.uid).get();

      if (userDoc.exists) {
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;

        setState(() {
          _prenomController.text = userData?['prenom'] ?? '';
          _nomController.text = userData?['nom'] ?? '';
          _emailController.text = _user!.email ?? '';
        });
      }
    }
  }

  Future<void> _updateUserProfile() async {
    if (_user != null) {
      await _firestore.collection('Users').doc(_user!.uid).update({
        'prenom': _prenomController.text,
        'nom': _nomController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profil mis à jour avec succès')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 1200,
            child: Padding(
              padding: const EdgeInsets.only(top: 1, left: 40, right: 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AccueilPage()),
                              );
                            },
                            icon: const Icon(Icons.arrow_back_ios,
                                color: Color.fromARGB(255, 0, 0, 0), size: 30),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      const Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('images/Group.png'), // Image ici
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  const Text(
                    'Informations Personnelles',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Prenom',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _prenomController,
                        decoration: const InputDecoration(
                          labelText: 'Prenom',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(243, 243, 243, 243),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Nom',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _nomController,
                        decoration: const InputDecoration(
                          labelText: 'Nom',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(243, 243, 243, 243),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _emailController,
                        readOnly: false, // L'email ne peut pas être modifié ici
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(243, 243, 243, 243),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _updateUserProfile,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF83758),
                        maximumSize: Size(200, 50)),
                    child: const Text('Modifier Profile',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
