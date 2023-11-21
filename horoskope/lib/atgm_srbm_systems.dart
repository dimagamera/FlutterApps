import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Atgmsrbmsystemscards extends StatefulWidget {
  final String atgmsrbmsystemstoday;
  final String atgmsrbmsystemstotal;

  const Atgmsrbmsystemscards(
      {super.key,
      required this.atgmsrbmsystemstoday,
      required this.atgmsrbmsystemstotal});

  @override
  State<Atgmsrbmsystemscards> createState() => _AtgmsrbmsystemscardsState();
}

class _AtgmsrbmsystemscardsState extends State<Atgmsrbmsystemscards> {
  @override
  Widget build(context) {
    return Column(
      children: [
        Card(
          elevation: 4,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: SvgPicture.network(
                        'https://russianwarship.rip/images/icons/icon-trk.svg',
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.atgmsrbmsystemstotal,
                      style: const TextStyle(fontSize: 25),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      '+',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '(${widget.atgmsrbmsystemstoday})',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('крилатих ракет'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
