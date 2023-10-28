import 'package:flutter/material.dart';
import 'package:flutter_practis/day31/homework/movieapp/Theme/Textstyle.dart';
import 'package:flutter_practis/finalproject/features/view/personalaccount.dart';
import 'package:flutter_practis/finalproject/features/view/subscribtion.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: ListView(

        padding: EdgeInsets.only(top: 100, left: 30),
        children: [
          ListTile(
            leading: InkWell(
              onTap: (){
                Navigator.pushNamed(context, PersonalAccount.rout);
              },
              child: CircleAvatar(
                
                backgroundImage: AssetImage("assets/images/ali.JPG"),
              ),
            ),
            title: Text("ALi Ben Jahlan" ,style: TextStyleTheme.hiheadertext(),),
            subtitle: Text("alibenjhlan@gmail.com", style: TextStyleTheme.headertext(),),
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, PersonalAccount.rout);
            },
            leading: Icon(Icons.person_2_sharp,color: Colors.white,),
            title: Text("Myaccount",style: TextStyleTheme.hiheadertext(),),
          ),
          ListTile(
            leading: Icon(Icons.group,color: Colors.white),
            title: Text("About Us",style: TextStyleTheme.hiheadertext(),),
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, SbScribtionPlansUser.rout);
            },
            leading: Icon(Icons.subscriptions,color: Colors.white),
            title: Text("My Subscription",style: TextStyleTheme.hiheadertext(),),
          ),
          ListTile(
            leading: Icon(Icons.support,color: Colors.white),
            title: Text("Support",style: TextStyleTheme.hiheadertext(),),
          ),
          ListTile(
            leading: Icon(Icons.radar_outlined,color: Colors.white),
            title: Text("Rate Us",style: TextStyleTheme.hiheadertext(),),
          ),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.white),
            title: Text("Sign Out",style: TextStyleTheme.hiheadertext(),),
          ),
        ],
      ),
    );

    //     Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         CircleAvatar(
    //           backgroundImage: AssetImage("assets/images/ali.JPG"),
    //         ),
    //         Expanded(
    //             child: Container(
    //                 child: ListTile(
    //           title: Text("ALi Ben Jahlan"),
    //           subtitle: Text("alibenjhlan@gmail.com"),
    //         )))
    //       ],
    //     )
    //   ],
    // ));
  }
}
