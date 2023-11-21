import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tankcards extends StatefulWidget {
  final String tanksToday;
  final String tanksTotal;
  const Tankcards(
      {Key? key, required this.tanksToday, required this.tanksTotal})
      : super(key: key);

  @override
  State<Tankcards> createState() => _CardsState();
}

class _CardsState extends State<Tankcards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4,
          child: Container(
            padding:
                const EdgeInsets.all(8), // Добавляем отступы для контейнера
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .start, // Выравнивание содержимого в начало
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: SvgPicture.network(
                        'https://russianwarship.rip/images/icons/icon-tank.svg',
                        // Индикатор загрузки
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                        fit:
                            BoxFit.contain, // Устанавливаем фит для изображения
                      ),
                    ),
                    const SizedBox(
                        width:
                            15), // Добавляем расстояние между изображением и текстом
                    Text(
                      widget.tanksTotal,
                      style: const TextStyle(fontSize: 25),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      '+',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      '(${widget.tanksToday})',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text('Танків')],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
