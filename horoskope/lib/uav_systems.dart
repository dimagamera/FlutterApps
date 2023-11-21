import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Uavsystems extends StatefulWidget{
  final uavsystemtoday;
  final uavsystemstotal;
  const Uavsystems({super.key, required this.uavsystemtoday, required this.uavsystemstotal});

  @override
  State<Uavsystems> createState() => _UavsystemsState();
}

class _UavsystemsState extends State<Uavsystems> {
  Widget build(context){
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
                        'https://russianwarship.rip/images/icons/icon-bpla.svg',
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.uavsystemstotal,
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
                      '(${widget.uavsystemtoday})',
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
                    Text('БПЛА'),
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
