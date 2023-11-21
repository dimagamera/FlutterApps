import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardExp extends StatefulWidget {
  final String ip;
  final String country;
  final String city;
  final String region;
  final String as;
  final String timezone;
  const CardExp(
      {Key? key,
      required this.ip,
      required this.country,
      required this.city,
      required this.region,
      required this.as,
      required this.timezone})
      : super(key: key);

  @override
  State<CardExp> createState() => _CardExpState();
}

class _CardExpState extends State<CardExp> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Адреса',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.ip,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Країна',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.country,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Регіон',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.region,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Місто',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.city,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height:10),
                    const Text(
                      'Провайдер',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.as,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Часовий пояс',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.timezone,
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
