import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test_drive/Admin/HomePageAdmin.dart';
import 'package:test_drive/Admin/ProfilePageAdmin.dart';
import 'package:test_drive/Admin/TicketPageAdmin.dart';
import 'package:test_drive/Admin/UserPage.dart';
import 'package:test_drive/Formateur/HomePageFormateur.dart';
import 'package:test_drive/Formateur/ListeTicketFormateur.dart';
import 'package:test_drive/Formateur/NotificationFormateur.dart';
import 'package:test_drive/Pages/AccueilPage.dart'; // Pour Apprenant
import 'package:test_drive/Pages/ChatPage1.dart';
import 'package:test_drive/Pages/ListeTicket.dart';
// import 'package:test_drive/Pages/HomePageAdmin.dart'; // Pour Administrateur
// import 'package:test_drive/Pages/HomePageFormateur.dart'; // Pour Formateur
import 'package:test_drive/Pages/notificationPage.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  // Index pour suivre l'onglet actif
  int _selectedIndex = 0;

  // Rôle de l'utilisateur
  String? userRole;

  // Liste des pages par rôle
  final List<Widget> apprenantPages = [
    const AccueilPage(), // Page d'accueil Apprenant
    const Notificationpage(),
    const Chatpage1(),
    const ListeTicket(),
  ];

  final List<Widget> formateurPages = [
    const HomepageFormateur(), // Page d'accueil Formateur
    const Notificationformateur(),
    const ListeTicketFormateur(),
  ];

  final List<Widget> adminPages = [
    const HomePageAdmin(), // Page d'accueil Admin
    const ProfilePageAdmin(),
    const UserPage(),
    const TicketPageAdmin(),
  ];

  @override
  void initState() {
    super.initState();
    _getUserRole(); // Appel pour récupérer le rôle de l'utilisateur
  }

  // Fonction pour récupérer le rôle de l'utilisateur connecté depuis Firebase
  Future<void> _getUserRole() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection(
              'Users') // Assurez-vous que votre collection d'utilisateurs s'appelle 'Users'
          .doc(user.uid)
          .get();

      setState(() {
        userRole = userDoc['role']; // Récupère le champ 'role' de Firestore
      });
    }
  }

  // Méthode pour gérer le changement d'onglet
  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index; // Met à jour l'index de l'onglet actif
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> selectedPages;

    // Sélectionner les pages en fonction du rôle de l'utilisateur
    if (userRole == 'Apprenant') {
      selectedPages = apprenantPages;
    } else if (userRole == 'Formateur') {
      selectedPages = formateurPages;
    } else if (userRole == 'Administrateur') {
      selectedPages = adminPages;
    } else {
      selectedPages =
          apprenantPages; // Valeur par défaut si le rôle n'est pas défini
    }

    return Scaffold(
      // Affiche la page correspondant à l'onglet actif
      body: selectedPages[_selectedIndex],

      // Barre de navigation en bas
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            color: const Color(0xFFC4C4C4), // Couleur des icônes inactives
            activeColor: const Color(0xFFFFFFFF), // Couleur des icônes actives
            tabBackgroundColor:
                const Color(0xFFF83758), // Couleur de fond de l'onglet actif
            padding: const EdgeInsets.all(16), // Padding autour des icônes
            gap: 8, // Espace entre les icônes et les labels
            onTabChange:
                _onTabChange, // Fonction appelée lorsque l'utilisateur change d'onglet
            tabs: [
              if (userRole == 'Apprenant')
                const GButton(
                  icon: Icons.home, // Icône de l'onglet Accueil Apprenant
                  text: 'Accueil',
                ),
              if (userRole == 'Formateur')
                const GButton(
                  icon: Icons.school, // Icône pour Formateur
                  text: 'Home Formateur',
                ),
              if (userRole == 'Administrateur')
                const GButton(
                  icon: Icons.admin_panel_settings, // Icône pour Admin
                  text: 'Home Admin',
                ),
              const GButton(
                icon: Icons.notifications_outlined, // Icône des notifications
                text: 'Notification',
              ),
              const GButton(
                icon: Icons.message_rounded, // Icône des messages
                text: 'Message',
              ),
              const GButton(
                icon: Icons.assignment_add, // Icône des tickets
                text: 'Tickets',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
