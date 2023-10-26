import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/blackbuttton.dart';
import 'package:flutter_practis/finalproject/core/widgets/radiowithicon.dart';
import 'package:flutter_practis/finalproject/features/view/paymentmethodP2.dart';
import 'package:icons_plus/icons_plus.dart';

class PaymentMethod extends StatefulWidget {
  static String rout = "/paymentmethod";
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          title: Text("Payment Method"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
          color: Color.fromARGB(255, 45, 45, 45),
          margin: EdgeInsets.only(
            top: 5,
          ),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start   ,
            children: [
              Text("CHOOSE YOUR PAYMENT METHOD"),
              SizedBox(height: 20,),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Time duration"),
                  Text("15 days"),
                ],),
              ),
              Divider(),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Vedio quality"),
                  Text("Best"),
                ],),
              ),
              Divider(),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Devices"),
                  Text("03"),
                ],),
              ),
              Divider(),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Conect at any time"),
                  Text("yes"),
                ],),
              ),
              SizedBox(height: 50,),
              RadioWithIcon( content: [
                ["Mastercard","Pay from mastercard account using\n mastercard payment getway",Logos.mastercard],
                ["Visa Card","Pay from mastercard account using\n mastercard payment getway",Logos.cc_visa],
                ["Paypal","Pay from mastercard account using\n mastercard payment getway",Logos.paypal],
                
                
                ]),
                BlackButton(title: "Continue ${"\$89"}", callback: (){
                  Navigator.pushNamed(context, PaymentPage.rout);
                })
            ],
          ),
        )
        );
  }
}
