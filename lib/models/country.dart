import 'dart:convert';

/// Converts a JSON string into a list of Country objects
List<Country> countryFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

/// Converts a list of Country objects into a JSON string
String countryToJson(List<Country> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Main Country model representing a country with name, capital, continent, and flags
class Country {
  Name? name;
  List<String>? capital;
  List<String>? continents;
  Flags? flags;

  Country({this.name, this.capital, this.continents, this.flags});

  /// Factory method to create a Country from a JSON map
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      capital: json["capital"] == null
          ? []
          : List<String>.from(json["capital"]!.map((x) => x)),
      continents: json["continents"] == null
          ? []
          : List<String>.from(json["continents"]!.map((x) => x)),
      flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
    );
  }

  /// Converts the Country object into a JSON map
  Map<String, dynamic> toJson() => {
    "name": name?.toJson(),
    "capital":
    capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
    "continents": continents == null
        ? []
        : List<dynamic>.from(continents!.map((x) => x)),
    "flags": flags?.toJson(),
  };
}

/// Flags model to represent country flag data (PNG, SVG, alternative text)
class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({this.png, this.svg, this.alt});

  /// Factory method to create Flags from JSON
  factory Flags.fromJson(Map<String, dynamic> json) =>
      Flags(png: json["png"], svg: json["svg"], alt: json["alt"]);

  /// Converts Flags object into a JSON map
  Map<String, dynamic> toJson() => {"png": png, "svg": svg, "alt": alt};
}

/// Name model to represent country name data
class Name {
  String? common;
  String? official;

  Name({this.common, this.official});

  /// Factory method to create Name from JSON
  factory Name.fromJson(Map<String, dynamic> json) =>
      Name(common: json["common"], official: json["official"]);

  /// Converts Name object into a JSON map
  Map<String, dynamic> toJson() => {"common": common, "official": official};
}

