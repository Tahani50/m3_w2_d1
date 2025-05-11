import '../models/country.dart';
import '../provider/country_api.dart';

/// A service layer class that acts as an intermediary between the UI and the API layer.
class CountryService {
  // Instance of the API provider class
  final _api = CountryApi();

  /// Fetches all countries by calling the API method.
  /// Returns a List of Country objects or `null` if the fetch fails.
  Future<List<Country>?> getAllCountries() async {
    return _api.getAllCountries();
  }
}
