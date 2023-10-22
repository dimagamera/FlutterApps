import 'package:flutter/material.dart';
import 'dart:math';

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  final randomizer = Random();
  var rolldice = 'Гра правда чи дія';
  
  List<String> exctions = [
    'Поцілувати в щоку людину справа від вас.',
    'Встати на одну ногу і спробувати протриматися в цій позі протягом хвилини.',
    'Обійти кімнату, галопуючи, як ковбой, і кричати "Я - справжній ковбой!"',
    'Спробуй прочитати висловлювання задом наперед, не заплутавшись.',
    'Визнач іншого гравця, якому потрібно сказати комплімент і виголосити його перед всіма.',
    'Співпрацюй з іншим гравцем, щоб придумати комічний діалог на задану тему і виконає його перед групою.',
    'Спробуй зробити селфі з виразом обличчя, який обрано іншими учасниками гри.',
    'Повтори фразу, яку обрав інший гравець, як максимально смішно можеш.',
    'Виконай 10 присідань.',
    'Відтвори сцену з улюбленого фільму або телешоу і виконай одну з реплік персонажа.',
    'Спробуй зробити головний віджимання, якого здатний.',
    'Зроби іншому гравцю масаж голови або плечей протягом 1 хвилини.',
    'Виконай імпровізовану поезію на задану тему протягом 30 секунд.',
    'Спільно з іншим гравцем виграйте коротку сцену з діалогом на вибрану тему.',
    'Виконай смішний танець, який придумаєш самостійно.',
    'Спробуй сказати "Шишка шишку вилечить" 10 разів, якомога швидше.',
    'Поспільно з іншим гравцем розкажіть анекдот на смішну тему.',
    'Зроби селфі з виразом обличчя, який називається іншими гравцями.',
  ];
  List<String> trues = [
    'Ти коли-небудь подорожував за кордоном?',
    'Чи можеш ти співати пісню без музики?',
    'Ти коли-небудь був(-ла) на концерті свого улюбленого виконавця?',
    'Чи можеш ти сказати анекдот і зробити всіх посміхнутися?',
    'Ти коли-небудь стрибав(-ла) з парашутом?',
    'Чи знаєш ти, як приготувати свій улюблений страву?',
    'Ти коли-небудь грав(-ла) на музичному інструменті?',
    'Чи можеш ти заспівати народну пісню своєї країни?',
    'Ти коли-небудь робив(-ла) екстремальний вид спорту?',
    "Чи був у тебе коли-небудь інтерв'ю на роботу чи на важливу подію?",
    'Чи вмієш танцювати сучасні танці?',
    'Ти коли-небудь був(-ла) на фестивалі музики або мистецтва?',
    'Чи можеш ти розповісти анекдот на тему твого улюбленого смішного випуску?',
    'Ти коли-небудь брав(-ла) участь у спортивних змаганнях?',
    'Чи можеш ти знайти свій улюблений фільм у списку 10 секунд?',
    'Ти коли-небудь вигравав(-ла) якусь нагороду або приз на конкурсі або змаганні?',
    'Чи можеш ти викласти своє улюблене рецепт страви?',
    'Ти коли-небудь був(-ла) на рок-концерті?',
  ];

  void actionsbutton() {
    setState(() {
        String newAction;
        do{
          newAction = exctions[randomizer.nextInt(exctions.length)];
          }
        while (newAction == rolldice);
        rolldice = newAction.toString();
      });
}



  void truesbutton() {
    setState(() {
      String newTrues;
      do {
      newTrues = trues[randomizer.nextInt(trues.length)];
      }
      while (newTrues == rolldice);
      rolldice = newTrues.toString();
    });
  }

  @override
  Widget build(context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 240, 240, 240)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  rolldice.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextButton(
                    onPressed: actionsbutton,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 223, 186),
                      elevation: 1,
                    ),
                    child: Text(
                      'Дія',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextButton(
                    onPressed: truesbutton,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 223, 186),
                      elevation: 1,
                    ),
                    child: Text(
                      'Правда',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
