
import 'package:bookme/Screens/allBooked.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: must_be_immutable
class Services extends StatefulWidget {
var  value;
var price;

  Services({
   super.key,
 required this.value, required this.price,
 });


  @override
  State<Services> createState() => _HairCutsState();
}

class _HairCutsState extends State<Services> {
  DateTime today = DateTime.now();
  void _onDaySelected( DateTime day, DateTime focusDay) {
    setState(() {
      today = focusDay;
    });
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  final dataBase = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>(); //key for form

  TimeOfDay time = const TimeOfDay(hour: 12, minute: 12);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("Rezerviši termin", style: TextStyle(color: Colors.black),),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 35,),
                Container(
                  child: TableCalendar(
                    calendarStyle: const CalendarStyle(
                      selectedDecoration: BoxDecoration(
                          color: Colors.teal,
                          shape: BoxShape.circle
                      ),
                    ),
                    rowHeight: 35,
                    headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    focusedDay: today,
                    firstDay: DateTime.now(),
                    lastDay: DateTime.utc(2030, 3, 10),
                    onDaySelected: _onDaySelected,
                  ),
                ),
                const Divider(thickness: 0.5, color: Colors.grey,),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: time);
                      if(newTime == null) return;
                      setState(() => time = newTime);
                    },
                    child: Container(
                      color: Colors.grey,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${time.hour}: ${time.minute}", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.access_time_outlined, size: 40,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: <Widget>[
                       Flexible(
                          child: TextFormField(
                            controller: nameController,
                            decoration:  InputDecoration(
                                labelText: "Ime *", labelStyle: const TextStyle(color: Colors.black),
                              hintText: "Upišite ime i prezime",
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value){
                              if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                //allow upper and lower case alphabets and space
                                return "Upišite ime i prezime";
                              }else{
                                return null;
                              }
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                      ),
                      const SizedBox(width: 20,),
                      Flexible(
                        child:  TextFormField(
                          controller: emailController,
                          decoration:  InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                              labelText: "E-Mail *", labelStyle: const TextStyle(color: Colors.black),
                              hintText: "naprimer John@Gmail.com",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value){
                            if(value!.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                              //allow upper and lower case alphabets and space
                              return "Upišite E-Mail adresu";
                            }else{
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Komentar (opcionalno)" , style: TextStyle(color: Colors.grey.shade700),),
                      const SizedBox(height: 10,),
                      TextField(
                        controller: commentController,
                        decoration:  InputDecoration(
                          prefixIcon: const Icon(Icons.comment, color: Colors.grey,),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (value ){  
                          commentController.text = value;
                        },

                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text("${widget.value}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          const Spacer(),
                          Text("£${widget.price}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child:Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(30),
                            color: Colors.teal,

                          ),
                          child: MaterialButton(
                            child: const Text("Rezerviši", style: TextStyle(fontWeight: FontWeight.bold),),
                             onPressed: () async {
                              await _showMyDialog();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void clearText(){
    nameController.clear();
    emailController.clear();
    commentController.clear();
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(child: Text("Pri tome ste da izvršite rezervaciju ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),)),
                    const SizedBox(height: 20,),
                    Text("${widget.value}"),
                    const SizedBox(height: 5,),
                    Text("U ${time.hour}: ${time.minute}"),
                    const SizedBox(height: 5,),
                    Text("U ${today.day}: ${today.month} : ${today.year}")
                  ],
                ),
                const Text('Dali ste sigurni? ',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                  ),),
              ],
            ),
          ),
          actions: <Widget>[
    
            TextButton(
              child: const Text('poništiti',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: ()  {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('da',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()){
                   dataBase.collection("Usluge").doc().set(
                      {
                        "usluga": widget.value,
                        "cena": ("Din${widget.price}"),
                        "datum": today,
                        "ime": nameController.text,
                        "komentar": commentController.text,
                        "vreme": ("${time.hour}: ${time.minute}"),
                      }
                  );
                  print('podatci primljeni');
                  clearText();

                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const allBooked()),
                  );
                   ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                     content: Text('Uspešno ste rezervisali termin ${widget.value}'),

                   ));
                }
                else {
                 ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                    content: Text('molim vas ispunite sva potrebna polja'),
                  ));
                }
              }

            ),
          ],
        );
      },
    );
  }
}


