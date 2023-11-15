import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup/src/widgets/toastr.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileController with ChangeNotifier {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final imagePick = ImagePicker();
  XFile? _image;
  XFile? get image => _image;

  Future pickImageFromGallery(BuildContext context) async {
    final pickedFile = await imagePick.pickImage(
        source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      // ignore: use_build_context_synchronously
      //uploadImage(context);
      notifyListeners();
    } else {
      showToast('No image selected.');
    }
  }

  Future pickImageFromCamera(BuildContext context) async {
    final pickedFile = await imagePick.pickImage(
        source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      // ignore: use_build_context_synchronously
      //uploadImage(context);
      notifyListeners();
    } else {
      showToast('No image selected.');
    }
  }

  void imagePicker(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Pick Image From Gallery or Camera"),
            content: SizedBox(
              height: 120,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      pickImageFromCamera(context);
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.teal,
                    ),
                    title: const Text("Camera"),
                  ),
                  ListTile(
                    onTap: () {
                      pickImageFromGallery(context);
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.image,
                      color: Colors.teal,
                    ),
                    title: const Text("Gallery"),
                  )
                ],
              ),
            ),
          );
        });
  }

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  Future<void> uploadImage() async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    firebase_storage.Reference referenceRoot =
        firebase_storage.FirebaseStorage.instance.ref().child('profileUrl');
    firebase_storage.Reference reference = referenceRoot.child(uniqueFileName);
    try {
      firebase_storage.UploadTask uploadTask =
          reference.putFile(File(image!.path).absolute);
      await Future.value(uploadTask);
      _imageUrl = await reference.getDownloadURL();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
