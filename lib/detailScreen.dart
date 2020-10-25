import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_patrollers_app/homeScreen.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  final TextEditingController name = new TextEditingController();
  final TextEditingController age = new TextEditingController();
  final TextEditingController bloodgroup = new TextEditingController();
  final TextEditingController heart = new TextEditingController();
  final TextEditingController asthma = new TextEditingController();
  final TextEditingController allergy = new TextEditingController();
  final User users = FirebaseAuth.instance.currentUser;

  void details() {
    if(name.text.isNotEmpty && age.text.isNotEmpty && bloodgroup.text.isNotEmpty && heart.text.isNotEmpty && asthma.text.isNotEmpty && allergy.text.isNotEmpty){
      FirebaseFirestore.instance.collection("users").doc(users.uid).set
      (
        {
          "Name":name.text,
          "Age":age.text,
          "Blood Group":bloodgroup.text,
          "Asthma":asthma.text,
          "Allergy":allergy.text, 
        }
      );
        name.clear();
        age.clear();
        bloodgroup.clear();
        heart.clear();
        asthma.clear();
        allergy.clear();
        Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext context)=>HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : new Container(
        padding: const EdgeInsets.only(top: 180),
        child: new Container(
          padding: const EdgeInsets.all(15),
          child: new SingleChildScrollView(
            child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text("Welcome.",style: TextStyle(fontSize: 52,color: Colors.white,fontWeight: FontWeight.bold,)),
                ],
              ),
              new Padding(padding: const EdgeInsets.only(top:20),),
              new TextFormField(
                decoration: new InputDecoration(
                  hintText: "Enter Name",
                   hintStyle: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.name,
                controller: name,
              ),
              new Padding(padding: const EdgeInsets.only(top:10),),
              new TextFormField(
                decoration: new InputDecoration(
                  hintText: "Enter Age",
                   hintStyle: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold)
                  ),
                  keyboardType: TextInputType.number,
                  controller: age,
                ),
                new Padding(padding: const EdgeInsets.only(top:10),),
                new TextFormField(
                decoration: new InputDecoration(
                  hintText: "Enter Blood Group",
                   hintStyle: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold)
                  ),
                  keyboardType: TextInputType.text,
                  controller: bloodgroup,
                ),
                new Padding(padding: const EdgeInsets.only(top:10),),
                new TextFormField(
                decoration: new InputDecoration(
                  hintText: "Do You Suffer From Heart Condition ?",
                   hintStyle: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold)
                  ),
                  keyboardType: TextInputType.text,
                  controller: heart,
                ),
                new Padding(padding: const EdgeInsets.only(top:10),),
                new TextFormField(
                decoration: new InputDecoration(
                  hintText: "Do You Suffer From Asthma ?",
                   hintStyle: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold)
                  ),
                  keyboardType: TextInputType.text,
                  controller: asthma,
                ),
                new Padding(padding: const EdgeInsets.only(top:10),),
                new TextFormField(
                decoration: new InputDecoration(
                  hintText: "Do You Suffer From Allergies ?",
                   hintStyle: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold)
                  ),
                  keyboardType: TextInputType.text,
                  controller: allergy,
                ),
                new Padding(padding: const EdgeInsets.only(top: 30),),
                new RaisedButton(
                  padding: const EdgeInsets.all(8),
                  child: new Text("Let's Get Started",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                  onPressed: details,
                  color: Colors.white,
                  shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              )
            ],
          ),
          )
        ),
      )
    );
  }
}