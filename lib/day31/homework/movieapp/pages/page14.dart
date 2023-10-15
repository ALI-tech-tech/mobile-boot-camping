import 'package:flutter/material.dart';
import 'package:flutter_practis/day31/homework/movieapp/Theme/Textstyle.dart';
import 'package:icons_plus/icons_plus.dart';

class PaymentPage extends StatefulWidget {
  

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Payment Page", style: TextStyleTheme.hiheadertext(),),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image:DecorationImage(image: AssetImage("assets/images/img_thumbnailimage_160x312.png",), fit: BoxFit.fill),
                
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    
                    colors: [
                  Colors.grey.withOpacity(0.2),
                  Colors.grey.withOpacity(0.6),
                  Colors.black.withOpacity(0.8),
                ])
                ),
              ),
            ),
            Expanded(
              child: Container(
                //height: MediaQuery.of(context).size.height/2,
                color: Colors.grey[800],
                padding: EdgeInsets.all(15),
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              maximumSize: Size(600, 50),
                              // backgroundColor: MaterialStatePropertyAll(Colors.grey),
                              // minimumSize: MaterialStatePropertyAll(Size(300, 50)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)))
                            ),
                            onPressed: (){}, child: Text("Pay Now", style: TextStyle(color: Colors.yellow),))
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}