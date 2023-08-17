
import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';
class Buildbottom extends StatefulWidget {
  late PageController pageController;
  int selectedIndex;
  Buildbottom(this.pageController, this.selectedIndex);

  @override
  State<Buildbottom> createState() => _BuildbottomState();
}

class _BuildbottomState extends State<Buildbottom> {

  @override
  Widget build(BuildContext context) {
    return  WaterDropNavBar(
      waterDropColor: Color(yellowTheme),
      backgroundColor: Colors.white70,
      onItemSelected: (int index) {
        setState(() {
          widget.selectedIndex = index;
        });
        widget.pageController.animateToPage(widget.selectedIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutQuad);
      },
      selectedIndex: widget.selectedIndex ,
      barItems: <BarItem>[
        BarItem(
          filledIcon: Icons.bookmark_rounded,
          outlinedIcon: Icons.bookmark_border_rounded,
        ),
        BarItem(
            filledIcon: Icons.favorite_rounded,
            outlinedIcon: Icons.favorite_border_rounded),


      ],
    );
  }
}




















/*

class Buildbottom extends StatefulWidget {


  @override
  State<Buildbottom> createState() => _BuildbottomState();
}

class _BuildbottomState extends State<Buildbottom> {

  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return  BottomNavyBar(
      selectedIndex: selectedIndex,
      onItemSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.blue,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.search),
          title: Text('Discover'),
          activeColor: Colors.green,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favorites'),
          activeColor: Colors.red,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
          activeColor: Colors.yellow,
        ),
      ],
    );
  }
}


 */




