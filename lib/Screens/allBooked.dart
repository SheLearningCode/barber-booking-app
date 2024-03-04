

import 'package:bookme/Screens/HomePage.dart';
import 'package:flutter/material.dart';

class allBooked extends StatelessWidget {
  const allBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>  const HomePage()));
          }
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              color: Colors.green,
              Icons.check_circle_outline, size: 40,
            ),
            SizedBox(height: 30,),
            Center(
              child: Text("Rezervisali ste uspešno termin, vidimo se uskoro!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.cyan),),
            )
          ],
        ) ,
      ),
    );
  }
}
