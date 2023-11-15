import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_quran_learning/Helpers/helper_function.dart';
import 'package:online_quran_learning/src/constants/sizes.dart';
import 'package:online_quran_learning/src/constants/text_string.dart';
import 'package:online_quran_learning/src/views/auth/models/user_model.dart';
import 'package:online_quran_learning/src/views/auth/repository/authantication_repository/auth_repository.dart';
import 'package:online_quran_learning/src/widgets/widgets/country_timezone_dropdown.dart';
import 'package:online_quran_learning/src/widgets/widgets/gender_dropdown.dart';

class SignUpStudentFormWidget extends StatefulWidget {
  const SignUpStudentFormWidget({super.key});

  @override
  State<SignUpStudentFormWidget> createState() =>
      _SignUpStudentFormWidgetState();
}

class _SignUpStudentFormWidgetState extends State<SignUpStudentFormWidget> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController language = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? _selectedGender;
  String? _selectedCountry;
  bool isLoading = false;
  bool _isHidden = true;

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
              controller: fullName,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2_outlined),
                  labelText: mFullName,
                  hintText: mFullName,
                  border: OutlineInputBorder()),
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the FullName";
                } else if (value.length < 4) {
                  return "Choose a fullName with 4 or more characters";
                } else {
                  return null;
                }
              }),
            ),
            const SizedBox(height: mFormHeight),
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
            const SizedBox(height: mFormHeight),
            TextFormField(
              controller: phoneNo,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: mPhoneNo,
                  hintText: mPhoneNo,
                  border: OutlineInputBorder()),
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the phone no";
                } else if (!phoneRegex.hasMatch(value)) {
                  return "Please enter valid phone no";
                } else {
                  return null;
                }
              }),
            ),
            const SizedBox(height: mFormHeight),
            GenderDropdown(
              onGenderSelected: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            const SizedBox(height: mFormHeight),
            CountryDropdown(
              onCountrySelected: (value) {
                setState(() {
                  _selectedCountry = value;
                });
              },
            ),
            const SizedBox(height: mFormHeight),
            TextFormField(
              controller: city,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_pin),
                  labelText: mCity,
                  hintText: mCity,
                  border: OutlineInputBorder()),
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the address";
                } else {
                  return null;
                }
              }),
            ),
            const SizedBox(height: mFormHeight),
            TextFormField(
              controller: age,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: mAge,
                  hintText: mAge,
                  border: OutlineInputBorder()),
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the age";
                } else {
                  return null;
                }
              }),
            ),
            const SizedBox(height: mFormHeight),
            TextFormField(
              controller: language,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.language_sharp),
                  labelText: mLanguage,
                  hintText: mLanguage,
                  border: OutlineInputBorder()),
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the language";
                } else {
                  return null;
                }
              }),
            ),
            const SizedBox(height: mFormHeight),
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
                    _isHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
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
            const SizedBox(height: mFormHeight),
            TextFormField(
              controller: confirmPassword,
              obscureText: _isHidden,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                labelText: mConfirmPassword,
                hintText: mConfirmPassword,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: _togglePasswordView,
                  icon: Icon(
                    _isHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the the confirm password";
                } else if (!passRegex.hasMatch(value)) {
                  return "Confirm password should contain upper,lower,digit and Special character";
                } else if (value != password.text) {
                  return "password mismatch";
                } else {
                  return null;
                }
              }),
            ),
            const SizedBox(height: 20.0),
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
                    : Text(mSignUp.toUpperCase()),
                onPressed: () => registerNow(),
              ),
            ),
            const SizedBox(height: 10.0),
            Text.rich(
              TextSpan(
                text: mAlreadyHaveAnAccount,
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: mLogin,
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushNamed(context, "/Login"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> registerNow() async {
    if (formKey.currentState!.validate()) {
      UserModel user = StudentModel(
        fullName: fullName.text.trim(),
        email: email.text.trim(),
        phoneNo: phoneNo.text.trim(),
        password: password.text.trim(),
        age: age.text.trim(),
        city: city.text.trim(),
        country: _selectedCountry!,
        gender: _selectedGender!,
        language: language.text.trim(),
      );
      setState(() {
        isLoading = true;
      });
      try {
        AuthRepository authRepository = AuthRepository();
        authRepository.signupUser(user).then((value) async {
          if (value == true) {
            // saving the shared preference state
            await HelperFunctions.saveUserLoggedInStatus(true);
            await HelperFunctions.saveUserEmailSF(email.text.trim());
            await HelperFunctions.saveUserNameSF(fullName.text.trim());
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, '/SignupStudent');
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } on FirebaseException catch (e) {
        debugPrint(e.message);
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
