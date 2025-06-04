import 'package:countries/countries.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/countries_controller.dart';
import '../../shared/reusables/countries_widget.dart';
//Declaration of Country Widget as a Stateful class
class CountriesModel extends StatefulWidget {
  const CountriesModel({super.key});
  @override
  CountriesModelState createState() => CountriesModelState();
}
class CountriesModelState extends State<CountriesModel> {
  late Country country;
  @override
  void initState() {
    super.initState();
    country = CountriesRepo.getCountryByPhoneCode('90');
  }
  @override
  Widget build(BuildContext context) {
    final countriesController = Get.put(CountriesController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Register Phone Number'),
      ),
      body: CountriesWidget(countriesController: countriesController, country: country),
    );
  }
}


