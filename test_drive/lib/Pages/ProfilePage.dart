import 'package:flutter/material.dart';
import 'package:test_drive/Pages/AccueilPage.dart';

class  ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      

      body: SingleChildScrollView(
        
        child: Center(
          child: Container(
            
            width: 1200,
            child: Padding(
              padding: const EdgeInsets.only(top: 1, left: 40,right: 40),
              child: Column(

                children: [
                  Row(
                    children: [
                      
                      Column(
                        children: [
                          IconButton(onPressed: () { 
                            Navigator.push(context,
                                 MaterialPageRoute(builder: (context)=>const AccueilPage()),); },
                                  icon: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 0, 0, 0), size:30),
                                  )
                        ],
                      
                      ),

                      SizedBox(width: 80,),
                      const Column(
                        children: [
                           SizedBox(height: 100,),
                          Text(
                        'Profile',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                                 ),
                            // textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 10,),

                            CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/Group.png'), // Assurez-vous de mettre l'image appropriée dans le dossier assets
                            ),
                        ],
                      ),
                      
                    ],
                    

                  ),

                  SizedBox(height: 14,),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                        const Text(
                          'Informations Personnelles',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10,),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                          'Prenom',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      const SizedBox(height: 20),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Prenom ',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: const Color.fromARGB(243, 243, 243, 243), // Couleur de fond du champ
                        ),
                      ),
                  
                      SizedBox(height: 10,),
                      const Text(
                          'Nom',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      const SizedBox(height: 20),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Nom',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: const Color.fromARGB(243, 243, 243, 243), // Couleur de fond du champ
                        ),
                      ),
                  
                      SizedBox(height: 10,),
                      const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 20),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: const Color.fromARGB(243, 243, 243, 243), // Couleur de fond du champ
                        ),
                      ),
                  
                        SizedBox(height: 10,),
                        const Text(
                          'Mot de passe',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 20),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: const Color.fromARGB(243, 243, 243, 243), // Couleur de fond du champ
                        ),
                      ),
                          ],

                        )
                  
                  
                         
                  
                      
                      
                    ],
                  ),
                  const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Action à effectuer lors de la connexion
                          //Navigator.push(
                            //context,
                            //MaterialPageRoute(builder: (context)=>const AccueilPage()),
                          //);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF83758), // Couleur du bouton
                          maximumSize: Size(200, 50)
                        ),
                        child: const Text('Modifier Profile',
                        style:TextStyle(
                          fontSize:18,
                          color: Colors.white,
                        )
                        ),
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