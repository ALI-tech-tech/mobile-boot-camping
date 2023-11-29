import 'package:jobsfinder/core/app_export.dart';
import 'package:jobsfinder/core/localdatabase/entities/user.dart';
import 'package:jobsfinder/core/widgets/custom_elevated_button.dart';
import 'package:jobsfinder/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:jobsfinder/feature/viewmodel/user_view_model.dart';

import '../../../core/validation.dart';

// ignore_for_file: must_be_immutable
class SignUpCompleteAccountScreen extends StatefulWidget {
  SignUpCompleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<SignUpCompleteAccountScreen> createState() =>
      _SignUpCompleteAccountScreenState();
}

class _SignUpCompleteAccountScreenState
    extends State<SignUpCompleteAccountScreen> {

  

  TextEditingController firstNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  UserViewModel uVM=UserViewModel();
  bool obsecure1 = true;
  bool obsecure2 = true;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uVM.readAllUsers();
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
                                child: Text("First Name",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                controller: firstNameController,
                                margin: getMargin(top: 9),
                                hintText: "Enter your first name",
                                validator: (value) => MyValidate.validateName(
                                    value!, 3, "Enter name, 3 char at least"),
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                contentPadding: getPadding(
                                    left: 12, top: 15, right: 12, bottom: 15)),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Last Name",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                controller: lastNameController,
                                validator: (value) => MyValidate.validateName(
                                    value!, 3, "Enter name, 3 char at least"),
                                margin: getMargin(top: 9),
                                hintText: "Enter your last name",
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                contentPadding: getPadding(
                                    left: 12, top: 15, right: 12, bottom: 15)),
                            Padding(
                                padding: getPadding(top: 33),
                                child: Text("User Name",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                              autovalid:AutovalidateMode.onUserInteraction ,
                                controller: userNameController,
                                margin: getMargin(top: 9),
                                hintText: "Enter your Username",
                                validator: (value) =>  List.generate(
                                  uVM.allUsers.length, (index) => 
                                uVM.allUsers[index].userName).contains(value)
                                ?"username was found":null,
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                contentPadding: getPadding(
                                    left: 12, top: 15, right: 12, bottom: 15)),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text(" Password",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                controller: passwordController,
                                margin: getMargin(top: 9),
                                hintText: "Create a password",
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                validator: (value) => MyValidate.validatePass(
                                    value!,
                                    7,
                                    "Enter emil,at least 7 char !!!"),
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                  onTap: () {
                                    obsecure1 = !obsecure1;
                                    setState(() {});
                                  },
                                  child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 14,
                                          right: 16,
                                          bottom: 14),
                                      child: !obsecure1
                                          ? Icon(
                                              Icons.visibility_sharp,
                                              color: appTheme.black900,
                                              size: 24,
                                            )
                                          : CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgCheckmark)),
                                ),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(52)),
                                obscureText: obsecure1,
                                contentPadding:
                                    getPadding(left: 16, top: 15, bottom: 15)),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Repeat Password",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                               // autovalid: AutovalidateMode.onUserInteraction,
                                controller: repasswordController,
                                validator: (value) =>
                                    value != passwordController.text
                                        ? "password not same above"
                                        : null,
                                margin: getMargin(top: 9),
                                hintText: "Write your password",
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                  onTap: () {
                                    obsecure2 = !obsecure2;
                                    setState(() {});
                                  },
                                  child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 14,
                                          right: 16,
                                          bottom: 14),
                                      child: !obsecure2
                                          ? Icon(
                                              Icons.visibility_sharp,
                                              color: appTheme.black900,
                                              size: 24,
                                            )
                                          : CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgCheckmark)),
                                ),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(52)),
                                obscureText: obsecure2,
                                contentPadding:
                                    getPadding(left: 16, top: 15, bottom: 15)),
                            CustomElevatedButton(
                              text: "Continue",
                              margin: getMargin(top: 40),
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              onTap: ()async {
                                if (_formKey.currentState!.validate()) {
                                  String email = ModalRoute.of(context)
                                      ?.settings
                                      .arguments as String;
                                  User newUser = User(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      email: email,
                                      userName: userNameController.text,
                                      password: passwordController.text,
                                      isActive: true,
                                      userTypeId: 3);
                                    newUser.id = await uVM.createNewUser(newUser);
                                  onTapContnueBtn(context, newUser);
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

  onTapImgImage(BuildContext context) {
    Navigator.pop(context);
  }

  onTapTxtLargelabelmediu(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  onTapContnueBtn(BuildContext context, Object arg) {
    Navigator.pushReplacementNamed(context, AppRoutes.enterOtpScreen, arguments: arg);
  }
}
