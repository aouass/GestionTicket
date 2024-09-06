import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListeTicket extends StatelessWidget {
  const ListeTicket({super.key});

  Future<void> _showTicketDetails(
      BuildContext context, DocumentSnapshot doc) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Détails du Ticket'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Titre: ${doc['titre'] ?? 'N/A'}'),
              Text('Catégorie: ${doc['categorie'] ?? 'N/A'}'),
              Text('Description: ${doc['description'] ?? 'N/A'}'),
              Text('Réponse: ${doc['reponse'] ?? 'N/A'}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditDialog(
      BuildContext context, DocumentSnapshot doc) async {
    final titleController = TextEditingController(text: doc['titre']);
    final categoryController = TextEditingController(text: doc['categorie']);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Modifier le Ticket'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Titre'),
              ),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Catégorie'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('tickets')
                    .doc(doc.id)
                    .update({
                  'titre': titleController.text,
                  'categorie': categoryController.text,
                });
                Navigator.of(context).pop();
              },
              child: const Text('Sauvegarder'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDeleteConfirmationDialog(
      BuildContext context, String docId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation de Suppression'),
          content: const Text('Êtes-vous sûr de vouloir supprimer ce ticket ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('tickets')
                    .doc(docId)
                    .delete();
                Navigator.of(context).pop();
              },
              child: const Text('Supprimer'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _createTicket(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Handle the case when user is not logged in
      return;
    }

    final titleController = TextEditingController();
    final categoryController = TextEditingController();
    final descriptionController = TextEditingController();
    final responseController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Créer un Ticket'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Titre'),
              ),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Catégorie'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: responseController,
                decoration: const InputDecoration(labelText: 'Réponse'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                final ticketData = {
                  'titre': titleController.text,
                  'categorie': categoryController.text,
                  'description': descriptionController.text,
                  'reponse': responseController.text,
                  'apprenant_id': user.uid,
                };

                await FirebaseFirestore.instance
                    .collection('tickets')
                    .add(ticketData);

                Navigator.of(context).pop();
              },
              child: const Text('Créer'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        body: Center(child: Text('Utilisateur non authentifié')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Tickets'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _createTicket(context),
          ),
        ],
      ),
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
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 1000,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('tickets')
                              .where('apprenant_id',
                                  isEqualTo:
                                      user.uid) // Filtrer par ID de l'apprenant
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }

                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return Center(
                                  child: Text('Aucun ticket trouvé.'));
                            }

                            return Column(
                              children: snapshot.data!.docs.map((doc) {
                                var data = doc.data() as Map<String, dynamic>;
                                return GestureDetector(
                                  onTap: () => _showTicketDetails(context, doc),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10,
                                        left: 10,
                                        right: 10,
                                        top: 15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFEE0E0),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 110,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child:
                                                                const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 4),
                                                              child: Text(
                                                                'Titre du Ticket :',
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
                                                            data['titre'] ??
                                                                'N/A',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10,
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 90,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15),
                                                            child: Text(
                                                              'Catégorie:',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      data['categorie'] ??
                                                          'N/A',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.edit_outlined,
                                                        color:
                                                            Color(0xFFF83758),
                                                      ),
                                                      onPressed: () =>
                                                          _showEditDialog(
                                                              context, doc),
                                                    ),
                                                    SizedBox(width: 10),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.delete_outline,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () =>
                                                          _showDeleteConfirmationDialog(
                                                              context, doc.id),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
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
