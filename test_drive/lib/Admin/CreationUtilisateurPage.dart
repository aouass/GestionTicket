import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/Admin/HomePageAdmin.dart';

class CreationUtilisateurPage extends StatelessWidget {
  const CreationUtilisateurPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        body: Center(child: Text('Utilisateur non authentifié')),
      );
    }

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Aucune donnée trouvée.'));
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>;

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 1),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFF83758),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: userData['photoUrl'] != null
                                ? NetworkImage(userData['photoUrl'])
                                : AssetImage('images/Profile.png')
                                    as ImageProvider,
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userData['role'] ?? 'Rôle inconnu',
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Salut, ${userData['prenom']} ${userData['nom']}',
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                          topRight: Radius.circular(30),
                        ),
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
                                              const HomePageAdmin(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: Colors.redAccent,
                                      size: 50,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 100),
                                const Text(
                                  "Création Utilisateur",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Prénom",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'prénom...',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  Text(
                                    "Nom",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'nom...',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'email...',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Rôle",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'rôle...',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Action à effectuer lors de la connexion
                                // Navigator.push(
                                // context,
                                // MaterialPageRoute(builder: (context) => const AccueilPage()),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF83758),
                                maximumSize: Size(200, 50),
                              ),
                              child: const Text(
                                'Créer',
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
