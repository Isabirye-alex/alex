import 'package:africa/features/covert_class.dart';
import 'package:flutter/material.dart';
import 'countries_class.dart';

class CountriesMainClass extends StatefulWidget {
  const CountriesMainClass({super.key});

  @override
  State<CountriesMainClass> createState() => _CountriesMainClassState();
}

class _CountriesMainClassState extends State<CountriesMainClass> {
  late Future<List<Countries>> futureCountry;
  List<Countries> countries = [];
  Countries? selectedCountry;
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCountries().then((result) {
      setState(() {
        countries = result;
        selectedCountry = countries.isNotEmpty ? countries[0] : null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return selectedCountry == null
        ? Center(child: CircularProgressIndicator())
        : Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Country Dropdown
          Row(
            children: [
              Expanded(
                child: DropdownButton<Countries>(
                  isExpanded: true,
                  value: selectedCountry,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCountry = newValue!;
                    });
                  },
                  items: countries.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(country.name),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(selectedCountry!.code),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}