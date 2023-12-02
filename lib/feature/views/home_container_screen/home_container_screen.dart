import 'package:jobsfinder/core/app_export.dart';
import 'package:jobsfinder/feature/viewmodel/user_view_model.dart';
import 'package:jobsfinder/feature/views/home_page/home_page.dart';
import 'package:jobsfinder/feature/views/message_page/message_page.dart';
import 'package:jobsfinder/feature/views/profile_page/profile_page.dart';
import 'package:jobsfinder/feature/views/saved_page/saved_page.dart';
import 'package:jobsfinder/core/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:jobsfinder/feature/views/settings_screen/settings_screen.dart';

// ignore_for_file: must_be_immutable
class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  State<HomeContainerScreen> createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  UserViewModel uVM=UserViewModel();
  List? userInfo;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    
      }
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context); 

    
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            body: Navigator(
                key: navigatorKey,
                
                initialRoute: AppRoutes.homePage ,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: const Duration(seconds: 0))),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Navigator.pushNamed(
                  navigatorKey.currentContext!, getCurrentRoute(type),);
            })
            ));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Message:
        return AppRoutes.messagePage;
      case BottomBarEnum.Saved:
        return AppRoutes.savedPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      case BottomBarEnum.Settings:
        return AppRoutes.settingsScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return const HomePage();
      case AppRoutes.messagePage:
        return MessagePage();
      case AppRoutes.savedPage:
        return const SavedPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      case AppRoutes.settingsScreen:
        return SettingsScreen();
      default:
        return const DefaultWidget();
    }
  }
}
