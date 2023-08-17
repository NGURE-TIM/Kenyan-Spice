import 'package:flutter/material.dart';
import 'package:east_african_spice/Dashboard/articles.dart';


class Select extends ChangeNotifier{
  bool Status1 = true;
  bool Status2 = false;
  bool Status3 = false;

 getStatus (int num) {

 if(num==2 && Status1==true && Status2==false && Status3==false )
   {
     Status1=false;
     Status2 = true;
     Status3 = false;

   }
else if (num==3 &&Status1==true && Status2==false && Status3==false)
{
  Status1=false;
  Status2 = false;
  Status3 = true;

}
 else if (num==1 && Status1==false && Status2==true && Status3==false)
 {
   Status1=true;
   Status2 = false;
   Status3 = false;
 }
 else if (num==3 && Status1==false && Status2==true && Status3==false)
 {
   Status1=false;
   Status2 = false;
   Status3 = true;
 }
 else if ( num==1 &&  Status1==false && Status2==false && Status3==true)
 {
   Status1=true;
   Status2 = false;
   Status3 = false;
 }
 else if (num==2 && Status1==false && Status2==false && Status3==true)
 {
   Status1=false;
   Status2 = true;
   Status3 = false;
 }


  notifyListeners();
 }


}