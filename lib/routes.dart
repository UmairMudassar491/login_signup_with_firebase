import 'package:flutter/material.dart';
import 'package:login_signup/src/views/auth/screens/login/qari_login/login_screen/qari_login_screen.dart';
import 'package:login_signup/src/views/auth/screens/login/student_login/student_login_screen/student_login_screen.dart';
import 'package:login_signup/src/views/auth/screens/profile/qari_profile/qari_profile_screen.dart';
import 'package:login_signup/src/views/auth/screens/profile/qari_profile/update_qari_profile.dart';
import 'package:login_signup/src/views/auth/screens/profile/student_profile/student_profile_screen.dart';
import 'package:login_signup/src/views/auth/screens/profile/student_profile/update_student_profile.dart';
import 'package:login_signup/src/views/auth/screens/signup/signup_qari/signup_qari_screen/signup_qari_screen.dart';
import 'package:login_signup/src/views/auth/screens/signup/signup_students/signup_student_screen/signup_student_screen.dart';
import 'package:login_signup/src/views/home_page/qaries_home_page/qari_home_page.dart';
import 'package:login_signup/src/views/home_page/students_home_page/students_home_page.dart';
import 'package:login_signup/src/views/splash/splash_screen.dart';
import 'package:login_signup/src/views/welcome_screen/welcome_screen.dart';

class Routes {
  static Route<Object>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/Welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/QariLogin':
        return MaterialPageRoute(builder: (_) => const QariLoginScreen());
      case '/StudentLogin':
        return MaterialPageRoute(builder: (_) => const StudentLoginScreen());
      case '/SignupQari':
        return MaterialPageRoute(builder: (_) => const SignUpQariScreen());
      case '/SignupStudent':
        return MaterialPageRoute(builder: (_) => const SignUpStudentScreen());
      case '/StudentHomePage':
        return MaterialPageRoute(builder: (_) => const StudentHomePage());
      case '/QariHomePage':
        return MaterialPageRoute(builder: (_) => const QariHomePage());
      case '/StudentProfileScreen':
        return MaterialPageRoute(builder: (_) => const StudentProfileScreen());
      case '/UpdateStudentProfile':
        return MaterialPageRoute(builder: (_) => const UpdateStudentProfile());
      case '/QariProfileScreen':
        return MaterialPageRoute(builder: (_) => const QariProfileScreen());
      case '/UpdateQariProfile':
        return MaterialPageRoute(builder: (_) => const UpdateQariProfile());
      // case '/NoInternet':
      //   return MaterialPageRoute(builder: (_) => const NoNetwork());
      default:
        return null;
    }
  }
}
