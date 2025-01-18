import 'package:flutter/material.dart';
import 'package:foodyfast/Loginpage/loginpart2.dart';
import 'package:foodyfast/mainPage/items.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodyfast/mainPage/firebase/firebase_auth.dart';

class Test extends StatefulWidget {
  const Test({super.key});
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
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
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          Positioned(
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/imagesloginpage/clouds.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 850,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/imagesloginpage/sittinggirl.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(flex: 2),
                  Text(
                    'Login via university email',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 325,
                      height: 60,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 228, 244, 41),
                          hintText: 'l230123',
                          hintStyle: GoogleFonts.aDLaMDisplay(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          suffixText: '@lhr.nu.edu.pk',
                          suffixStyle: GoogleFonts.aDLaMDisplay(
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
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 325,
                      height: 60,
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 228, 244, 41),
                          hintText: '*****',
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
                              const Icon(Icons.password, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    // onPressed: () async {
                    //     Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const Signupinfo()),
                    //   );
                    // },

                    onPressed: signin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 228, 244, 41),
                      padding: const EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      minimumSize: const Size(300, 60),
                    ),
                    child: Text(
                      'Confirm',
                      style: GoogleFonts.aBeeZee(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
          





        ],
        
      ),
    );
  }

  void signin() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.signinwithEmailAndPassword(email, password);
    if (user != null) {
      final snackbar = SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.black, width: 2),
        ),
        content: Text(
          'Congrats fastian lets eat something!',
          textAlign: TextAlign.center,
          style: GoogleFonts.aBeeZee(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 228, 244, 41),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      moveTomenuPage();
      // Navigate to the home screen (uncomment if needed)
      //  Navigator.pushNamed(context, "/home");
    } else {
      final snackbar = SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.black, width: 2),
        ),
        content: Text(
          'Incorrect password, cheeky!',
          textAlign: TextAlign.center,
          style: GoogleFonts.aBeeZee(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 228, 244, 41),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      
      );
       movetoSignuppage();
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
  void movetoSignuppage(){
     Navigator.push(context, 
     MaterialPageRoute(builder: (context)=>const Signupinfo())
     );
  }
  void moveTomenuPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AvailableItems()),
    );
  }
}
