import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/Helpers/helper_function.dart';
import 'package:login_signup/src/constants/colors.dart';
import 'package:login_signup/src/constants/image_string.dart';
import 'package:login_signup/src/constants/sizes.dart';
import 'package:login_signup/src/constants/text_string.dart';
import 'package:login_signup/src/views/auth/models/user_model.dart';
import 'package:login_signup/src/views/auth/repository/authantication_repository/auth_repository.dart';
import 'package:login_signup/src/widgets/buttons_widgets/btn_elevated_widget.dart';
import 'package:login_signup/src/widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:login_signup/src/widgets/dropdown_widgets/country_timezone_dropdown.dart';
import 'package:login_signup/src/widgets/dropdown_widgets/gender_dropdown.dart';


class SignUpQariFormWidget extends StatefulWidget {
  const SignUpQariFormWidget({super.key});

  @override
  State<SignUpQariFormWidget> createState() => _SignUpQariFormWidgetState();
}

class _SignUpQariFormWidgetState extends State<SignUpQariFormWidget> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _language = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _hourlyRate = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? _selectedGender;
  String? _selectedCountry;
  bool isLoading = false;
  bool _isHidden = true;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormFieldWidget(
                controller: _fullName,
                label: mFullName,
                hintText: mFullName,
                keyboardType: TextInputType.name,
                textInputAction: null,
                prefixIconWidget: const Icon(
                  Icons.person_2_outlined,
                  color: primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the FullName";
                  } else if (value.length < 4) {
                    return "Choose a fullName with 4 or more characters";
                  } else {
                    return null;
                  }
                },
                obscureText: false,
              ),
              const SizedBox(height: mFormHeight),
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
              const SizedBox(height: mFormHeight),
              TextFormFieldWidget(
                controller: _phoneNo,
                label: mPhoneNo,
                hintText: mPhoneNo,
                keyboardType: TextInputType.phone,
                textInputAction: null,
                prefixIconWidget: const Icon(
                  Icons.phone,
                  color: primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the phone no";
                  } else if (!phoneRegex.hasMatch(value)) {
                    return "Please enter valid phone no";
                  } else {
                    return null;
                  }
                },
                obscureText: false,
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
              TextFormFieldWidget(
                controller: _city,
                label: mCity,
                hintText: mCity,
                keyboardType: TextInputType.multiline,
                textInputAction: null,
                prefixIconWidget: const Icon(
                  Icons.location_city_sharp,
                  color: primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the city";
                  } else {
                    return null;
                  }
                },
                obscureText: false,
              ),
              const SizedBox(height: mFormHeight),
              TextFormFieldWidget(
                controller: _language,
                label: mLanguage,
                hintText: mLanguage,
                keyboardType: TextInputType.multiline,
                textInputAction: null,
                prefixIconWidget: const Icon(
                  Icons.language_outlined,
                  color: primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the language";
                  } else {
                    return null;
                  }
                },
                obscureText: false,
              ),
              const SizedBox(height: mFormHeight),
              TextFormFieldWidget(
                controller: _hourlyRate,
                label: mHourlyRate,
                hintText: mHourlyRate,
                keyboardType: TextInputType.number,
                textInputAction: null,
                prefixIconWidget: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ImageIcon(
                    AssetImage(
                      mDollarIcon,
                    ),
                    color: primaryColor,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the hourlyRate";
                  } else {
                    return null;
                  }
                },
                obscureText: false,
              ),
              const SizedBox(height: mFormHeight),
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
              const SizedBox(height: mFormHeight),
              TextFormFieldWidget(
                controller: _confirmPassword,
                label: mConfirmPassword,
                hintText: mConfirmPassword,
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
                    return "Please enter the the confirm password";
                  } else if (!passRegex.hasMatch(value)) {
                    return "Confirm password should contain upper,lower,digit and Special character";
                  } else if (value != _password.text) {
                    return "password mismatch";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20.0),
              if (errorText != null)
                Text(
                  errorText!,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 10.0),
              BtnElevatedWidget(
                width: width,
                height: height * 0.1,
                onPressed: () => registerNow(),
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
                    : Text(mSignUp.toUpperCase()),
              ),
              const SizedBox(height: 15.0),
              Text.rich(
                TextSpan(
                  text: mAlreadyHaveAnAccount,
                  style: const TextStyle(color: textDarkColor, fontSize: 15),
                  children: [
                    TextSpan(
                      text: mLogin,
                      style: const TextStyle(
                          color: whiteColor, fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => Navigator.pushNamed(context, "/QariLogin"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerNow() async {
    if (formKey.currentState!.validate()) {
      UserModel user = TutorModel(
        fullName: _fullName.text.trim(),
        email: _email.text.trim(),
        phoneNo: _phoneNo.text.trim(),
        password: _password.text.trim(),
        gender: _selectedGender!,
        city: _city.text.trim(),
        country: _selectedCountry!,
        language: _language.text.trim(),
        hourlyRate: _hourlyRate.text.trim(),
        specializations: "",
      );

      setState(() {
        errorText = null;
        isLoading = true;
      });

      try {
        AuthRepository authRepository = AuthRepository();
        authRepository.signupQaries(user).then((value) async {
          if (value == true) {
            // saving the shared preference state
            await HelperFunctions.saveUserLoggedInStatus(true);
            //await HelperFunctions.saveUserEmailSF(email.text.trim());
            //await HelperFunctions.saveUserNameSF(fullName.text.trim());
            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(
                context, "/QariHomePage", (route) => false);
          } else {
            setState(() {
              isLoading = false;
              errorText = "Registration failed. Please try again.";
            });
          }
        });
      } on FirebaseException catch (e) {
        debugPrint(e.message);
        setState(() {
          isLoading = false;
          errorText = "Registration failed. Please try again.";
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
