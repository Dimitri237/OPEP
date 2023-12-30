import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_test/themes/colors.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Temporisation de 2 secondes
    Future.delayed(Duration(seconds: 2), () {
      // Naviguer vers la page suivante après la temporisation
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolors.primary(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/log1.png',
              height: 150.0,
            ),
            SizedBox(height: 24.0),
            Text(
              '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Image.asset(
            'assets/images/log2.png',
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
              style: GoogleFonts.monda(
                color: Color.fromARGB(255, 22, 34, 44),
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              textAlign: TextAlign.left,
              'Retrouver l’activité de vos véhicules dans un seul endroit',
              style: GoogleFonts.monda(
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
                    SizedBox(height: 40.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
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
                      style: GoogleFonts.monda(
                        color: Color.fromARGB(255, 22, 34, 44),
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 26.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          String phoneNumber = _phoneController.text;
                          String password = _passwordController.text;
                          print('Numéro de téléphone : $phoneNumber');
                          print('Mot de passe : $password');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // minimumSize: const Size.fromWidth(double.maxFinite),
                        padding: EdgeInsets.symmetric(
                            horizontal: 170.0, vertical: 18.0),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Connexion',
                        style: GoogleFonts.monda(
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
                                text: 'Pas de compte ? ',
                                style: GoogleFonts.monda(
                                  color: Color.fromARGB(255, 22, 34, 44),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Inscription',
                                style: GoogleFonts.monda(
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
    );
  }
}
