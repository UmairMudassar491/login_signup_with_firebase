import 'package:flutter/material.dart';
import 'package:online_quran_learning/src/constants/text_string.dart';

class GenderDropdown extends StatefulWidget {
  final ValueChanged<String> onGenderSelected;
  const GenderDropdown({super.key, required this.onGenderSelected});

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: _selectedGender,
      decoration: InputDecoration(
          prefixIcon: Icon(_selectedGender == 'Male'
              ? Icons.male_rounded
              : _selectedGender == 'Female'
                  ? Icons.female_rounded
                  : _selectedGender == 'Other'
                      ? Icons.transgender_sharp
                      : Icons.transgender_sharp),
          hintText: mSelectGender,
          labelText: mGender,
          border: const OutlineInputBorder()),
      isExpanded: true,
      iconSize: 30.0,
      style:
          const TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
      items: ['Male', 'Female ', 'other'].map(
        (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      onChanged: (val) {
        setState(
          () {
            _selectedGender = val!;
          },
        );
        widget.onGenderSelected(val!);
      },
    );
  }
}
