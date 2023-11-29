import 'package:jobsfinder/core/app_export.dart';
import 'package:jobsfinder/core/widgets/custom_elevated_button.dart';
import 'package:jobsfinder/core/widgets/custom_outlined_button.dart';
import 'package:jobsfinder/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:jobsfinder/feature/viewmodel/user_view_model.dart';

// ignore_for_file: must_be_immutable
class SignUpCreateAcountScreen extends StatefulWidget {
  SignUpCreateAcountScreen({Key? key}) : super(key: key);

  @override
  State<SignUpCreateAcountScreen> createState() =>
      _SignUpCreateAcountScreenState();
}

class _SignUpCreateAcountScreenState extends State<SignUpCreateAcountScreen> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserViewModel uVM = UserViewModel();
  bool isFoundmail = false;
  @override
  void initState() {
    super.initState();
    uVM.readAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70002,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 24, top: 13, right: 24, bottom: 13),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgGroup162799,
                              height: getSize(24),
                              width: getSize(24),
                              alignment: Alignment.centerLeft,
                              onTap: () {
                                onTapImgImage(context);
                              }),
                          Padding(
                              padding: getPadding(top: 44),
                              child: Text("Create account",
                                  style: theme.textTheme.headlineSmall)),
                          Padding(
                              padding: getPadding(top: 11),
                              child: Text("Lorem ipsum dolor sit amet",
                                  style:
                                      CustomTextStyles.titleMediumBluegray400)),
                          CustomOutlinedButton(
                              height: getVerticalSize(56),
                              text: "Continue with Google",
                              margin: getMargin(top: 28),
                              leftIcon: Container(
                                  margin: getMargin(right: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgGooglesymbol1)),
                              buttonStyle: CustomButtonStyles.outlinePrimary,
                              buttonTextStyle: theme.textTheme.titleMedium!),
                          CustomOutlinedButton(
                              height: getVerticalSize(56),
                              text: "Continue with Apple",
                              margin: getMargin(top: 16),
                              leftIcon: Container(
                                  margin: getMargin(right: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgIconApple)),
                              buttonStyle: CustomButtonStyles.outlinePrimary,
                              buttonTextStyle: theme.textTheme.titleMedium!),
                          Padding(
                              padding: getPadding(left: 33, top: 26, right: 33),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 8, bottom: 8),
                                        child: SizedBox(
                                            width: getHorizontalSize(62),
                                            child: Divider())),
                                    Padding(
                                        padding: getPadding(left: 12),
                                        child: Text("Or continue with",
                                            style: CustomTextStyles
                                                .titleSmallBluegray300)),
                                    Padding(
                                        padding: getPadding(top: 8, bottom: 8),
                                        child: SizedBox(
                                            width: getHorizontalSize(74),
                                            child: Divider(
                                                indent: getHorizontalSize(12))))
                                  ])),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(top: 28),
                                  child: Text("Email",
                                      style:
                                          CustomTextStyles.titleSmallPrimary))),
                          CustomTextFormField(
                              autovalid: AutovalidateMode.onUserInteraction,
                              controller: emailController,
                              validator: (value) => _validateEmail(value!),
                              margin: getMargin(top: 9),
                              hintText: "Enter your email address",
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray400,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              contentPadding: getPadding(
                                  left: 12, top: 15, right: 12, bottom: 15)),
                          CustomElevatedButton(
                              text: "Continue with Email",
                              margin: getMargin(top: 40),
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  onTapContinuewith(
                                      context, emailController.text);
                                }
                              }),
                          Padding(
                              padding: getPadding(left: 40, top: 28, right: 40),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already have an account?",
                                        style: CustomTextStyles
                                            .titleMediumBluegray300),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtLargelabelmediu(context);
                                        },
                                        child: Padding(
                                            padding: getPadding(left: 3),
                                            child: Text(" Login",
                                                style: theme
                                                    .textTheme.titleMedium)))
                                  ])),
                          Container(
                              width: getHorizontalSize(245),
                              margin: getMargin(
                                  left: 40, top: 84, right: 40, bottom: 5),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "By signing up you agree to our ",
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
                                  textAlign: TextAlign.center))
                        ])))));
  }

  onTapImgImage(BuildContext context) {
    Navigator.pop(context);
  }

  onTapContinuewith(BuildContext context, Object arg) {
    Navigator.pushNamed(context, AppRoutes.signUpCompleteAccountScreen,
        arguments: arg);
  }

  onTapTxtLargelabelmediu(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  _validateEmail(String value) {
    if (!value!.isEmpty) {
      if (isValidEmail(value)) {
        return List.generate(uVM.allUsers.length, (index) => uVM.allUsers[index].email)
                .contains(value)
            ? "Email Found Before"
            : null;
      } else
        return "Email not Correct";
    } else {
      return "Email is Empty";
    }
  }
}
