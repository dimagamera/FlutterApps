import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArmounredVevicleCards extends StatefulWidget {
  final String armouredfightingToday;
  final String armounredVevicleTotal;

  const ArmounredVevicleCards(
      {super.key,
      required this.armouredfightingToday,
      required this.armounredVevicleTotal});

  @override
  State<ArmounredVevicleCards> createState() => _ArmounredVevicleCardsState();
}

class _ArmounredVevicleCardsState extends State<ArmounredVevicleCards> {
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
                        'https://russianwarship.rip/images/icons/icon-bbm.svg',
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.armounredVevicleTotal,
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
                      '(${widget.armouredfightingToday})',
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
                    Text('Бойових броньованих машин'),
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
