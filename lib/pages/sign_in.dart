import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _licenseController = TextEditingController();
  final List<String> validLicenses = ["12345", "67890", "11223"]; // Liste de licences valides
  String? _errorMessage;

  void _verifyLicense() {
    final String licenseNumber = _licenseController.text.trim();

    if (validLicenses.contains(licenseNumber)) {
      // Si la licence est valide, navigue vers la page suivante
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()), // Page suivante
      );
    } else {
      // Sinon, affiche un message d'erreur
      setState(() {
        _errorMessage = "Numéro de licence invalide.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription au Basketball"),
        backgroundColor: Colors.orange, // Couleur thème
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/image_de_fond_sign_in.jpg"), // Image de terrain de basketball
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7), // Effet de transparence
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo ou icône de basketball
                  const Icon(
                    Icons.sports_basketball,
                    size: 80,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 20),

                  // Texte d'en-tête
                  const Text(
                    "Enregistrez votre numéro de licence",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Champ d'entrée pour le numéro de licence
                  TextField(
                    controller: _licenseController,
                    decoration: InputDecoration(
                      labelText: "Numéro de licence",
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: "Entrez votre numéro de licence",
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                      errorText: _errorMessage,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.confirmation_number, color: Colors.orange),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),

                  // Bouton pour vérifier le numéro de licence
                  ElevatedButton(
                    onPressed: _verifyLicense,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text(
                      "Vérifier",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Texte ou lien de support
                  Text(
                    "Besoin d'aide ? Contactez votre entraîneur.",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
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

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenue"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: const Text(
          "Accès autorisé. Bienvenue dans l'équipe !",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
