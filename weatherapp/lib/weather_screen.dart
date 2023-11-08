import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weatherapp/SecretsKey.dart';
import 'dart:ui' as ui;
import 'package:weatherapp/hourly_forecast_item.dart';
import 'package:weatherapp/info_item.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _selectedCity = TextEditingController();
  late Future<Map<String, dynamic>> _weatherData;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _weatherData = _fetchWeatherData('Dubno'); // Set default city
  }

  Future<Map<String, dynamic>> _fetchWeatherData(String cityName) async {
    try {
      final urlWeather =
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey&units=metric';
      final res = await http.get(Uri.parse(urlWeather));
      final data = jsonDecode(res.body);
      if (int.parse(data['cod'].toString()) != 200) {
        setState(() {
          errorMessage = 'City not found';
        });
        return {}; // Returning empty map as per your requirements
      }
      return data;
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
      return {}; // Returning empty map as per your requirements
    }
  }

  void _updateWeatherData(String cityName) {
    setState(() {
      _weatherData = _fetchWeatherData(cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather APP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (_selectedCity.text.isNotEmpty) {
                _updateWeatherData(_selectedCity.text);
              } // Refresh weather data
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _weatherData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LinearProgressIndicator();
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Problem'),
              );
            }

            final data = snapshot.data as Map<String, dynamic>;
            if (data.isEmpty) {
              return Center(
                child: Text(errorMessage ?? 'Problem'),
              );
            } else {
              final currentWeatherData = data['list'][0];
              final currentTemp = currentWeatherData['main']['temp'];
              final currentSky = currentWeatherData['weather'][0]['main'];
              final currentPressure = currentWeatherData['main']['pressure'];
              final currentWindSpeed = currentWeatherData['wind']['speed'];
              final currentHumidity = currentWeatherData['main']['humidity'];

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _selectedCity,
                      decoration: const InputDecoration(
                        labelText: 'Enter city',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_selectedCity.text.isNotEmpty) {
                          _updateWeatherData(_selectedCity.text);
                        }
                      },
                      child: const Text('Search'),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 15,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                          child: BackdropFilter(
                            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 0.5),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    '$currentTemp °C',
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Icon(
                                    currentSky == 'Clouds' || currentSky == 'Rain'
                                        ? Icons.cloud
                                        : Icons.wb_sunny,
                                    size: 68,
                                  ),
                                  Text(
                                    currentSky,
                                    style: const TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Hourly Forecast',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final hourlyForecast = data['list'][index + 1];
                          final hourlySky =
                              data['list'][index + 1]['weather'][0]['main'];
                          final hourlyTemp = hourlyForecast['main']['temp'];
                          final time = DateTime.parse(hourlyForecast['dt_txt']);
                          return HourlyForecastItem(
                            labeltime: DateFormat.Hm().format(time),
                            icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                                ? Icons.cloud
                                : Icons.wb_sunny,
                            labeltext: hourlyTemp.toString(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Additional Information',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoItem(
                          icon: Icons.water_drop,
                          label: 'Humidity',
                          value: currentHumidity.toString(),
                        ),
                        InfoItem(
                          icon: Icons.air,
                          label: 'Wind Speed',
                          value: currentWindSpeed.toString(),
                        ),
                        InfoItem(
                          icon: Icons.beach_access,
                          label: 'Pressure',
                          value: currentPressure.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
