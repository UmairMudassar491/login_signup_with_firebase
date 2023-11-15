// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/colors.dart';
import 'package:login_signup/src/constants/text_string.dart';

class GenderDropdown extends StatefulWidget {
  final String? initialGender;
  final void Function(String?)? onGenderSelected;
  const GenderDropdown({super.key, this.initialGender, this.onGenderSelected});

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.initialGender;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      iconEnabledColor: primaryColor,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.person,
          color: primaryColor,
        ),
        labelText: mGender,
        hintText: mGender,
        filled: true,
        fillColor: whiteColor,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor, width: 4.0),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      items: const [
        DropdownMenuItem(
          value: "Male",
          child: Text("Male"),
        ),
        DropdownMenuItem(
          value: "Female",
          child: Text("Female"),
        ),
        DropdownMenuItem(
          value: "Other",
          child: Text("Other"),
        ),
      ],
      validator: (value) {
        if (value == null) {
          return "Please select the gender";
        } else {
          return null;
        }
      },
      onChanged: (String? value) {
        setState(() {
          selectedGender = value;
        });
        if (widget.onGenderSelected != null) {
          widget.onGenderSelected!(selectedGender);
        }
      },
    );
  }
}
