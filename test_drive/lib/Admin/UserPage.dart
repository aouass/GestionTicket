import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'HomePageAdmin.dart';


class UserPage extends StatelessWidget {
  const UserPage({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFFF83758),
        title: Row(
          children: [
             IconButton(onPressed: () { 
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>const HomePageAdmin()),); },
                      icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFFFFFFF), size:30),
                      ),
            const SizedBox(width: 10),
            const Text('Liste des Utlisateurs', style: TextStyle(color: Colors.white70)),
          ],
        ),

    ),


     body: SingleChildScrollView(
       child: Container(
        child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                      
           Column(
            children: [
        
            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 10,right: 10,top: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFEE0E0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Première ligne avec trois textes
                      Padding(
                        
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 110,
                              decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Text(
                                  'Nom et Prenom',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 60,
                              decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  'Role',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
            // const SizedBox(height: 8.0), // Espacement entre les lignes
            // Ligne séparatrice
            const Divider(
              color: Colors.white, // Couleur de la ligne séparatrice
              thickness: 2.0, // Épaisseur de la ligne
            ),
            const SizedBox(height: 1), // Espacement après la ligne séparatrice
            // Deuxième ligne avec trois textes et deux icônes
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Text(
                          'Sow Aoua',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'sowaoua@gmail.com',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
       
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'Apprenant',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.edit_outlined, // Icône de crayon pour l'édition
                      color: Color(0xFFF83758),
                    ),
                    SizedBox(width: 10), // Espacement entre les icônes
                    Icon(
                      Icons.delete_outline, // Icône de suppression
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
       ),
       
       Padding(
         padding: const EdgeInsets.all(10),
         child: Container(
           decoration: BoxDecoration(
        color: Color(0xFFFEE0E0),
        borderRadius: BorderRadius.circular(20),
           ),
           child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Première ligne avec trois textes
            Padding(
              
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        'Nom et Prenom',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Role',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 8.0), // Espacement entre les lignes
            // Ligne séparatrice
            const Divider(
              color: Colors.white, // Couleur de la ligne séparatrice
              thickness: 2.0, // Épaisseur de la ligne
            ),
            const SizedBox(height: 1), // Espacement après la ligne séparatrice
            // Deuxième ligne avec trois textes et deux icônes
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Text(
                          'Sow Aoua',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'sowaoua@gmail.com',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
       
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'Apprenant',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.edit_outlined, // Icône de crayon pour l'édition
                      color: Color(0xFFF83758),
                    ),
                    SizedBox(width: 10), // Espacement entre les icônes
                    Icon(
                      Icons.delete_outline, // Icône de suppression
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
       ),
       
       Padding(
         padding: const EdgeInsets.all(10),
         child: Container(
           decoration: BoxDecoration(
        color: Color(0xFFFEE0E0),
        borderRadius: BorderRadius.circular(20),
           ),
           child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Première ligne avec trois textes
            Padding(
              
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        'Nom et Prenom',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Role',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 8.0), // Espacement entre les lignes
            // Ligne séparatrice
            const Divider(
              color: Colors.white, // Couleur de la ligne séparatrice
              thickness: 2.0, // Épaisseur de la ligne
            ),
            const SizedBox(height: 1), // Espacement après la ligne séparatrice
            // Deuxième ligne avec trois textes et deux icônes
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Text(
                          'Sow Aoua',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'sowaoua@gmail.com',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
       
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'Apprenant',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.edit_outlined, // Icône de crayon pour l'édition
                      color: Color(0xFFF83758),
                    ),
                    SizedBox(width: 10), // Espacement entre les icônes
                    Icon(
                      Icons.delete_outline, // Icône de suppression
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
       ),
       
       
       Padding(
         padding: const EdgeInsets.all(10),
         child: Container(
           decoration: BoxDecoration(
        color: Color(0xFFFEE0E0),
        borderRadius: BorderRadius.circular(20),
           ),
           child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Première ligne avec trois textes
            Padding(
              
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        'Nom et Prenom',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Role',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 8.0), // Espacement entre les lignes
            // Ligne séparatrice
            const Divider(
              color: Colors.white, // Couleur de la ligne séparatrice
              thickness: 2.0, // Épaisseur de la ligne
            ),
            const SizedBox(height: 1), // Espacement après la ligne séparatrice
            // Deuxième ligne avec trois textes et deux icônes
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Text(
                          'Sow Aoua',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'sowaoua@gmail.com',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
       
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'Apprenant',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.edit_outlined, // Icône de crayon pour l'édition
                      color: Color(0xFFF83758),
                    ),
                    SizedBox(width: 10), // Espacement entre les icônes
                    Icon(
                      Icons.delete_outline, // Icône de suppression
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
       ),
       
       Padding(
         padding: const EdgeInsets.all(10),
         child: Container(
           decoration: BoxDecoration(
        color: Color(0xFFFEE0E0),
        borderRadius: BorderRadius.circular(20),
           ),
           child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Première ligne avec trois textes
            Padding(
              
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        'Nom et Prenom',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Role',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 8.0), // Espacement entre les lignes
            // Ligne séparatrice
            const Divider(
              color: Colors.white, // Couleur de la ligne séparatrice
              thickness: 2.0, // Épaisseur de la ligne
            ),
            const SizedBox(height: 1), // Espacement après la ligne séparatrice
            // Deuxième ligne avec trois textes et deux icônes
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Text(
                          'Sow Aoua',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'sowaoua@gmail.com',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
       
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'Apprenant',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.edit_outlined, // Icône de crayon pour l'édition
                      color: Color(0xFFF83758),
                    ),
                    SizedBox(width: 10), // Espacement entre les icônes
                    Icon(
                      Icons.delete_outline, // Icône de suppression
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
       ),
       
       
       Padding(
         padding: const EdgeInsets.all(10),
         child: Container(
           decoration: BoxDecoration(
        color: Color(0xFFFEE0E0),
        borderRadius: BorderRadius.circular(20),
           ),
           child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Première ligne avec trois textes
            Padding(
              
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        'Nom et Prenom',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Role',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 8.0), // Espacement entre les lignes
            // Ligne séparatrice
            const Divider(
              color: Colors.white, // Couleur de la ligne séparatrice
              thickness: 2.0, // Épaisseur de la ligne
            ),
            const SizedBox(height: 1), // Espacement après la ligne séparatrice
            // Deuxième ligne avec trois textes et deux icônes
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Text(
                          'Sow Aoua',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'sowaoua@gmail.com',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
       
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        Text(
                          'Apprenant',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.edit_outlined, // Icône de crayon pour l'édition
                      color: Color(0xFFF83758),
                    ),
                    SizedBox(width: 10), // Espacement entre les icônes
                    Icon(
                      Icons.delete_outline, // Icône de suppression
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
           ),
         )
       )
                        ]
                      )
                      ]
                    )
        )
       ),
     ),

    
    );
    
  }
  
}
