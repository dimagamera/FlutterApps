import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Specialmilitaryequip extends StatefulWidget {
  final String specialmilitaryequipToday;
  final String SpecialmilitaryequipTotal;

  const Specialmilitaryequip(
      {super.key,
      required this.specialmilitaryequipToday,
      required this.SpecialmilitaryequipTotal});

  @override
  State<Specialmilitaryequip> createState() => _SpecialmilitaryequipState();
}

class _SpecialmilitaryequipState extends State<Specialmilitaryequip> {
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
                        'https://russianwarship.rip/images/icons/icon-special.svg',
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.SpecialmilitaryequipTotal,
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
                      '(${widget.specialmilitaryequipToday})',
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
                    Text('спец. техніки'),
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
