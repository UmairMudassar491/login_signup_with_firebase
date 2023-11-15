import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signup/Helpers/helper_function.dart';
import 'package:login_signup/src/views/auth/models/user_model.dart';
import 'package:login_signup/src/views/auth/repository/authantication_repository/database_service.dart';
import 'package:login_signup/src/views/auth/repository/exceptions/signup_email_password_failure.dart';

class AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future login(String email, String password) async {
    try {
      User user = (await auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      // ignore: unnecessary_null_comparison
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailPasswordFaliure.code(e.code);
      // ignore: avoid_print
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpEmailPasswordFaliure();
      // ignore: avoid_print
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future signupUser(UserModel users) async {
    try {
      User user = (await auth.createUserWithEmailAndPassword(
              email: users.email, password: users.password))
          .user!;
      // ignore: unnecessary_null_comparison
      if (user != null) {
        // call our database service to update the user data.
        await DatabaseService(uid: user.uid).savingUserData(users);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailPasswordFaliure.code(e.code);
      // ignore: avoid_print
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    } catch (_) {
      const ex = SignUpEmailPasswordFaliure();
      // ignore: avoid_print
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future signupQaries(UserModel users) async {
    try {
      User user = (await auth.createUserWithEmailAndPassword(
              email: users.email, password: users.password))
          .user!;
      // ignore: unnecessary_null_comparison
      if (user != null) {
        // call our database service to update the user data.
        await DatabaseService(uid: user.uid).savingQariesData(users);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailPasswordFaliure.code(e.code);
      // ignore: avoid_print
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    } catch (_) {
      const ex = SignUpEmailPasswordFaliure();
      // ignore: avoid_print
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      await HelperFunctions.removeUserLoggedInStatus();
      await HelperFunctions.removeQariLoggedInStatus();
    } catch (e) {
      // ignore: avoid_returning_null_for_void
      return null;
    }
  }
}
