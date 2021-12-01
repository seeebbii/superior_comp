import 'package:flutter/material.dart';
import 'package:superior_comp/view/authentication/auth_login_screen.dart';
import 'package:superior_comp/view/drawer/custom_drawer.dart';
import 'package:superior_comp/view/home/authentication/auth_signup_screen.dart';
import 'package:superior_comp/view/home/stepper/stepper_root.dart';
import 'package:superior_comp/view/splash/main_splash_screen.dart';
import 'package:superior_comp/view/splash/onboard/onboard_root.dart';
import 'package:superior_comp/view/splash/onboard/onboard_welcome_1.dart';
import 'package:superior_comp/view/splash/onboard/onboard_welcome_2.dart';
import 'package:superior_comp/view/splash/onboard/onboard_welcome_3.dart';



// STATIC ROUTE NAMES

// SPLASH / ON BOARDING
const String mainSplashScreen = '/main-splash-screen';
const String onBoardRoot = '/on-board-root';
const String onBoardWelcome1 = '/on-board-welcome-1';
const String onBoardWelcome2 = '/on-board-welcome-2';
const String onBoardWelcome3 = '/on-board-welcome-3';

// AUTH
const String authLoginScreen = '/login-screen';
const String authSignUpScreen = '/signup-screen';

//  STEPPER ROOT
const String stepperRoot = '/stepper-root';

const String customDrawer='/custom-drawer';


// ignore: todo
// TODO : ROUTES GENERATOR CLASS THAT CONTROLS THE FLOW OF NAVIGATION/ROUTING


class RouteGenerator {
  // FUNCTION THAT HANDLES ROUTING
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    late dynamic args;
    if (settings.arguments != null) {
      args = settings.arguments as Map;
    }
    debugPrint(settings.name);
    switch (settings.name) {

      case mainSplashScreen:
        return _getPageRoute(const MainSplashScreen());

      case onBoardRoot:
        return _getPageRoute(const OnBoardRoot());

      case onBoardWelcome1:
        return _getPageRoute(const OnBoardWelcome1());

      case onBoardWelcome2:
        return _getPageRoute(const OnBoardWelcome2());

      case onBoardWelcome3:
        return _getPageRoute(const OnBoardWelcome3());

      case authLoginScreen:
        return _getPageRoute(const AuthLoginScreen());

        case authSignUpScreen:
        return _getPageRoute(const AuthSignUpScreen());

        case customDrawer:
        return _getPageRoute(const CustomDrawer());

      default:
        return _errorRoute();
    }
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (ctx) => child);
  }

  // 404 PAGE
  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}
