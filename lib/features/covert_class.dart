import 'dart:convert';
import 'package:http/http.dart' as http;
import 'countries_class.dart';

Future<List<Countries>> fetchCountries() async {
  final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
  
  if(response.statusCode == 200){
    final List data = json.decode(response.body);
    return data.map((json) => Countries.fromJson(json)).toList();
  } else {
    throw Exception('Could not connect to internet');
  }
}