import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CountryDropdown extends StatefulWidget {
  final ValueChanged<String> onCountrySelected;
  const CountryDropdown({super.key, required this.onCountrySelected});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  List<dynamic> _countries = [];
  String? _selectedCountry;
  @override
  void initState() {
    super.initState();
    _loadCountries();
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
      value: _selectedCountry,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.location_on),
          hintText: 'Select Country',
          labelText: 'Country',
          border: OutlineInputBorder()),
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
      onChanged: (val) {
        setState(
          () {
            _selectedCountry = val;
          },
        );
        widget.onCountrySelected(val!);
      },
    );
  }
}
