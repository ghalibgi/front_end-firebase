import 'package:flutter/material.dart';
import 'package:login_front/pages/sign_in.dart'; // Importe la page SignInPage

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Image de fond
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/image_de_fond.jpg"), // Ton image ici
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), // Transparence de l'image
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Titre avec thème basket
              const Text(
                "sport manager connect",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      color: Colors.black54,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Champ email
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Entrez votre email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.email, color: Colors.orange),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.9),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Champ mot de passe
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  hintText: "Entrez votre mot de passe",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.orange),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 30),

              // Bouton Se connecter
              ElevatedButton(
                onPressed: () {
                  print("Connexion réussie !");
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.orange,
                ),
                child: const Text(
                  "Se connecter",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              // Lien vers SignInPage
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: const Text(
                  "Pas encore inscrit ? Enregistrez votre numéro de licence",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Lien mot de passe oublié
              TextButton(
                onPressed: () {
                  print("Mot de passe oublié ?");
                },
                child: const Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
