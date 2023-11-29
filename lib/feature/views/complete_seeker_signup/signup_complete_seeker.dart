import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:jobsfinder/core/app_export.dart';
import 'package:jobsfinder/core/localdatabase/entities/education.dart';
import 'package:jobsfinder/core/localdatabase/entities/seeker.dart';
import 'package:jobsfinder/core/widgets/custom_elevated_button.dart';
import 'package:jobsfinder/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:jobsfinder/core/widgets/datetimepicker.dart';
import 'package:jobsfinder/helpers/db_helper.dart';

import '../../../core/localdatabase/entities/user.dart';
import '../../../core/validation.dart';
import '../../../core/widgets/custom_drop_down.dart';

// ignore_for_file: must_be_immutable
class CompleteSeekerSignUp extends StatefulWidget {
  CompleteSeekerSignUp({Key? key}) : super(key: key);

  @override
  State<CompleteSeekerSignUp> createState() => _CompleteSeekerSignUpState();
}

class _CompleteSeekerSignUpState extends State<CompleteSeekerSignUp> {
  TextEditingController degreeNameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController majorController = TextEditingController();
  TextEditingController univerController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? imageProfile;
  DateTime? startdate;
  DateTime? enddate;

  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 24, top: 13, right: 24, bottom: 13),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgGroup162799,
                                height: getSize(24),
                                width: getSize(24),
                                onTap: () {
                                  onTapImgImage(context);
                                }),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: getPadding(top: 47, right: 15),
                                    child: Text("Complete your account",
                                        style: theme.textTheme.headlineSmall))),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: getPadding(top: 9),
                                    child: Text("Lorem ipsum dolor sit amet",
                                        style: CustomTextStyles
                                            .titleSmallBluegray400_1))),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Major",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                validator: (value) => MyValidate.validateName(
                                    value!, 2, "Write your major"),
                                controller: majorController,
                                margin: getMargin(top: 9),
                                hintText: "major",
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(52)),
                                contentPadding:
                                    getPadding(left: 16, top: 15, bottom: 15)),
                            Padding(
                                padding: getPadding(top: 33),
                                child: Text("Degree Name",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                validator: (value) => MyValidate.validateName(
                                    value!, 5, "Company name 5 char at least"),
                                controller: degreeNameController,
                                margin: getMargin(top: 9),
                                hintText: "Enter Degree name",
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                contentPadding: getPadding(
                                    left: 12, top: 15, right: 12, bottom: 15)),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Desciption",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                controller: descriptionController,
                                validator: (value) => MyValidate.validateName(
                                    value!, 30, "Write more!!! "),
                                maxLines: 7,
                                margin: getMargin(top: 9),
                                hintText: "Enter Desciption",
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                contentPadding: getPadding(
                                    left: 12, top: 15, right: 12, bottom: 15)),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Univercity",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                controller: univerController,
                                validator: (value) => MyValidate.validateName(
                                    value!, 10, "Write more!!! "),
                                margin: getMargin(top: 9),
                                hintText: "Enter Univercity name",
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                contentPadding: getPadding(
                                    left: 12, top: 15, right: 12, bottom: 15)),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Start Date",
                                    style: theme.textTheme.titleSmall)),
                            CustomElevatedButton(
                              text:(startdate==null? "Start Date":startdate!.format('yyyy-MM-dd', 'en_US')).toString(),
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallBluegray400,
                              margin: getMargin(top: 14),
                              buttonStyle: CustomButtonStyles.fillBlueGray,
                              onTap: () async {
                                startdate= await DatePic.dateTimePickerWidget(context);
                              },
                            ),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("End Date",
                                    style: theme.textTheme.titleSmall)),
                            CustomElevatedButton(
                              text:(enddate==null?"End Date":enddate!.format('yyyy-MM-dd', 'en_US')).toString(),
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallBluegray400,
                              margin: getMargin(top: 14),
                              buttonStyle: CustomButtonStyles.fillBlueGray,
                              onTap: () async {
                                enddate= await DatePic.dateTimePickerWidget(context);
                              },
                            ),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Image Profile",
                                    style: theme.textTheme.titleSmall)),
                            CustomElevatedButton(
                              text: "Uploud Image",
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallBluegray400,
                              margin: getMargin(top: 14),
                              buttonStyle: CustomButtonStyles.fillBlueGray,
                              onTap: () async {
                                imageProfile =
                                    await getImage(ImageSource.gallery);
                              },
                            ),
                            CustomElevatedButton(
                              text: "Continue",
                              margin: getMargin(top: 40),
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (imageProfile != null) {
                                    User user = ModalRoute.of(context)?.settings.arguments as User;
                                    await _addseeker(user);
                                    onTapContnueBtn(context);
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text("Choose Images First")),
                                        actions: [
                                          CustomElevatedButton(
                                            text: "Close",
                                            buttonStyle:
                                                CustomButtonStyles.fillPrimary,
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: getPadding(
                                        left: 40, top: 28, right: 40),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Already have an account?",
                                              style: CustomTextStyles
                                                  .titleMediumBluegray300),
                                          GestureDetector(
                                              onTap: () {
                                                onTapTxtLargelabelmediu(
                                                    context);
                                              },
                                              child: Padding(
                                                  padding: getPadding(left: 3),
                                                  child: Text(" Login",
                                                      style: theme.textTheme
                                                          .titleMedium)))
                                        ]))),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: getHorizontalSize(245),
                                    margin: getMargin(
                                        left: 40,
                                        top: 19,
                                        right: 40,
                                        bottom: 5),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  "By signing up you agree to our ",
                                              style: CustomTextStyles
                                                  .titleSmallBluegray400SemiBold),
                                          TextSpan(
                                              text: "Terms",
                                              style: CustomTextStyles
                                                  .titleSmallErrorContainer),
                                          TextSpan(
                                              text: " and ",
                                              style: CustomTextStyles
                                                  .titleSmallBluegray400SemiBold),
                                          TextSpan(
                                              text: "Conditions of Use",
                                              style: CustomTextStyles
                                                  .titleSmallErrorContainer)
                                        ]),
                                        textAlign: TextAlign.center)))
                          ]),
                    )))));
  }

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    return img;
  }

  onTapImgImage(BuildContext context) {
    Navigator.pop(context);
  }

  _addseeker(User user) async {
    final imageBytes1 = await imageProfile!.readAsBytes();
    
    Seeker seeker = Seeker(
        userId: user.id!,
        image: Uint8List.fromList(imageBytes1),
        descrip: descriptionController.text);
    int? id= await DBHelper.database.seekerdao.insertSeeker(seeker);
    if (id!=null) {
    Education ed=Education( 
      seekerId: id,
       degreeName: degreeNameController.text,
        major: majorController.text,
         instituteUniversityName: univerController.text,
          startDate: startdate!.format('yyyy-MM-dd', 'en_US'),
           completionDate: enddate!.format('yyyy-MM-dd', 'en_US'));
    await DBHelper.database.educatiodao.insertEducation(ed);
    }

  }

  onTapTxtLargelabelmediu(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  onTapContnueBtn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
