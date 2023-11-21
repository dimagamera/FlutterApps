import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Personalcards extends StatefulWidget {
  final String personalToday;
  final String personalTotal;

  const Personalcards({
    super.key,
    required this.personalToday,
    required this.personalTotal,
  });

  @override
  State<Personalcards> createState() => _CardsState();
}

class _CardsState extends State<Personalcards> {
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
                        'https://russianwarship.rip/images/icons/icon-people.svg',
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.personalTotal,
                      style: const TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      '+',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '(${widget.personalToday})',
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
                    Text('Особового складу'),
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
