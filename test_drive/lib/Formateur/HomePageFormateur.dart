import 'package:flutter/material.dart';
import 'package:test_drive/Admin/CreationUtilisateurPage.dart';


class HomepageFormateur extends StatelessWidget {
  const HomepageFormateur({super.key});

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
            const SizedBox(height: 30,),
            Padding(padding: const EdgeInsets.all(20),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 35,
                       backgroundImage: AssetImage('images/Profile.png'), // Assurez-vous de mettre l'image appropriée dans le dossier assets
                    ),
                  
                  
                    Padding(
                      
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                       
                        
                        children: [
                          Text("Formateur",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 12
                         ),
                      ),
                      
                      
                      
                      Text("Salut,Saran",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 18,
                    

                         ),
                      )
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
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(30), topRight:Radius.circular(30))
                  ),
                
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                       Row(children: [
                         Expanded(
                           child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Color(0xFFFEE0E0),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [BoxShadow(
                                color: Color(0xFFE9E4E4),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                              )]
                            ),
                           
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(0),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      hintText:"historique Ticket",
                                      hintStyle: TextStyle(color: Color(0xFF000000)),
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                           
                              ],
                              
                            ),
                            
                             ),//AOUA
                         ),
                        const SizedBox(width: 60),
                        Column(
                          children: [
                            
                            ElevatedButton(
                                    onPressed: () {
                                      // Action à effectuer lors de la connexion
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context)=>CreationUtilisateurPage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFF83758), // Couleur du bouton
                                      maximumSize: Size(200, 50)
                                    ),
                                    child: const Text('Utilisateur',
                                    style:TextStyle(
                                      fontSize:18,
                                      color: Colors.white,
                                    )
                                    ),
                                         ),
                
                          ],
                        ),
                
                        
                        ],
                      ),
                
                      SizedBox(height: 20,),
                
                      Column(
                        children: [
                          const Text("Historiques des Utilisateurs"),
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
                
                
                
                
                
                        ],
                      )
                      ],
                    ),
                
                    ),
                ),
              )
              )
            
          ],
        ),
      ),

     
    );
  }
}