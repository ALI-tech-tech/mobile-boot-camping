import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/TextStyles.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/app_colors.dart';
import 'package:flutter_practis/TalkahApp/core/Theme/size.dart';
import 'package:flutter_practis/TalkahApp/core/constant/App_image.dart';
import 'package:flutter_practis/TalkahApp/core/constant/App_name.dart';
import 'package:flutter_practis/TalkahApp/core/utils/App_images.dart';
import 'package:flutter_practis/TalkahApp/core/widget/Containerlogo.dart';
import 'package:flutter_practis/TalkahApp/core/widget/containerbarclippath.dart';
import 'package:flutter_practis/TalkahApp/routes/app_routs.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
        

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ContainerBarClip(context, 200),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Containerlogo(
                          Center(
                              child: Text(
                            "X",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          )),
                          23,
                          46,
                          46),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 26),
                    width: getWidth(context),
                    height: (getHeight(context) / 3) - 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 200,
                          width: getWidth(context) / 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(App_Images.KEY),
                                  fit: BoxFit.fill)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("رمز التحقق", style: App_TextStyle.BodyHeadr,),
                    SizedBox(height: 8,),
                    Text("الى جوالك +967 715924217  \n  يرجى ادخال الرمز المرسل", style: App_TextStyle.Bodycontent,),
                    
                    Text("او سيتم ارسال رسالة الى رقم  الواتساب الخاص بك", style: App_TextStyle.Bodycontent.copyWith(color: Colors.green.withBlue(150)),),

                  
                  ],
                ),
              ),
                SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: SizedBox(
                              height: 70,
                              child: PinCodeTextField(
                                keyboardType: TextInputType.number,
                                length: 6,
                                obscureText: false,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  inactiveColor: Colors.blue,
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                  activeColor: Colors.transparent,
                                  activeFillColor: Colors.blue[800],
                                  selectedColor: Colors.blue,
                                  inactiveFillColor: Colors.transparent,
                                ),
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                backgroundColor: Colors.transparent,
                                enableActiveFill: true,
                                controller: textEditingController,
                                onCompleted: (v) {
                                  debugPrint("Completed");
                                  //Navigator.pushNamed(context, CategoryPayment.rout);
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
                          ),
                          SizedBox(
                            height: 30,
                          ),
                       Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(getWidth(context) - 50, 60),
                      backgroundColor: App_Color.btnlogin,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.appmainscreen);
                    },
                    child: Text("تحقق", style: App_TextStyle.appbarbody,)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("لم يصل الرمز؟ 02:33", style: App_TextStyle.Bodycontent,),
                Text("اعادة ارسال",style: App_TextStyle.Bodycontent,),
              ],),

                        ],
                      ),
                    )
                  
            ],
          ),
        ),
      ),
    );
  }
}
