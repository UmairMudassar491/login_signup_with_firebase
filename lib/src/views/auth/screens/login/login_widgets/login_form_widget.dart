import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_quran_learning/Helpers/helper_function.dart';
import 'package:online_quran_learning/src/constants/sizes.dart';
import 'package:online_quran_learning/src/constants/text_string.dart';
import 'package:online_quran_learning/src/views/auth/repository/authantication_repository/auth_repository.dart';
import 'package:online_quran_learning/src/views/auth/repository/authantication_repository/database_service.dart';
import 'package:online_quran_learning/src/widgets/toastr.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  AuthRepository authRepository = AuthRepository();
  final formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: mEmail,
                  hintText: mhintEmail,
                  border: OutlineInputBorder()),
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the email";
                } else if (!emailRegex.hasMatch(value)) {
                  return "Please enter a valid email";
                } else {
                  return null;
                }
              }),
            ),
            const SizedBox(
              height: mFormHeight,
            ),
            TextFormField(
              controller: password,
              obscureText: _isHidden,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: mPassword,
                  hintText: mPassword,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: _togglePasswordView,
                    icon: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off),
                  )),
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the the password";
                } else if (!passRegex.hasMatch(value)) {
                  return "Password should contain upper,lower,digit and Special character";
                } else {
                  return null;
                }
              }),
            ),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {}, child: const Text(mForgetPassword)),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    side: const BorderSide(color: Colors.black),
                    padding:
                        const EdgeInsets.symmetric(vertical: mButtonHeight)),
                child: isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3.0,
                          ),
                          SizedBox(width: 24),
                          Text("Please wait...")
                        ],
                      )
                    : Text(mLogin.toUpperCase()),
                onPressed: () => loginNow(),
              ),
            ),
            const SizedBox(height: 10.0),
            Text.rich(
              TextSpan(
                text: mAlreadyHaveAnAccount,
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: mSignUp,
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushNamed(context, "/Signup"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  loginNow() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        await authRepository
            .login(email.text.trim(), password.text.trim())
            .then((value) async {
          if (value == true) {
            QuerySnapshot snapshot = (await DatabaseService(
                    uid: FirebaseAuth.instance.currentUser!.uid)
                .gettingUserDataWithEmail(email.text.trim()));
            // saving the values to our shared preferences
            await HelperFunctions.saveUserLoggedInStatus(true);
            await HelperFunctions.saveUserEmailSF(email.text.trim());
            await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, '/Home');
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } catch (e) {
        // ignore: avoid_print
        print('FIREBASE AUTH EXCEPTION - ${e..toString()}');
        showToast("User not found. please signup user");
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
