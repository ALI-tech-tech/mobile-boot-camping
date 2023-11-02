import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/blackbuttton.dart';
import 'package:flutter_practis/finalproject/core/widgets/plans.dart';
import 'package:flutter_practis/finalproject/core/widgets/planstylconfirm.dart';
import 'package:flutter_practis/finalproject/features/model/subscripplan.dart';
import 'package:flutter_practis/finalproject/features/view/customplane.dart';

class Subscriptionplan extends StatefulWidget {
  static String rout = "/subscriptionplan";
  const Subscriptionplan({super.key});

  @override
  State<Subscriptionplan> createState() => _SubscriptionplanState();
}

class _SubscriptionplanState extends State<Subscriptionplan> {
  SubscripPlan BASIC = SubscripPlan(
      monthlyprice: "USD 256.99",
      multipledevice: "NO",
      Cancelanytime: "Good",
      resolution: "480p",
      vedioquality: "Good",
      screens: "02");
  SubscripPlan STANDARD = SubscripPlan(
      monthlyprice: "USD 256.99",
      multipledevice: "03",
      Cancelanytime: "Better",
      resolution: "1080p",
      vedioquality: "Better",
      screens: "04");
  SubscripPlan PREMIUM = SubscripPlan(
      monthlyprice: "USD 256.99",
      multipledevice: "06",
      Cancelanytime: "Best",
      resolution: "4k+HDR",
      vedioquality: "Best",
      screens: "06");
  List<dynamic>? title;
  bool isConfirm = false;
  List<bool> isactive = [true, false, false];

  SubscripPlan? b;

  chang(int i) {
    isactive = [false, false, false];
    isactive[i] = !isactive[i];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = [BASIC, STANDARD, PREMIUM];
    b=BASIC;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text("Subscription Plan"),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 15,
        ),
        color: Color.fromARGB(255, 45, 45, 45),
        margin: EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Choose The plan Tahts\n Right For you"),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CustomPlan.rout);
                    },
                    child: Text(
                      "Custom Your plan",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: Text(
                "Downgrad & Upgrade any Time",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < title!.length; i++)
                  TextButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isactive[i] ? Colors.amber : Colors.grey[700],
                          minimumSize: Size(
                              (MediaQuery.of(context).size.width / 3) - 15,
                              80)),
                      onPressed: () {
                        chang(i);
                        b = (title![isactive.indexOf(true)]);
                        setState(() {});
                      },
                      child: Text(
                        title![i].runtimeType.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
              ],
            ),
            isConfirm
                ? PlanStylConfirm(
                    context: context,
                    s: b!,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      plan(
                        context: context,
                        s: BASIC,
                        active: isactive[0],
                      ),
                      plan(
                        context: context,
                        s: STANDARD,
                        active: isactive[1],
                      ),
                      plan(
                        context: context,
                        s: PREMIUM,
                        active: isactive[2],
                      ),
                    ],
                  ),
            SizedBox(
              height: 15,
            ),
            BlackButton(
              title: "CONTINUE",
              callback: () {
                isConfirm = true;

                setState(() {});
              },
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("By Sign Up you agree to our privacy "),
                  Text("Policy and Terms", style: TextStyle(color: Colors.amber)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
