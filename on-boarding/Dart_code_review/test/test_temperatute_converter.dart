import '../lib/temperature_converter.dart';
import 'package:test/test.dart';

void main() {
  group('TemperatureConverter', () {
    test('Celsius to Fahrenheit conversion', () {
      expect(TemperatureConverter.convertCelsiusToFahrenheit(0), equals(32.0));
      expect(
          TemperatureConverter.convertCelsiusToFahrenheit(100), equals(212.0));
      expect(
          TemperatureConverter.convertCelsiusToFahrenheit(-40), equals(-40.0));
    });

    test('Fahrenheit to Celsius conversion', () {
      expect(TemperatureConverter.convertFahrenheitToCelsius(32), equals(0.0));
      expect(
          TemperatureConverter.convertFahrenheitToCelsius(212), equals(100.0));
      expect(
          TemperatureConverter.convertFahrenheitToCelsius(-40), equals(-40.0));
    });
  });
}
