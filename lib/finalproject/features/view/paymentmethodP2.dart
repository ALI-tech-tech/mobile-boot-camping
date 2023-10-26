import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/Textstyle.dart';
import 'package:flutter_practis/finalproject/core/widgets/backgroundpages.dart';
import 'package:flutter_practis/finalproject/core/widgets/blackbuttton.dart';

import 'package:icons_plus/icons_plus.dart';

class PaymentPage extends StatefulWidget {
  static String rout="/paymentP2";

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme ,
        backgroundColor: Colors.grey[800],
        title: Text("Payment Page", style: TextStyleTheme.hiheadertext(),),
      ),
      body: 
      Container(
        child: Column(
          children: [
            mainBackground(context),
      
            Expanded(
              
              child: Container(
                
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(child: Column(
                        children: [
                          SizedBox(height: 50,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("CardNumber",style: TextStyle(color: Colors.white),),Logo(Logos.mastercard) ],),
                          TextFormField(
                            
                          decoration: InputDecoration(
                            hintText: "12345 6789 14545",
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                            
                              borderSide: BorderSide(color: Colors.white)
                            )
                          ),
                          ),
                          SizedBox(height: 10,),
                          Row(children: [Text("Empier date",style: TextStyle(color: Colors.white),), SizedBox(width: 120,),Text("CVV/CVC",style: TextStyle(color: Colors.white),), ],),
                          Row(children: [
                            
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                          
                                                      decoration: InputDecoration(
                                hintText: "12  /  2021",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                          
                                  borderSide: BorderSide(color: Colors.white)
                                )
                                                      ),
                                                      ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                          
                                                      decoration: InputDecoration(
                                hintText: "12  /  2021",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                          
                                  borderSide: BorderSide(color: Colors.white)
                                )
                                                      ),
                                                      ),
                              ),
                            ),
                            
                            
                            ],),
                        SizedBox(height: 100,),
                        BlackButton(title: "Pay Now", callback: (){})
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}