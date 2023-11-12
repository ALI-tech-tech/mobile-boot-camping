import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practis/TalkahApp/core/widget/custom_arrow_back.dart';
import 'package:flutter_practis/TalkahApp/core/widget/custom_button_tawseel.dart';
import 'package:flutter_practis/TalkahApp/core/widget/custom_text_feild.dart';
import 'package:flutter_svg/svg.dart';


class DwaeePage extends StatefulWidget {
  const DwaeePage({super.key});

  @override
  State<DwaeePage> createState() => _DwaeePageState();
}

class _DwaeePageState extends State<DwaeePage> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: const Color(0xffdf6f7fb),
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: _pinned,
                  snap: _snap,
                  floating: _floating,
                  toolbarHeight: 92,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(children: [
                      Image(
                          image: AssetImage(
                              "assets/images/app-bar-background-top.png")),
                      Positioned(
                        top: 23,
                        right: 5,
                        child: CustomArrowBack(),
                      ),
                      Positioned(
                        top: 35,
                        right: MediaQuery.of(context).size.width / 2.4,
                        child:
                        Text("دوائي",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xffdffffff),
                                fontWeight: FontWeight.w400)),
                      ),
                    ]),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Stack(children: [
                    Image(
                        image: AssetImage(
                            "assets/images/app-bar-background-bottom.png")),
                    Positioned(
                        top: 42,
                        right: 20,
                        child: CustomButtonTawseel(image: "assets/icons/location.svg",title: "التوصيل إلى",
                            color: Color(0xffdffffff),
                            width: 370,
                            height: 70,
                            redus: 10,
                            colorTxt: Color(0xffd484e5a),
                            colorIcon: Color(0xffd484e5a)))
                  ]),
                ),
                SliverList(
                  delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset("assets/icons/note.svg"),
                                        SizedBox(width: 5,),
                                        Text("إسم الدواء",style: TextStyle(color: Color(0xffd484e5a),fontSize: 17)),
                                        SizedBox(width: 5,),
                                        Text("(إختياري)",style: TextStyle(color: Color(0xffd656e7e),fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Divider(thickness: 2,color: Colors.grey.withOpacity(0.2),),
                                  SizedBox(height: 10,),
                                  CustomTextField(label: "يرجى كتابة إسم الدواء",color: Colors.grey.withOpacity(0.1)),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset("assets/icons/gallery.svg",height: 20,),
                                        SizedBox(width: 5,),
                                        Text("صور العلاج أو الروشته",style: TextStyle(color: Color(0xffd484e5a),fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Divider(thickness: 2,color: Colors.grey.withOpacity(0.2),),
                                  SizedBox(height: 10,),

                                  SizedBox(height: 10,)
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset("assets/icons/3square.svg"),
                                        SizedBox(width: 5,),
                                        Text("العدد المطلوب",style: TextStyle(color: Color(0xffd484e5a),fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Divider(thickness: 2,color: Colors.grey.withOpacity(0.2),),
                                  SizedBox(height: 10,),
                                  CustomTextField(label: "1",color: Colors.grey.withOpacity(0.1)),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset("assets/icons/note.svg"),
                                        SizedBox(width: 5,),
                                        Text("ملاحظات",style: TextStyle(color: Color(0xffd484e5a),fontSize: 17)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Divider(thickness: 2,color: Colors.grey.withOpacity(0.2),),
                                  SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),//color: widget.color),
                        child: TextField(textAlign: TextAlign.start,decoration: InputDecoration(focusColor: Colors.white,fillColor: Colors.white,hintText: "widget.label",hintStyle: TextStyle(color: Color(0xffd656e7e).withOpacity(0.5)),border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),),style: TextStyle(color: Color(0xffd484e5a)),),
                      ),
                                  TextField(maxLines: 8,textAlign: TextAlign.start,decoration: InputDecoration(focusColor: Colors.white,fillColor: Colors.white,hintText: "يرجى كتابة الاسم العلمي أو التجاري للدواء",hintStyle: TextStyle(color: Color(0xffd656e7e).withOpacity(0.5)),border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),),style: TextStyle(color: Color(0xffd484e5a)),),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, childCount: 1),
                ),
              ],
            ),
          ),
        ));
  }
}
