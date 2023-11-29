import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:jobsfinder/core/app_export.dart';
import 'package:jobsfinder/core/localdatabase/entities/user.dart';
import 'package:jobsfinder/core/localdatabase/entities/work_type.dart';
import 'package:jobsfinder/core/widgets/custom_elevated_button.dart';
import 'package:jobsfinder/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:jobsfinder/helpers/db_helper.dart';

import '../../../core/localdatabase/entities/company.dart';
import '../../../core/validation.dart';
import '../../../core/widgets/custom_drop_down.dart';
import '../../viewmodel/worktype_view_model.dart';

// ignore_for_file: must_be_immutable
class CompleteCompanySignUp extends StatefulWidget {
  CompleteCompanySignUp({Key? key}) : super(key: key);

  @override
  State<CompleteCompanySignUp> createState() => _CompleteCompanySignUpState();
}

class _CompleteCompanySignUpState extends State<CompleteCompanySignUp> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController workController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formworkKey = GlobalKey<FormState>();
  XFile? imageProfile;
  XFile? imageIDCard;
  WorkTypeViewModel wtVM = WorkTypeViewModel();
  final ImagePicker picker = ImagePicker();
  int worktype_ID = 0;
  DateTime? selectedDate;
  
  @override
  void initState() {
    super.initState();
    
  }

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
                                padding: getPadding(top: 33),
                                child: Text("Company Name",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                validator: (value) => MyValidate.validateName(
                                    value!, 5, "Company name 5 char at least"),
                                controller: companyNameController,
                                margin: getMargin(top: 9),
                                hintText: "Enter Company name",
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
                                padding: getPadding(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Work Type",
                                        style: theme.textTheme.titleSmall),
                                    IconButton(
                                        onPressed: () async {
                                          bool? res =
                                              await _addworktypeDialog(context);
                                          if (res != null && res) {
                                            setState(() {});
                                          }
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: appTheme.blueGray40001,
                                        )),
                                  ],
                                )),
                            FutureBuilder(
                              future: wtVM.readAllWorkType(),
                              builder: (context, snapshot) {
                                return CustomDropDown(
                                    icon: Container(
                                        margin: getMargin(left: 10, right: 24),
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownGray900)),
                                    margin: getMargin(top: 7),
                                    hintText: "Ex: Human Resource",
                                    hintStyle:
                                        CustomTextStyles.titleMediumBluegray400,
                                    items: List.generate(wtVM.all.length,
                                        (index) => wtVM.all[index].name),
                                    onChanged: (value) async {
                                      worktype_ID =
                                          await wtVM.getIdWorkType(value);

                                      setState(() {});
                                    });
                              },
                            ),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text(" Website",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                validator: (value) => MyValidate.validateName(
                                    value!, 10, "Write Full Link"),
                                controller: websiteController,
                                margin: getMargin(top: 9),
                                hintText: "Website link",
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(52)),
                                contentPadding:
                                    getPadding(left: 16, top: 15, bottom: 15)),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Establish Date ",
                                    style: theme.textTheme.titleSmall)),
                            CustomElevatedButton(
                              text: "Choose Date",
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallBluegray400,
                              margin: getMargin(top: 14),
                              buttonStyle: CustomButtonStyles.fillBlueGray,
                              onTap: () async {
                                dateTimePickerWidget(context);
                              },
                            ),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text(" Image Profile",
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
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text(" Image ID Card",
                                    style: theme.textTheme.titleSmall)),
                            CustomElevatedButton(
                              text: "Uploud Image",
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallBluegray400,
                              margin: getMargin(top: 14),
                              buttonStyle: CustomButtonStyles.fillBlueGray,
                              onTap: () async {
                                imageIDCard =
                                    await getImage(ImageSource.gallery);
                              },
                            ),
                            CustomElevatedButton(
                              text: "Continue",
                              margin: getMargin(top: 40),
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (imageProfile != null &&
                                      imageIDCard != null) {
                                    final imageBytes1 =
                                        await imageProfile!.readAsBytes();
                                    final imageBytes2 =
                                        await imageIDCard!.readAsBytes();
                                        User user=ModalRoute.of(context)
                                      ?.settings
                                      .arguments as User; 
                                    Company company=Company(
                                      Userid: user.id,
                                      name: companyNameController.text,
                                       description: descriptionController.text,
                                        workTypeId: worktype_ID,
                                        establishDate: selectedDate!.format('yyyy-MM-dd', 'en_US'),
                                        website: websiteController.text,
                                        image: Uint8List.fromList(imageBytes1),
                                        idCard: Uint8List.fromList(imageBytes2));
                                        DBHelper.database.companydao.insertCompany(company);
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

  dateTimePickerWidget(BuildContext context) async {
    
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData().copyWith(
          
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(theme.colorScheme.primary), // Change button text color
              // overlayColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.2))
              )),
          primaryColor: theme.colorScheme.primary,
          datePickerTheme: DatePickerThemeData(
            headerBackgroundColor: theme.colorScheme.primary,
            todayBackgroundColor: MaterialStatePropertyAll(theme.colorScheme.primary),
            
          )
        ),
        
        child: child!,
      );
    },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    return img;
  }

  onTapImgImage(BuildContext context) {
    Navigator.pop(context);
  }

  onTapTxtLargelabelmediu(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  onTapContnueBtn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  _addworktypeDialog(BuildContext context) async {
    workController.clear();
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Add New Type",
            style: CustomTextStyles.titleMediumBold,
          ),
          content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Form(
              key: _formworkKey,
              child: CustomTextFormField(
                width: 200,
                validator: (value) =>
                    MyValidate.validateName(value!, 2, "Write any thing"),
                controller: workController,
                margin: getMargin(top: 9),
                hintText: "Work Type",
                hintStyle: CustomTextStyles.titleMediumBluegray400,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                suffixConstraints:
                    BoxConstraints(maxHeight: getVerticalSize(52)),
                contentPadding: getPadding(left: 16, top: 15, bottom: 15),
              ),
            ),
          ),
          actions: [
            CustomElevatedButton(
              width: 130,
              text: "Add",
              buttonStyle: CustomButtonStyles.fillPrimary,
              onTap: () {
                if (_formworkKey.currentState!.validate()) {
                  DBHelper.database.worktypedao
                      .insertWorkType(WorkType(name: workController.text));
                  Navigator.pop(context, true);
                }
              },
            ),
            CustomElevatedButton(
              width: 130,
              text: "Close",
              buttonStyle: CustomButtonStyles.fillPrimary,
              onTap: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}
