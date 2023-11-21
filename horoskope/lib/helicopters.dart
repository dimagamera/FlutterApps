import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Helipoters extends StatefulWidget {
  final helicoptersToDay;
  final helicoptersTotal;
  const Helipoters({
    super.key,
    required this.helicoptersToDay,
    required this.helicoptersTotal,
  });

  @override
  State<Helipoters> createState() => _HelipotersState();
}

class _HelipotersState extends State<Helipoters> {
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
                        'https://russianwarship.rip/images/icons/icon-helicopter.svg',
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.helicoptersTotal,
                      style: const TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '+',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '(${widget.helicoptersToDay})',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('гелікоптерів'),
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
