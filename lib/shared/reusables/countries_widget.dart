import 'package:flutter/material.dart';
import 'package:countries/countries.dart';
import '../../controllers/countries_controller.dart';
//Declaration of Country Widget as a StatelessWidget to display the country picker,country flag, and the phone number input field
class CountriesWidget extends StatelessWidget {
  const CountriesWidget({
    super.key,
    required this.countriesController,
    required this.country,
  });
  final CountriesController countriesController;
  final Country country;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        Text('Select Country and Enter Phone Number'),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () => countriesController.showCountryPickerDialog(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      CountryFlagWidget(country, width: 24),
                      SizedBox(width: 8),
                      Flexible(child: Text("+${country.phoneCode}", overflow: TextOverflow.ellipsis)),
                      SizedBox(width: 4),
                      Flexible(child: Text(country.name, overflow: TextOverflow.ellipsis)),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),

                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 7,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}