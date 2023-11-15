import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/Helpers/helper_function.dart';
import 'package:login_signup/src/constants/colors.dart';
import 'package:login_signup/src/constants/text_string.dart';
import 'package:login_signup/src/views/auth/repository/authantication_repository/auth_repository.dart';
import 'package:login_signup/src/widgets/buttons_widgets/btn_elevated_widget.dart';
import 'package:login_signup/src/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:login_signup/src/widgets/toastr.dart';

class StudentLoginForm extends StatefulWidget {
  const StudentLoginForm({super.key});

  @override
  State<StudentLoginForm> createState() => _StudentLoginFormState();
}

class _StudentLoginFormState extends State<StudentLoginForm> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  AuthRepository authRepository = AuthRepository();
  final formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormFieldWidget(
              controller: _email,
              label: mEmail,
              hintText: mhintEmail,
              keyboardType: TextInputType.emailAddress,
              textInputAction: null,
              prefixIconWidget: const Icon(
                Icons.email_outlined,
                color: primaryColor,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the email";
                } else if (!emailRegex.hasMatch(value)) {
                  return "Please enter a valid email";
                } else {
                  return null;
                }
              },
              obscureText: false,
            ),
            const SizedBox(height: 15),
            TextFormFieldWidget(
              controller: _password,
              label: mPassword,
              hintText: mPassword,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: null,
              obscureText: _isHidden,
              obscuringCharacter: "*",
              maxLines: 1,
              prefixIconWidget: const Icon(
                Icons.lock,
                color: primaryColor,
              ),
              suffixIcon: _isHidden ? Icons.visibility : Icons.visibility_off,
              suffixIconOnPressed: _togglePasswordView,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the the password";
                } else if (!passRegex.hasMatch(value)) {
                  return "Password should contain upper,lower,digit and Special character";
                } else {
                  return null;
                }
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  mForgetPassword,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            BtnElevatedWidget(
              width: width,
              height: height * 0.1,
              onPressed: () => loginNow(),
              child: isLoading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3.0,
                        ),
                        SizedBox(width: 24),
                        Text("Please wait...")
                      ],
                    )
                  : Text(
                      mLogin.toUpperCase(),
                    ),
            ),
            const SizedBox(height: 15.0),
            Text.rich(
              TextSpan(
                text: mDontHaveAnAccount,
                style: const TextStyle(color: textDarkColor, fontSize: 15),
                children: [
                  TextSpan(
                    text: mSignUp,
                    style: const TextStyle(
                        color: whiteColor, fontWeight: FontWeight.w600),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => Navigator.pushNamed(context, "/SignupStudent"),
                  ),
                ],
              ),
            ),
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
            .login(_email.text.trim(), _password.text.trim())
            .then((value) async {
          if (value == true) {
            // QuerySnapshot snapshot = (await DatabaseService(
            //         uid: FirebaseAuth.instance.currentUser!.uid)
            //     .gettingUserDataWithEmail(email.text.trim()));
            // saving the values to our shared preferences
            await HelperFunctions.saveUserLoggedInStatus(true);
            //await HelperFunctions.saveUserEmailSF(email.text.trim());
            //await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, '/StudentHomePage');
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
