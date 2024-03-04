// ignore_for_file: unused_import

import 'package:bookme/Screens/SplashScreen.dart';
import 'package:bookme/Screens/allBooked.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions
        (apiKey: "AIzaSyCg8zJdXr-AAWQ18oTUSJEu1wDXs9jdnbY"
          , appId: "bookme-ef465", messagingSenderId: "213012481780", projectId: "bookme-ef465")
  );
  runApp( const BookMeForm());
}

class BookMeForm extends StatefulWidget {
  const BookMeForm({super.key});


  @override
  State<BookMeForm> createState() => _BookMeFormState();
}

class _BookMeFormState extends State<BookMeForm> {

  @override
  Widget build(BuildContext context) {
   return const MaterialApp(

     debugShowCheckedModeBanner: false,
     home: SplashScreen(),
   );
  }
}



