import 'package:flutter/material.dart';
import 'package:foodyfast/floatingpage/movingpage.dart';
//import 'package:foodyfast/mainPage/cart_provider.dart';
import 'firebase_options.dart';
// import 'Loginpage/Loginpart1.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'floatingpage/movingpage.dart';
 //import 'package:foodyfast/mainPage/cart_screen.dart';


void main()async{
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Mypage1(), 
    );
  }
}
