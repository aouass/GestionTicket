import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/Pages/CreationTicket.dart';
import 'package:test_drive/Pages/LoginPage.dart'; // Importez votre page de connexion

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  Future<Map<String, dynamic>> _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return {};
    }

    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .get();

    return userDoc.data() as Map<String, dynamic>;
  }

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LoginPage()), // Remplacez `LoginPage` par le nom de votre page de connexion
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucune information utilisateur.'));
          }

          var userData = snapshot.data!;
          String role = userData['role'] ?? 'Rôle inconnu';
          String nom = userData['nom'] ?? 'Nom inconnu';
          String prenom = userData['prenom'] ?? 'Prenom inconnu';

          return Container(
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('images/Profile.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  role,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 12),
                                ),
                                Text(
                                  "Salut, $nom  $prenom",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 18,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.logout,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  onPressed: () => _logout(context),
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
                              topRight: Radius.circular(30))),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFEE0E0),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color(0xFFE9E4E4),
                                              blurRadius: 20,
                                              offset: Offset(0, 10))
                                        ]),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(0),
                                          child: const TextField(
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.search),
                                                hintText: "Historique Ticket",
                                                hintStyle: TextStyle(
                                                    color: Color(0xFF000000)),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 60),
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        const Text("Soumettre un ticket"),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CreationTicket()),
                                            );
                                          },
                                          icon: const Icon(
                                              Icons.add_circle_rounded,
                                              color: Colors.redAccent,
                                              size: 50),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                const Text("Historiques des Tickets"),
                                StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('tickets')
                                      .where('apprenant_id',
                                          isEqualTo: FirebaseAuth
                                              .instance
                                              .currentUser
                                              ?.uid) // Filtrer par ID de l'apprenant
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }

                                    if (snapshot.hasError) {
                                      return Center(
                                          child: Text(
                                              'Erreur: ${snapshot.error}'));
                                    }

                                    if (!snapshot.hasData ||
                                        snapshot.data!.docs.isEmpty) {
                                      return Center(
                                          child: Text('Aucun ticket trouvé.'));
                                    }

                                    return Column(
                                      children: snapshot.data!.docs.map((doc) {
                                        var data =
                                            doc.data() as Map<String, dynamic>;
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10,
                                              left: 10,
                                              right: 10,
                                              top: 15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFEE0E0),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  width: 110,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                4),
                                                                    child: Text(
                                                                      'Titre du Ticket :',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                  data['titre'] ??
                                                                      'N/A',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    color: Colors.white,
                                                    thickness: 2.0,
                                                  ),
                                                  const SizedBox(height: 1),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 90,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child:
                                                                    const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              15),
                                                                  child: Text(
                                                                    'Catégorie:',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                data['categorie'] ??
                                                                    'N/A',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const Row(
                                                        children: [
                                                          Icon(
                                                            Icons.edit_outlined,
                                                            color: Color(
                                                                0xFFF83758),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Icon(
                                                            Icons
                                                                .delete_outline,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  },
                                ),
                              ],
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
