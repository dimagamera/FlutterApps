import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MlrsCards extends StatefulWidget {
  final mlrsToday;
  final mlrsTotal;
  const MlrsCards({
    super.key,
    required this.mlrsToday,
    required this.mlrsTotal,
  });

  @override
  State<MlrsCards> createState() => _MlrsCardsState();
}

class _MlrsCardsState extends State<MlrsCards> {
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
                        'https://russianwarship.rip/images/icons/icon-rszv.svg',
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.mlrsTotal,
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
                      '(${widget.mlrsToday})',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                ),
               const Text('РСЗВ')
              ],
            ),
          ),
        )
      ],
    );
  }
}
