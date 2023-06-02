import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';



class dash extends StatefulWidget {

static const String id ="/dash";

  @override
  State<dash> createState() => _dashState();
}

class _dashState extends State<dash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
appBar:buildAppBar(),
      body: buildSingleChildScrollView(),
    );
  }


  Widget buildSingleChildScrollView() => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const SizedBox(height: 10),
          const   Text(
            "Hello, xxxxxx!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        const  SizedBox(height: 10),
          const Text(
            "What would you like,",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const  SizedBox(height: 5),
          const Row(
            children: [
              Text(
                "to cook",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "today?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(yellowTheme),
                ),
              ),


            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              buildSearchbar(),
              const SizedBox(
            width: 10,
          ),
              const  IconButton(
                onPressed: null, icon: Icon(Icons.filter_alt ),
              iconSize: 30,
              ),
              
            ],
          ),

          const SizedBox(
            height: 10,
          ),
         const Text(
            "Recommended Recipes",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),


        ],
      ),
    ),
  );



















  Container buildSearchbar() {
    return Container(
          width: 250,
          height: 40,
          child: const TextField(
              style: TextStyle(
                color:Colors.white,
              ),
              cursorColor: Color(yellowTheme),
              textAlign: TextAlign.left,
              onChanged:null,
              decoration: InputDecoration(

                prefixIcon: Padding(
                  padding: EdgeInsets.only(right:5,left: 10),

child:IconButton(
color: Colors.grey,
icon: Icon(
  Icons.search
),
onPressed: null,
)

                ),

                filled: true,
                fillColor: Colors.white70,

                hintText: "Search recipes",

                hintStyle: TextStyle(

                  color: Colors.black,

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
                      color: Color(yellowTheme), width: 2.0),

                  borderRadius: BorderRadius.all(Radius.circular(32.0)),

                ),

                // cursorColor: Color,

              )
          ),
        );
  }


















  AppBar buildAppBar() => AppBar(
    backgroundColor:Colors.white ,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
          Icons.menu,
        color: Color(yellowTheme),


      ), onPressed: () {
        //pull down a drawer
    },

    ),

  );
}
