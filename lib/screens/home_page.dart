import 'package:flutter/material.dart';

import '../models/country.dart';
import '../service/country_service.dart';

/// The main home page displaying a list of countries with their details.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List to hold fetched countries
  List<Country>? countries;

  // Boolean to track whether the data has been loaded
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    // Fetch countries when the widget initializes
    loadCountries();
  }

  /// Fetches the list of countries from the API and updates the UI
  Future<void> loadCountries() async {
    final countryService = CountryService();
    countries = await countryService.getAllCountries();

    // Update UI to reflect data has been loaded
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Countries"),
        ),
      body: isLoaded && countries != null
      // If data is loaded and not null, show the country list
          ? SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),

            // Table header row
            const Row(
              children: [
                Expanded(
                  child: Text('Name', textAlign: TextAlign.center,),
                ),
                Expanded(
                  child: Text('Capital', textAlign: TextAlign.center),
                ),
                Expanded(
                  child: Text('Continent', textAlign: TextAlign.center),
                ),
                Expanded(
                  child: Text('Flag', textAlign: TextAlign.center),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Scrollable list of countries
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: countries!
                        .map(
                          (country) => Column(
                        children: [
                          const SizedBox(height: 4),

                          // Row showing country details
                          Row(
                            children: [
                              // Country name
                              Expanded(
                                child: Text(
                                  country.name?.common ?? 'No name',
                                ),
                              ),

                              // Capital city
                              Expanded(
                                child: Text(
                                  country.capital != null &&
                                      country.capital!.isNotEmpty
                                      ? country.capital!.first
                                      : 'No capital',
                                ),
                              ),

                              // Continent
                              Expanded(
                                child: Text(
                                  country.continents != null &&
                                      country.continents!
                                          .isNotEmpty
                                      ? country.continents!.first
                                      : 'No continents',
                                ),
                              ),

                              // Flag image
                              Expanded(
                                child: country.flags != null &&
                                    country.flags!.png != null
                                    ? Image.network(
                                  country.flags!.png!,
                                )
                                    : const Icon(
                                  Icons.flag_rounded,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),
                          const Divider(),
                        ],
                      ),
                    )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
      // Loading indicator while fetching data
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
