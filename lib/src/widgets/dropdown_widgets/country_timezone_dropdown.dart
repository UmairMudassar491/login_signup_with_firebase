import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:login_signup/src/constants/colors.dart';

class CountryDropdown extends StatefulWidget {
  final String? initialCountry;
  final ValueChanged<String?>? onCountrySelected;
  const CountryDropdown(
      {super.key, this.onCountrySelected, this.initialCountry});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  List<dynamic> _countries = [];
  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    _loadCountries();
    selectedCountry = widget.initialCountry;
  }

  Future<void> _loadCountries() async {
    final String response =
        await rootBundle.loadString('assets/data/countries.json');
    final data = await json.decode(response);
    setState(() {
      _countries = data['countries'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedCountry,
      iconEnabledColor: primaryColor,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.location_pin,
          color: primaryColor,
        ),
        hintText: 'Select Country',
        labelText: 'Country',
        filled: true,
        fillColor: whiteColor,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor, width: 4.0),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      isExpanded: true,
      iconSize: 30.0,
      style:
          const TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
      items: _countries.map((country) {
        return DropdownMenuItem<String>(
          value: country['country_name'],
          child: Text(country['country_name']),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return "Please select the Country";
        } else {
          return null;
        }
      },
      onChanged: (val) {
        setState(() {
          selectedCountry = val;
        });
        if (widget.onCountrySelected != null) {
          widget.onCountrySelected!(selectedCountry);
        }
      },
    );
  }
}
