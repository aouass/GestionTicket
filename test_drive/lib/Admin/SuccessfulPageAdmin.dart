import 'package:flutter/material.dart';

import 'HomePageAdmin.dart';

class SuccessfulPageAdmin extends StatelessWidget {
  const SuccessfulPageAdmin({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.task_alt,
                size: 200,
                color: Color(0xFFF83758), 
              ),

              
            
            ),

            SizedBox(height: 20,),

            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                  'Inscription réussie',
                  style: TextStyle(
                    fontSize: 20,
                    
                  ),
                  textAlign: TextAlign.center,
              ),
            ),


            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lors de la connexion
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>const HomePageAdmin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF83758), // Couleur du bouton
                    maximumSize: Size(200, 50)
                  ),
                  child: const Text('Accéder à Home',
                  style:TextStyle(
                    fontSize:18,
                    color: Colors.white,
                  )
                  ),
                ),
            ),
          
          ],
        ),
        
      ),







    );
  }
}