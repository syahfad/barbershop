import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState()=> _ProfileState();
}

class _ProfileState extends State<Profile>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloogedin = false;

  checkAuthentification()async{
    _auth.authStateChanges().listen((user) {
      if(user == null){
        Navigator.pushReplacementNamed(context, "Start");
      }
    });
  }

  getUser() async{
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if(firebaseUser != null){
      setState(() {
        this.user= firebaseUser;
        this.isloogedin = true;
      });
    }
  }

  signOut()async{
    _auth.signOut();
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    Navigator.pushReplacementNamed(context, "Start");
  }


  @override
  void initState(){
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
        'Profile',
        style: TextStyle(color: Colors.white),
         ),
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
        ),
        body: Center(
          child: !isloogedin?CircularProgressIndicator():
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/profile.png'),
                  radius: 70,
                ),
              ),
              Container(
                child: Text("Name: User",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text("Email : ${user.email}",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                onPressed: signOut,
                child: Text('LOGOUT',style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
                ),
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
              ),
            ],
          ),
        )
    );
  }
}