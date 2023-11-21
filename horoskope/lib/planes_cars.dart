import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlanesCards extends StatefulWidget {
  final planesToday;
  final planesTotal;
  const PlanesCards({
    super.key,
    required this.planesToday,
    required this.planesTotal,
  });

  @override
  State<PlanesCards> createState() => _PlanesCardsState();
}

class _PlanesCardsState extends State<PlanesCards> {
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
                        'https://russianwarship.rip/images/icons/icon-plane.svg',
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.planesTotal,
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
                      '(${widget.planesToday})',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Text('Літаків')
              ],
            ),
          ),
        )
      ],
    );
  }
}
