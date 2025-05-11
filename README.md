# 🌍 Country Info App

A Flutter application that fetches and displays a list of countries using the REST Countries API. It shows each country’s name, capital, continent, and flag in a responsive, scrollable interface.

## 🚀 Features

- Fetches real-time data from the REST Countries API
- Displays:
  - Country name
  - Capital city
  - Continent
  - Flag image
- Shows a loading indicator while fetching data
- Clean and modular code structure (API, Service, Model, UI layers)

## 📦 Folder Structure

lib/


├── models/ # Data models (Country, Flags, Name)


├── provider/ # API layer (CountryApi class)


├── service/ # Business logic layer (CountryService)


├── screens/ # UI screens (HomePage)


├── main.dart # App entry point

## 📡 API Used

- [REST Countries v3.1 API](https://restcountries.com/#api-endpoints-v3-all)
