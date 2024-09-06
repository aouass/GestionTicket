import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'AccueilPage.dart';

class CreationTicket extends StatefulWidget {
  const CreationTicket({super.key});

  @override
  State<CreationTicket> createState() => _CreationTicketState();
}

class _CreationTicketState extends State<CreationTicket> {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categorieController = TextEditingController();

  // Fonction pour ajouter un ticket à Firestore
  Future<void> _addTicket() async {
    final String titre = _titreController.text;
    final String description = _descriptionController.text;
    final String categorie = _categorieController.text;

    if (titre.isNotEmpty && description.isNotEmpty && categorie.isNotEmpty) {
      try {
        await FirebaseFirestore.instance.collection('tickets').add({
          'titre': titre,
          'description': description,
          'categorie': categorie,
          'dateCreation': DateTime.now(),
        });
        _showSuccessDialog(); // Affiche le dialogue de succès
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs.')),
      );
    }
  }

  // Fonction pour afficher le dialogue de succès
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/pop.png', // Remplace par l'image que tu veux afficher
                  height: 60,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Ticket Soumis avec succès",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
                        radius: 30,
                        backgroundImage: AssetImage('images/Profile.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Apprenant",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 10),
                          ),
                          Text(
                            "Salut , Aoua Sow",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    'images/Logos.png',
                    width: 70,
                    height: 70,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
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
                                          const AccueilPage()),
                                );
                              },
                              icon: const Icon(Icons.arrow_circle_left_outlined,
                                  color: Colors.redAccent, size: 50),
                            ),
                          ),
                          const SizedBox(width: 100),
                          const Text(
                            "Creation Ticket",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          const Text(
                            "Titre",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _titreController,
                            decoration: const InputDecoration(
                              labelText: 'Titre... ',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Description",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _descriptionController,
                            decoration: const InputDecoration(
                              labelText: 'Description... ',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Catégorie",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _categorieController,
                            decoration: const InputDecoration(
                              labelText: 'Catégorie... ',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed:
                            _addTicket, // Appelle la fonction pour ajouter un ticket
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF83758),
                          maximumSize: const Size(200, 50),
                        ),
                        child: const Text(
                          'Soumettre',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
