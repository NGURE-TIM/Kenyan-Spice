import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';
import 'package:east_african_spice/onboarding_Screens/components/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signUP extends StatefulWidget {

static const String id = "/signup";

  @override
  State<signUP> createState() => _signUPState();
}

class _signUPState extends State<signUP> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String username;
  late String email;
  late String password;
  late String checkpassword;

  @override
  Widget build(BuildContext context) {
    final Size screensize=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screensize.width,
        height: screensize.height,
        decoration: BoxDecoration(
          image : DecorationImage(
            image:backgroundImage,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),


        child: SingleChildScrollView(

          child: Column(
            children: [
              Container(
                child: Logoimage(200,200),
                // margin: EdgeInsets.only(bottom: 5.0),
              ),
              type_of_Textfield("Username"),
              Container(
                width: 300,
                height: 40,
                child: TextField(
                  style: TextStyle(
                    color:Colors.white,
                  ),
                  cursorColor: Color(yellowTheme),
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    username=value;
                  },
                    decoration: InputDecoration(


                      filled: true,

                      fillColor: Colors.grey[900]?.withOpacity(0.5),

                      hintText: "Enter your username",

                      hintStyle: TextStyle(

                        color: Colors.grey[700],

                      ),

                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),

                      border:

                      OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      enabledBorder: OutlineInputBorder(

                        borderSide: BorderSide(
                            color: Color(yellowTheme), width: 1.0),

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      focusedBorder: OutlineInputBorder(

                        borderSide: BorderSide(
                            color: Colors.white, width: 2.0),

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      // cursorColor: Color,

                    )
                ),
              ),
              type_of_Textfield("Email"),
              Container(
                width: 300,
                height: 40,
                child: TextField(
                    style: TextStyle(
                      color:Colors.white,
                    ),
                    cursorColor: Color(yellowTheme),
                    textAlign: TextAlign.center,
                    onChanged: (value){
                      email=value;
                    },
                    decoration: InputDecoration(


                      filled: true,

                      fillColor: Colors.grey[900]?.withOpacity(0.5),

                      hintText: "Enter your username",

                      hintStyle: TextStyle(

                        color: Colors.grey[700],

                      ),

                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),

                      border:

                      OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      enabledBorder: OutlineInputBorder(

                        borderSide: BorderSide(
                            color: Color(yellowTheme), width: 1.0),

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      focusedBorder: OutlineInputBorder(

                        borderSide: BorderSide(
                            color: Colors.white, width: 2.0),

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      // cursorColor: Color,

                    )
                ),
              ),
              type_of_Textfield("Password"),
              Container(
                width: 300,
                height: 40,
                child: TextField(
                    style: TextStyle(
                      color:Colors.white,
                    ),
                    cursorColor: Color(yellowTheme),
                    textAlign: TextAlign.center,
                    onChanged: (value){
                     password=value;
                    },
                    decoration: InputDecoration(


                      filled: true,

                      fillColor: Colors.grey[900]?.withOpacity(0.5),

                      hintText: "Enter your username",

                      hintStyle: TextStyle(

                        color: Colors.grey[700],

                      ),

                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),

                      border:

                      OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      enabledBorder: OutlineInputBorder(

                        borderSide: BorderSide(
                            color: Color(yellowTheme), width: 1.0),

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      focusedBorder: OutlineInputBorder(

                        borderSide: BorderSide(
                            color: Colors.white, width: 2.0),

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      // cursorColor: Color,

                    )
                ),
              ),
              type_of_Textfield("Re-enter your password"),
              Container(
                width: 300,
                height: 40,
                child: TextField(
                    style: TextStyle(
                      color:Colors.white,
                    ),
                    cursorColor: Color(yellowTheme),
                    textAlign: TextAlign.center,
                    onChanged: (value){
                  checkpassword=value;
                    },
                    decoration: InputDecoration(


                      filled: true,

                      fillColor: Colors.grey[900]?.withOpacity(0.5),

                      hintText: "Enter your username",

                      hintStyle: TextStyle(

                        color: Colors.grey[700],

                      ),

                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),

                      border:

                      OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      enabledBorder: OutlineInputBorder(

                        borderSide: BorderSide(
                            color: Color(yellowTheme), width: 1.0),

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      focusedBorder: OutlineInputBorder(

                        borderSide: BorderSide(
                            color: Colors.white, width: 2.0),

                        borderRadius: BorderRadius.all(Radius.circular(32.0)),

                      ),

                      // cursorColor: Color,

                    ),

                ),
              ),
              Container(
                height: 25,
              ),
              login_signupButton("Sign up",() async{

                if (password==checkpassword){
                  try{
                    final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    User? user = newUser.user;
                    String uid = user!.uid;

                    // Update user profile with the username
                    await _firestore.collection('users').doc(uid).set({
                      'username': username,
                    });

                  }
                  catch(e){print(e);}
                }
                else(

                showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                    title: Text("Error"),
                    content: Text("Passwords do not match!"),
                    actions: [
                    TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Ok"))
                    ],
                    );
                    }
                )
                );




              }),
              Container(
                height: 15,
              ),
              Text("or sign up with ", style: ktype_of_Textfield),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    buildGestureDetector(
                        "images/google-icon-svgrepo-com.svg", () {}),
                    Container(
                      width: 22,
                    ),
                    buildGestureDetector(
                        "images/twitter-svgrepo-com (1).svg", () {}),
                    Container(
                      width: 22,
                    ),
                    buildGestureDetector(
                        "images/facebook-svgrepo-com.svg", () {}),
                  ],
                ),
              ),
              Container(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),),
                  //  SizedBox(width: 5,),


                  Outlined_signupButton("Sign in", () {
                    Navigator.pushNamed(context, signUP.id);
                  },)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
