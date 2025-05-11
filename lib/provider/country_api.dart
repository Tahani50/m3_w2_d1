import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/country.dart';

/// A service class to fetch country data from the Countries API
class CountryApi {

  /// Fetches all countries from the API endpoint.
  /// Returns a List of Country objects if the request is successful, or `null` if the request fails.
  Future<List<Country>?> getAllCountries() async {
    // Create an HTTP client
    var client = http.Client();

    // Define the API endpoint URL
    var uri = Uri.parse('https://restcountries.com/v3.1/all');

    // Send a GET request to the API
    var response = await client.get(uri);

    // Check if the response status is OK (200)
    if (response.statusCode == 200) {
      // Decode the response body
      // Then parse the JSON into a list of Country objects
      return countryFromJson(const Utf8Decoder().convert(response.bodyBytes));
    }

    // Return null if the request failed
    return null;
  }
}
