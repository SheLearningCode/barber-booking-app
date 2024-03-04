
import 'package:bookme/Screens/Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String value = "";
  String price = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text("Fantastični Frizer"),
          backgroundColor: const Color.fromARGB(66, 83, 75, 75),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("images/379.jpg", fit: BoxFit.cover, height: 280,width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(height: 18,),
                Container(
                  color: const Color.fromARGB(255, 51, 28, 183),
                  height: 60,
                  child: Marquee(
                    blankSpace: 10,
                    // text speed
                    // if we set velovit negative slide opposite direction.
                    text: "Doći bez prethodnog zakazivanja je moguće, ali je bolje unapred rezervisati termin pre dolaska.",
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white ),
                )
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.topLeft,
                  child: const Text.rich(
                    TextSpan(
                      text: "Pozdrav svima! Kod nas možete uživati u vrhunskim",
                      style: TextStyle( fontSize: 18, ),
                      children: [
                        TextSpan(
                            text: " frizurama " , style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                        ),
                        TextSpan(
                            text:  "i raznovrsnim sjajnim uslugama! Ne čekajte, već odmah rezervišite svoj termin i prepustite se vrhunskoj usluzi koju nudimo!",
                            style: TextStyle(
                              height: 3.0,
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                const Text("Šišanje i trimovanje ", style: TextStyle(color: Colors.grey, fontSize: 19,),),
                Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text("Šišanje"),
                           const Spacer(),
                          const Text("1600Din"),
                          const SizedBox(width: 12,),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child:Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(30),
                                color: Colors.blueAccent,

                              ),
                              child: MaterialButton(
                                child: const Text("Rezerviši", style: TextStyle(fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) =>  Services(value: 'Šišanje', price: 1600,)),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Trimovanje brade"),
                          const Spacer(),
                          const Text("800Din"),
                          const SizedBox(width: 12,),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child:Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(30),
                                color: Colors.indigoAccent,

                              ),
                              child: MaterialButton(
                                child: const Text("Rezerviši", style: TextStyle(fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) =>  Services(value: 'Trimovanje brade', price: 800,)),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Text("Druge usluge", style: TextStyle(color: Colors.grey, fontSize: 20),),
                Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text("Hot Towel"),
                          const Spacer(),
                          const Text("3000Din"),
                          const SizedBox(width: 12,),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child:Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(30),
                                color: Colors.teal,

                              ),
                              child: MaterialButton(
                                child: const Text("Rezerviši", style: TextStyle(fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) =>  Services(value: 'Hot Towel', price: 3000,)),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Vosak za nos i uši"),
                          const Spacer(),
                          const Text("500Din"),
                          const SizedBox(width: 12,),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child:Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(30),
                                color: Colors.grey,

                              ),
                              child: MaterialButton(
                                child: const Text("Rezerviši", style: TextStyle(fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) =>  Services(value: 'Vosak za nos i uši', price: 500,)),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ),
    );
  }
}
