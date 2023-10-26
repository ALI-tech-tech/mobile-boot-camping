import 'package:flutter/material.dart';
import 'package:flutter_practis/finalproject/core/widgets/backgroundpages.dart';
import 'package:flutter_practis/finalproject/features/view/Categorypayment.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCode extends StatefulWidget {
  static String rout="/pincode";
   PinCode({Key? key}) : super(key: key);

  @override
  State<PinCode> createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: const Text('VERIFICATION CODE'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mainBackground(context),
      
           Padding(
             padding: const EdgeInsets.only(left:30, right: 30),
             child: Column(
              children: [
                 SizedBox(height: 30,),
              SizedBox(
                height:70 ,
                child: PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.black,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: textEditingController,
                  onCompleted: (v) {
                    debugPrint("Completed");
                    Navigator.pushNamed(context, CategoryPayment.rout);
                  },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didnot receive it?"),
              InkWell(
                onTap: () {
                  
                },
                child: Text(" Click here"),
              )
                ],
              )
              ],
             ),
           )
          
          ],
        ),
      ),
    );
  }
}