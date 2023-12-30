import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: 'O', // Première lettre en bleu
                  style: GoogleFonts.roboto(
                   color:Color.fromARGB(255, 22, 34, 44),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'o', // Reste du texte en noir
                  style:  GoogleFonts.roboto(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'e', // Reste du texte en noir
                  style:  GoogleFonts.roboto(
                    color:Color.fromARGB(255, 22, 34, 44),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'o', // Reste du texte en noir
                  style:  GoogleFonts.roboto(
                    color: Colors.orange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(17.0),
          alignment: Alignment.topLeft, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(
                  'Connextion',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                   color:Color.fromARGB(255, 22, 34, 44),
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  textAlign: TextAlign.left,
                  'Retrouver l’activité de vos véhicules dans un seul endroit',
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: Colors.grey[900],
                    
                  ),
                ),
                Container(
                  width: 470,
                  margin: EdgeInsets.only(top: 50),
                  
                  child: Form(
                    
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 15,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Veuillez entrer un numéro de téléphone';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Téléphone/Email',
                  ),
                ),

          TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 55,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Veuillez entrer une adress Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Email',
                  ),
                ),

                SizedBox(height: 40.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value?.isEmpty ?? true){
                      return 'Veuillez entrer un mot de passe';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      ),
                    labelText: 'Mot de passe',
                  ),
                ),
                SizedBox(height: 26.0),

                Text(
                   textAlign: TextAlign.left,
                  'Mot de passe oublié ?',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 26.0),
                ElevatedButton(
                  
                  onPressed: () {
                    if(_formKey.currentState?.validate() ?? false) {
                      String phoneNumber = _phoneController.text;
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      print('Numéro de téléphone : $phoneNumber');
                       print('Adress email : $email');
                      print('Mot de passe : $password');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 176.0, vertical: 18.0), 
                    backgroundColor: Colors.blue, 
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Inscription',
                    style: GoogleFonts.roboto(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                SizedBox(height: 20.0),
               Container(
                child: Column(children: [
                  RichText(
                    text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: 'Vous avez un compte ? ',
                  style: GoogleFonts.roboto(
                    color:Color.fromARGB(255, 22, 34, 44),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Connexion',
                  style:  GoogleFonts.roboto(
                    color: Colors.orange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                    )
                    ],
            ),
            )
                ]),
               ),
              ],
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