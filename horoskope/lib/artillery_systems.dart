import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArtillerySystem extends StatefulWidget {
  final String artillerySystemtoday;
  final String artillerySystemtotal;


  @override
  const ArtillerySystem(
      {super.key,
      required this.artillerySystemtoday,
      required this.artillerySystemtotal});
  @override
  State<ArtillerySystem> createState() => _ArtillerySystemState();
}

class _ArtillerySystemState extends State<ArtillerySystem> {
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
                        'https://russianwarship.rip/images/icons/icon-art.svg',
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.artillerySystemtotal,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
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
                      '(${widget.artillerySystemtoday})',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                const Text('Артилерійських систем'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
