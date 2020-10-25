import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_patrollers_app/detailScreen.dart';
import 'package:the_patrollers_app/signUp.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email;
  String password;

  Future<void> signIn() async{
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      try{
        await Firebase.initializeApp();
        FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DetailScreen()));
      }
      catch(e){
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        padding: const EdgeInsets.only(top: 220),
        child: new Container(
          padding: const EdgeInsets.all(15),
          child: new SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text("Hey,",style: TextStyle(fontSize: 52,color:Colors.white,fontWeight: FontWeight.bold)),
                ],
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text("There.",style: TextStyle(fontSize: 52,color:Colors.white,fontWeight: FontWeight.bold)),
                ],
              ),
              new Padding(padding: const EdgeInsets.only(top: 20),),
              new Form(
                key: formKey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Enter Mail-ID",
                    hintStyle: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val)=>val.contains("@") ? null : "Enter Valid Mail-ID",
                  onSaved: (val)=>email=val,
                ),
                new Padding(padding: const EdgeInsets.only(top: 10),),
                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: TextStyle(fontSize: 20,color: Colors.grey[600],fontWeight: FontWeight.bold),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val)=>val.length<6 ? "Password Too Short" : null,
                  onSaved: (val)=>password=val,
                  obscureText: true,
                ),
                new Padding(padding: const EdgeInsets.only(top: 30),),
                new RaisedButton(
                      padding: const EdgeInsets.all(8),
                      child: new Text("Sign-In",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                      onPressed: signIn,
                      color: Colors.white,
                      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                new Padding(padding: const EdgeInsets.only(top: 10),),
                new RaisedButton(
                      padding: const EdgeInsets.all(8),
                      child: new Text("Sign-Up",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignupPage()));
                      },
                      color: Colors.black,
                      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    )
                  ],
                )
              )
            ],
          ),
          )
        ),
      ),
    );
  }
}