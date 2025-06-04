import 'package:africa/controllers/ussd_text_controller.dart';
import 'package:africa/features/auth/user_model.dart';
import 'package:africa/utilis/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:countries/countries.dart';
import '../../controllers/countries_controller.dart';
import '../../features/auth/user_view.dart';
import 'package:get/get.dart';

//Declaration of Country Widget as a StatelessWidget to display the country picker,country flag, and the phone number input field
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final countriesController = Get.put(CountriesController());
    final controller = Get.put(UserController());
    return Material(
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          Row(children: [
          Text('at', style: TextStyle(fontSize: 50)),
          Container(
            height: 50,
            width: 3,
            color: Colors.grey,
          ),
          Text('Sandbox', style: TextStyle(fontSize: 50)),
          ]),
          SizedBox(height: 16),
          Text(Texts.paragraph, style: TextStyle(color: Colors.grey)),
          Text(Texts.paragraph2, style: TextStyle(color: Colors.grey)),
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
                        CountryFlagWidget(controller.country, width: 24),
                        SizedBox(width: 8),
                        Flexible(child: Text("+${controller.country.phoneCode}", overflow: TextOverflow.ellipsis)),
                        SizedBox(width: 4),
                        Flexible(child: Text(controller.country.name, overflow: TextOverflow.ellipsis)),
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
                child: Material(
                  child: TextField(
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(Texts.paragraph3, style: TextStyle(color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('CANCEL', style: TextStyle(color: Colors.blue)),
              ),
              ElevatedButton(
                onPressed: (){
                  controller.handleContactRegistration();
                },
                child: Text("Save User"),
              )
      
            ],
          )
        ],
      ),
    );
  }
}
