import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AaswarfareSystems extends StatefulWidget {
  final aawarfaresystemstoday;
  final aawarfaresystemstotal;
  const AaswarfareSystems(
      {super.key,
      required this.aawarfaresystemstoday,
      required this.aawarfaresystemstotal});

  @override
  State<AaswarfareSystems> createState() => _AaswarfareSystemsState();
}

class _AaswarfareSystemsState extends State<AaswarfareSystems> {
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
                        'https://russianwarship.rip/images/icons/icon-ppo.svg',
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.aawarfaresystemstotal,
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
                      '(${widget.aawarfaresystemstoday})',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('засобів ППО'),
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
