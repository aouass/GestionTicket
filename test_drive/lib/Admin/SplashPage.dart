import 'package:flutter/material.dart';
import 'package:test_drive/Pages/CreationTicket.dart';
import 'package:test_drive/Pages/LoginPage.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/Logo.png',
              width: 600,
              height: 240,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreationTicket()),
                );
              },
              child: const Text('Aller à la page de connexion'),
            ),
          ],
        ),
      ),
    );
  }
}