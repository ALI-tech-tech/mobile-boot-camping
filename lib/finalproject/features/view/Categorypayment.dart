import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/blackbuttton.dart';
import 'package:flutter_practis/finalproject/core/widgets/cardcategory.dart';
import 'package:icons_plus/icons_plus.dart';

class CategoryPayment extends StatefulWidget {
  static String rout="/categorypayment";
   CategoryPayment({super.key});

  @override
  State<CategoryPayment> createState() => _CategoryPaymentState();
}

class _CategoryPaymentState extends State<CategoryPayment> {
  List<List<dynamic>> cat=[
    ["VISA",Logos.visa, false],
  ["MasterCard",Logos.mastercard, false],
  ["Paypal",Logos.paypal, false],
  ];
  List<List<dynamic>> expan=[

  ["MasterCard",Logos.mastercard, false],
  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text("CATEGORY"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
          color: Color.fromARGB(255, 45, 45, 45),
          margin: EdgeInsets.only(
            top: 5,
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 10,),
                  itemCount: cat.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      cat.forEach((element) {
                        element[2]=false;
                      });
                      cat[index][2]=!cat[index][2];
                      setState(() {
                        
                      });
                    },
                    child: CardCategory(title: cat[index][0], icon: cat[index][1], choose: cat[index][2])),),
                  
             
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child: Column(
                children: [
                  ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                expan[panelIndex][2]=!isExpanded;
                setState(() {
                  
                });
              },
              children: List.generate(expan.length, (index) => 
              ExpansionPanel(
                
                isExpanded: expan[index][2],
                headerBuilder: (context, isExpanded) {
                return Text(expan[index][0]);
              }, body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Logo(expan[index][1]),
                    Text("***********596"),
                  ],
                ),
              )))
            ),
            SizedBox(height: 10,),
            BlackButton(title: "+ ADD NEW CARD", callback: (){})
                ],
              ),
            ),
         
         
            Text("Total : ${"\$589"}"),
            SizedBox(height: 10,),
            BlackButton(title: "PAY & CONFIRM", callback: (){})
          ],
        ),
      ),
    );
  }
}