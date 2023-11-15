import 'package:flutter/material.dart';
import 'package:online_quran_learning/src/views/auth/screens/login/login_screen/login_screen.dart';
import 'package:online_quran_learning/src/views/auth/screens/profile/profile_screen.dart';
import 'package:online_quran_learning/src/views/auth/screens/profile/update_profile.dart';
import 'package:online_quran_learning/src/views/auth/screens/signup/signup_qari/signup_qari_screen/signup_qari_screen.dart';
import 'package:online_quran_learning/src/views/auth/screens/signup/signup_students/signup_student_screen/signup_student_screen.dart';
import 'package:online_quran_learning/src/views/home_page/home_page.dart';
import 'package:online_quran_learning/src/views/splash/splash_screen.dart';
import 'package:online_quran_learning/src/views/welcome_screen/welcome_screen.dart';

class Routes {
  static Route<Object>? generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      // case '/Splash':
      //   return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/Welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/Login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/SignupQari':
        return MaterialPageRoute(builder: (_) => const SignUpQariScreen());
      case '/SignupStudent':
        return MaterialPageRoute(builder: (_) => const SignUpStudentScreen());
      case '/Home':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case '/ProfileScreen':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/UpdateProfile':
        return MaterialPageRoute(builder: (_) => const UpdateProfile());
      // case '/NoInternet':
      //   return MaterialPageRoute(builder: (_) => const NoNetwork());
      default:
        return null;
    }
  }
}
