import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/blackbuttton.dart';
import 'package:flutter_practis/finalproject/core/widgets/radios.dart';
import 'package:flutter_practis/finalproject/features/view/paymentmethod.dart';

class CustomPlan extends StatefulWidget {
  static String rout = "/customplan";
  CustomPlan({super.key});

  @override
  State<CustomPlan> createState() => _CustomPlanState();
}

class _CustomPlanState extends State<CustomPlan> {
  List<String> durations = ["07 days", "15 days", "01 month", "01 year"];
  List<String> qualtiy = ["Good", "Better", "Best"];
  int value = 1;
  String? gvalue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gvalue = durations[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text("Custom Plan"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        color: Color.fromARGB(255, 45, 45, 45),
        margin: EdgeInsets.only(
          top: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Radios(title: "DURATION", items: durations),
            Divider(
              height: 50.0,
              color: Colors.white,
            ),
            Radios(title: "VEDIO QUALITY", items: qualtiy),
            Divider(
              height: 50.0,
              color: Colors.white,
            ),
            Text("DEVICE"),
            Text("screens you can watch on at\n the same time"),
            SizedBox(
              width: MediaQuery.of(context).size.width-10,
              child: DropdownButton(
                  
                  value: value,
                  items:  List.generate(
                      10,
                      (index) => DropdownMenuItem(

                          value: index, child: Container(
                            width:MediaQuery.of(context).size.width-80 ,
                            child: Text("${index}")
                            )
                            
                            )
                            ),
                  onChanged: (v) {
                    value = v!;
                    setState(() {
                      
                    });
                  }),
            ),
            Divider(
              height: 50.0,
              color: Colors.white,
            ),
            Radios(title: "CANCEL AT ANY TIME", items: ["Yes", "NO"]),
            Divider(
              height: 50.0,
              color: Colors.white,
            ),
            BlackButton(title: "Continue ${"\$89"}", callback: () {
              Navigator.pushNamed(context, PaymentMethod.rout);
            }),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("By Sign Up you agree to our privacy "),
                  Text("Policy and Terms", style: TextStyle(color: Colors.amber),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
