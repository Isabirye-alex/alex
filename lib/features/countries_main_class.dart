import 'package:africa/controllers/phone_number_controller.dart';
import 'package:africa/features/covert_class.dart';
import 'package:flutter/material.dart';
import 'countries_class.dart';
import 'package:get/get.dart';


class CountriesMainClass extends StatefulWidget {
  final Function(Countries)? onCountrySelected;

  const CountriesMainClass({super.key, this.onCountrySelected});

  @override
  State<CountriesMainClass> createState() => _CountriesMainClassState();
}

class _CountriesMainClassState extends State<CountriesMainClass> {
  List<Countries> countries = [];
  Countries? selectedCountry;
  final phoneController = Get.put(PhoneController());

  @override
  void initState() {
    super.initState();
    fetchCountries().then((result) {
      setState(() {
        countries = result;
        selectedCountry = countries.isNotEmpty ? countries[0] : null;
        if (selectedCountry != null && widget.onCountrySelected != null) {
          widget.onCountrySelected!(selectedCountry!);
        }
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
                    if (widget.onCountrySelected != null) {
                      widget.onCountrySelected!(newValue!);
                    }
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
              SizedBox(width: 10),
              Expanded(
                child: Form(
                  key: phoneController.formKey,
                  child: TextFormField(
                    controller: phoneController.phoneController,
                    inputFormatters: phoneController.phoneInputFormatters,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    validator: (value) => phoneController.validatePhoneNumber(),
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
