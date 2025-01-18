import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodyfast/Loginpage/loginpart1.dart';
class Mypage1 extends StatefulWidget {
  const Mypage1({super.key});

  @override
  _Mypage1State createState() => _Mypage1State();
}

class _Mypage1State extends State<Mypage1> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          // First Page
          Stack(
            children: [
              // Background color
              Container(
                color: const Color.fromARGB(255, 228, 244, 41),
              ),
              // Welcome Text
              Positioned(
                bottom: 650,
                left: 20,
                right: 20,
                child: Text(
                  'Welcome, FooderS',
                  style: GoogleFonts.aDLaMDisplay(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Lottie animation
              Positioned(
                top: 135,
                left: 35,
                child: SizedBox(
                  width: 325,
                  height: 325,
                  child: Lottie.asset(
                    "assets/newone.json",
                  ),
                ),
              ),
              // Description Text
              Positioned(
                bottom: 225,
                left: 20,
                right: 20,
                child: Text(
                  'Hey! Pookie, this is an exclusive food application for Fast students',
                  style: GoogleFonts.aDLaMDisplay(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                bottom: 175,
                left: 20,
                right: 20,
                child: Text(
                  'Swap !! to explore more',
                  style: GoogleFonts.aDLaMDisplay(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Instructional Text
               
            ],
          ),
//_______________________________________________________________
          // Second Page
          Stack(
            children: [
              Container(
                color: const Color.fromARGB(255, 228, 244, 41),
              ),
              Positioned(
                bottom: 650,
                left: 20,
                right: 20,
                child: Text(
                  'Easy to pay',
                  style: GoogleFonts.aDLaMDisplay(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                child: SizedBox(
                  width: 325,
                  height: 325,
                  child: Lottie.asset(
                    "assets/Payment.json",
                  ),
                ),
              ),

              Positioned(
                bottom: 175,
                left: 20,
                right: 20,
                child: Text(
                  'Now, payments are in your control – wherever you are, whenever you want.',
                  style: GoogleFonts.aDLaMDisplay(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
            ],
          ),

          // Third Page
          //______________________________________________________
          Stack(
            children: [
              Container(
                color: const Color.fromARGB(255, 228, 244, 41),
              ),
              Positioned(
                bottom: 605,
                left: 20,
                right: 20,
                child: Text(
                  'Add to cart',
                  style: GoogleFonts.aDLaMDisplay(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              //___________animation
              Positioned(
                top: 150,
                right: -50,
                child: SizedBox(
                  width: 500,
                  height: 500,
                  child: Lottie.asset(
                    "assets/addtocart2.json",
                  ),
                ),
              ),
              Positioned(
                bottom: 175,
                left: 20,
                right: 20,
                child: Text(
                  'Add to cart system - give feedback on what you eat or not',
                  style: GoogleFonts.aDLaMDisplay(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // 
              Expanded(
                child: Align(
                  alignment: const Alignment(0.60 , 0.80),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Test()),
                      ); 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      padding: const EdgeInsets.all(
                          15.0), 
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), 
                        side: const BorderSide(
                            color: Colors.black, width: 2.0), 
                      ),
                    ),
                    child: const Text(
                      '   Lets Roll   ',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
