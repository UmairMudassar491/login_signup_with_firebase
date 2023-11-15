import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_quran_learning/src/constants/sizes.dart';
import 'package:online_quran_learning/src/constants/text_string.dart';
import 'package:online_quran_learning/src/views/auth/models/user_model.dart';
import 'package:online_quran_learning/src/views/auth/repository/authantication_repository/database_service.dart';
import 'package:online_quran_learning/src/views/auth/screens/profile/profile_controller.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: const Text("Edit Profile"),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            color: Colors.white,
          ),
        ),
        body: ChangeNotifierProvider(
          create: (_) => ProfileController(),
          child:
              Consumer<ProfileController>(builder: (context, provider, child) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FutureBuilder<DocumentSnapshot>(
                    future: DatabaseService(
                            uid: FirebaseAuth.instance.currentUser!.uid)
                        .getUserData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          final data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          final fullName =
                              TextEditingController(text: data['fullName']);
                          final email =
                              TextEditingController(text: data['email']);
                          final phoneNo =
                              TextEditingController(text: data['phoneNo']);
                          final address =
                              TextEditingController(text: data['address']);
                          final password =
                              TextEditingController(text: data['password']);
                          final cPassword =
                              TextEditingController(text: data['password']);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      child: Center(
                                        child: Container(
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 3,
                                              color: Colors.teal,
                                            ),
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: provider.image == null
                                                  ? data["profileUrl"] == null
                                                      ? const Icon(
                                                          Icons.person,
                                                          size: 40,
                                                        )
                                                      : Image(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                            data["profileUrl"],
                                                          ),
                                                          loadingBuilder: (context,
                                                              child,
                                                              loadingProgress) {
                                                            if (loadingProgress ==
                                                                null) {
                                                              return child;
                                                            }
                                                            return const Center(
                                                                child:
                                                                    CircularProgressIndicator());
                                                          },
                                                          errorBuilder:
                                                              (context, object,
                                                                  stack) {
                                                            // ignore: avoid_unnecessary_containers
                                                            return Container(
                                                              child: const Icon(
                                                                  Icons
                                                                      .error_outline),
                                                            );
                                                          },
                                                        )
                                                  : Image.file(File(
                                                      provider.image!.path))),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        provider.imagePicker(context);
                                      },
                                      child: const CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Colors.teal,
                                        child: Icon(
                                          Icons.edit,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ]),
                              const SizedBox(height: 40.0),
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
                                    hintText: mEmail,
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
                              TextFormField(
                                controller: address,
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
                                controller: password,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    labelText: mPassword,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: mPassword,
                                    border: OutlineInputBorder()),
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
                                controller: cPassword,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    labelText: mConfirmPassword,
                                    hintText: mConfirmPassword,
                                    border: OutlineInputBorder()),
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
                              const SizedBox(height: mDefaultSize),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      side:
                                          const BorderSide(color: Colors.black),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: mButtonHeight)),
                                  child: isLoading
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 3.0,
                                            ),
                                            SizedBox(width: 24),
                                            Text("Please wait...")
                                          ],
                                        )
                                      : Text(mSubmmit.toUpperCase()),
                                  onPressed: () async {
                                    await provider.uploadImage(context);
                                    UserModel user = UserModel(
                                      fullName: fullName.text.trim(),
                                      email: email.text.trim(),
                                      phoneNo: phoneNo.text.trim(),
                                      password: password.text.trim(),
                                      profileUrl: provider.newUrl,
                                      city: '',
                                      country: '',
                                      gender: '',
                                      language: '',
                                    );
                                    setState(() {
                                      isLoading = true;
                                    });
                                    try {
                                      await DatabaseService(
                                              uid: FirebaseAuth
                                                  .instance.currentUser!.uid)
                                          .updataUserData(user)
                                          .then((value) {
                                        Fluttertoast.showToast(
                                            msg: "Profile Upload");
                                        Navigator.pushReplacementNamed(
                                            context, '/Home');
                                        setState(() {
                                          isLoading = false;
                                        });
                                      });
                                    } on FirebaseException catch (e) {
                                      debugPrint(e.message);
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return const Center(
                            child: Text("Somthing went wrong"),
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
