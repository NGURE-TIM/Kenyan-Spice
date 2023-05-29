import 'package:east_african_spice/onboarding_Screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';
import 'package:east_african_spice/onboarding_Screens/components/widgets.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Decoration{
  static BoxDecoration deco=BoxDecoration(
    image : DecorationImage(
      image:backgroundImage,
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.5),
        BlendMode.darken,
      ),
    ),
  );
}





class login extends StatefulWidget {

  static const String id = "/login";
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final FirebaseAuth  _auth= FirebaseAuth.instance;
  bool checkBox = false;
  bool obscureText = true;
  late String email;
  late String password;
  BoxDecoration loginBackgroundDecoration = Decoration.deco;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: loginBackgroundDecoration,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  child: Logoimage(200, 200),
                  // margin: EdgeInsets.only(bottom: 5.0),
                ),
                type_of_Textfield("Email"),

                Container(
                  width: 300,
                  height: 40,
                  child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Color(yellowTheme),
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,

                      onChanged: (value) {
                        email = value;
                      },

                      decoration: InputDecoration(


                        filled: true,

                        fillColor: Colors.grey[900]?.withOpacity(0.5),

                        hintText: "Enter your email",

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
                      obscureText: obscureText,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Color(yellowTheme),
                      textAlign: TextAlign.center,

                      onChanged: (value) {
                        password = value;
                      },

                      decoration: InputDecoration(

                        suffixIcon: IconButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0, vertical: 8),
                          icon: Icon(
                              size: 20,
                              color: Color(yellowTheme),
                              obscureText ? Icons.visibility_off : Icons
                                  .visibility
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),

                        filled: true,

                        fillColor: Colors.grey[900]?.withOpacity(0.5),

                        hintText: "Enter your password",

                        hintStyle: TextStyle(

                          color: Colors.grey[700],

                        ),

                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 0.0),

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

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.grey[700],),
                        child: Checkbox(
                            value: checkBox,
                            activeColor: Color(yellowTheme),
                            checkColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                checkBox = value!;
                              });
                            }),
                      ),
                      Container(width: 1,),
                      Text(
                        "Remember me ?",
                        style: ktype_of_Textfield,

                      ),
                      Container(width: 1,),
                      Outlined_signupButton("Forgot password ?", () {},),
                    ],
                  ),
                ),

                login_signupButton("Login", () async{

                  try{
                    final UserCredential? user= await _auth.signInWithEmailAndPassword(email: email, password: password);

                    User? signedUser=user?.user;
                    if (signedUser!= null){
                      print("hello");
                      //navigate
                    }

                  }on FirebaseAuthException
                  catch(e)
                  {
                  if(e.code=='user-not-found'||e.code=="wrong-password"){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("Wrong credentials!"),
                        actions: [
                          TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Ok"))
                        ],
                      );
                    }
                    );
                  }



                    print(e);
                  }


                }),
                Container(
                  height: 15,
                ),
                Text("or log in with ", style: ktype_of_Textfield),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0, vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      buildGestureDetector(
                          "images/google-icon-svgrepo-com.svg", () async{

                        try{
                          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
                          final GoogleSignInAuthentication? googleAuth= await googleUser?.authentication;
                          final AuthCredential credential = GoogleAuthProvider.credential(
                              accessToken: googleAuth?.accessToken,
                              idToken:googleAuth?.idToken
                          );
                          final UserCredential userCredential = await _auth.signInWithCredential(credential);
                          final User? user= userCredential.user;

                          if(
                          user!=null
                          ){

                            print("hello") ;

                          }

                        }

                        catch(e){

                          print("Exception: $e");
                        }


                      }),


                      Container(
                        width: 22,
                      ),
                      buildGestureDetector(
                          "images/twitter-svgrepo-com (1).svg", () async{
try{
  final twitterLogin = new TwitterLogin(
      apiKey: '<your consumer key>',
      apiSecretKey:' <your consumer secret>',
      redirectURI: '<your_scheme>://'
  );
  final authResult = await twitterLogin.login();
  final twitterAuthCredential = TwitterAuthProvider.credential(
    accessToken: authResult.authToken!,
    secret: authResult.authTokenSecret!,
  );
  final UserCredential userCredential =await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
  User? user=userCredential.user;
  if(user!=null)
  {
    print("hello");
  }
}
                        catch(e){

                        print("Exception thrown $e");

                        }

                      }),
                      Container(
                        width: 22,
                      ),
                      buildGestureDetector(
                          "images/facebook-svgrepo-com.svg", () async{

                        try{
                          final LoginResult loginResult=await FacebookAuth.instance.login();

                          final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
                          final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
                          User? user=userCredential.user;

                          if(user!=null)
                          {
                            print("hello");
                          }

                        }
                        catch(e){

                          print("Exception thrown $e");

                        }











                      }),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),
                    //  SizedBox(width: 5,),


                    Outlined_signupButton("Sign up!", () {
                      Navigator.pushNamed(context, signUP.id);
                    },)
                  ],
                ),
                Container(
                  height: 20,
                ),

              ],
            ),
          ),

        )
    );
  }
}








