import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test_drive/Admin/HomePageAdmin.dart';

class TraitementPage extends StatefulWidget {
  const TraitementPage({super.key});

  @override
  _TraitementPageState createState() => _TraitementPageState();
}

class _TraitementPageState extends State<TraitementPage> {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categorieController = TextEditingController();
  final TextEditingController _reponseController = TextEditingController();

  // Fonction pour ajouter un ticket à Firestore
  Future<void> traiterTicket() async {
    if (_titreController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _categorieController.text.isNotEmpty &&
        _reponseController.text.isNotEmpty) {
      await FirebaseFirestore.instance.collection('tickets traités').add({
        'titre': _titreController.text,
        'description': _descriptionController.text,
        'categorie': _categorieController.text,
        'reponse': _reponseController.text,
        'date': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ticket Traité avec succès')),
      );

      // Clear the input fields
      _titreController.clear();
      _descriptionController.clear();
      _categorieController.clear();
      _reponseController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 1),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFF83758),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('images/Profile.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Formateur",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 12),
                            ),
                            Text(
                              "Salut, Saran",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 18),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Image.asset(
                    'images/Logos.png',
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePageAdmin()),
                                  );
                                },
                                icon: const Icon(
                                    Icons.arrow_circle_left_outlined,
                                    color: Colors.redAccent,
                                    size: 50),
                              ),
                            ),
                            const SizedBox(width: 100),
                            const Text(
                              "Traitement Ticket",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Titre",
                                  style: TextStyle(fontSize: 20)),
                              const SizedBox(height: 10),
                              TextField(
                                controller: _titreController,
                                decoration: const InputDecoration(
                                  labelText: 'Titre... ',
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text("Description",
                                  style: TextStyle(fontSize: 20)),
                              const SizedBox(height: 10),
                              TextField(
                                controller: _descriptionController,
                                decoration: const InputDecoration(
                                  labelText: 'Description... ',
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text("Categorie",
                                  style: TextStyle(fontSize: 20)),
                              const SizedBox(height: 10),
                              TextField(
                                controller: _categorieController,
                                decoration: const InputDecoration(
                                  labelText: 'Categorie... ',
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text("Reponse",
                                  style: TextStyle(fontSize: 20)),
                              const SizedBox(height: 10),
                              TextField(
                                controller: _reponseController,
                                decoration: const InputDecoration(
                                  labelText: 'Reponse... ',
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: traiterTicket,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF83758),
                            maximumSize: const Size(200, 50),
                          ),
                          child: const Text(
                            'Créer',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}
