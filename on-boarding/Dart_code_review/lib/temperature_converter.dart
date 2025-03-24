import 'dart:io';

class TemperatureConverter {
  /// Converts Celsius to Fahrenheit
  /// Ensures input is within a reasonable temperature range
  static double convertCelsiusToFahrenheit(double celsius) {
    if (celsius < -273.15) {
      throw ArgumentError(
          'Temperature cannot be below absolute zero (-273.15°C).');
    }
    return (celsius * 9 / 5) + 32;
  }

  /// Converts Fahrenheit to Celsius
  /// Ensures input is within a reasonable temperature range
  static double convertFahrenheitToCelsius(double fahrenheit) {
    if (fahrenheit < -459.67) {
      throw ArgumentError(
          'Temperature cannot be below absolute zero (-459.67°F).');
    }
    return (fahrenheit - 32) * 5 / 9;
  }
}

void main() {
  print('Choose conversion type:');
  print('1: Celsius to Fahrenheit');
  print('2: Fahrenheit to Celsius');

  stdout.write('Enter choice (1 or 2): ');
  String? choice = stdin.readLineSync();

  if (choice == '1') {
    stdout.write('Enter temperature in Celsius: ');
    String? input = stdin.readLineSync();
    double? celsius = double.tryParse(input ?? '');

    if (celsius == null) {
      print('Invalid input. Please enter a valid number.');
      return;
    }
    try {
      double fahrenheit =
          TemperatureConverter.convertCelsiusToFahrenheit(celsius);
      print('$celsius°C = $fahrenheit°F');
    } catch (e) {
      print(e);
    }
  } else if (choice == '2') {
    stdout.write('Enter temperature in Fahrenheit: ');
    String? input = stdin.readLineSync();
    double? fahrenheit = double.tryParse(input ?? '');

    if (fahrenheit == null) {
      print('Invalid input. Please enter a valid number.');
      return;
    }
    try {
      double celsius =
          TemperatureConverter.convertFahrenheitToCelsius(fahrenheit);
      print('$fahrenheit°F = $celsius°C');
    } catch (e) {
      print(e);
    }
  } else {
    print('Invalid choice. Please enter 1 or 2.');
  }
}
