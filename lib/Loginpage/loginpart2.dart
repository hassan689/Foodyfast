import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodyfast/Loginpage/loginpart1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodyfast/mainPage/firebase/firebase_auth.dart';

class Signupinfo extends StatefulWidget {
  const Signupinfo({super.key});
  @override
  _SignupinfoState createState() => _SignupinfoState();
}

class _SignupinfoState extends State<Signupinfo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 244, 41),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Test()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // Background image

          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Container(
                height: 800,
                width: 1000,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 228, 244, 41),
                  image: DecorationImage(
                    image: AssetImage('assets/imagesloginpage/boy.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          // Foreground form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Signup to Fooo!!!!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                        ),
                        child: const Text(
                          'Signup using Google',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          Container(
                            color: const Color.fromARGB(255, 228, 244, 41),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: const Text(
                              "Or continue with email",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Name field
                      SizedBox(
                        width: 325,
                        height: 60,
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Enter name',
                            hintStyle: GoogleFonts.aDLaMDisplay(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: const Icon(Icons.text_fields,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Email field
                      SizedBox(
                        width: 325,
                        height: 60,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Enter mail',
                            hintStyle: GoogleFonts.aDLaMDisplay(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon:
                                const Icon(Icons.email, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Password field
                      SizedBox(
                        width: 325,
                        height: 60,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: 'Enter password',
                            hintStyle: GoogleFonts.aDLaMDisplay(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: signUp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            side: const BorderSide(
                                color: Colors.black, width: 2.0),
                          ),
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.signUpwithEmailAndPassword(email, password );
    if (user != null) {
      print("User created successfully ;)");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Test()),
      );

      Navigator.pushNamed(context, "/home");
    } else {
      print("User creation failed :(");
    }
  }
}
