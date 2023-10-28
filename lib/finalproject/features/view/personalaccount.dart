import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/TextFieldform.dart';
import 'package:flutter_practis/finalproject/core/widgets/blackbuttton.dart';

class PersonalAccount extends StatefulWidget {
  static String rout="/personalaccount";
   PersonalAccount({super.key});

  @override
  State<PersonalAccount> createState() => _PersonalAccountState();
}

class _PersonalAccountState extends State<PersonalAccount> {
  TextEditingController cname=TextEditingController();
  TextEditingController cpass=TextEditingController();
  TextEditingController cemail=TextEditingController();
  TextEditingController cnumber=TextEditingController();
  TextEditingController cgender=TextEditingController();

  @override
  void initState() {
    super.initState();
    cname.text="Ali Ben Jahllan";
    cemail.text="alibenjhlan@gmail.com";
    cpass.text="123456789";
    cnumber.text="+96 7715924217";
    cgender.text="male";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EDIT PROFILE"),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 15,
        ),
        color: Color.fromARGB(255, 45, 45, 45),
        margin: EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            
                            borderRadius: BorderRadius.circular(70),
                            image: DecorationImage(image: AssetImage("assets/images/ali.JPG", ), fit: BoxFit.fill)
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 100,
                          child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber
                          ),
                          child: Icon(Icons.camera_alt_sharp, color: Colors.black,)))
                      ],
                    ),
        
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:10),
                padding: EdgeInsets.all(13),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10,),
                    TextFieldForm(controller: cemail, lable: "Email"),
                    TextFieldForm(controller: cname, lable: "Full name"),
                    TextFieldForm(controller: cpass, lable: "Passwrd", pass: true),
                    TextFieldForm(controller: cnumber, lable: "PhonNumber"),
                    TextFieldForm(controller: cgender, lable: "Gender"),
                    SizedBox(height: 180,),
                    BlackButton(title: "SAVE CHANGES", callback: (){})
                    ],
                ),
              ),
              
            ],
          ),
        ),
      ),
      
      
    );
  }
}
