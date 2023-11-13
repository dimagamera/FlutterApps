import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> emailList = [];
  String? selectedEmail;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(
        'https://www.1secmail.com/api/v1/?action=genRandomMailbox&count=10'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      setState(() {
        emailList = List<String>.from(data);
        emailList.insert(0, 'Выберите email');
        selectedEmail = emailList[0]; // Установка начального значения
      });
    } else {
      print('Error');
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      
      home: Scaffold(
        appBar: AppBar(title: Text('Temp Main')),
        body: Center(          
          child: Column(
            children: [
              SizedBox(height: 50,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Ваша тимчасова пошта', style: TextStyle(fontSize: 20),),
                    SizedBox(height: 13,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Expanded(
                            child: DropdownButton<String>(
                              value: selectedEmail,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedEmail = newValue;
                                });
                              },
                              icon: const Icon(Icons.arrow_drop_down),
                              items: emailList
                                  .map(
                                    (String email) => DropdownMenuItem<String>(
                                      value: email,
                                      child: Text(email),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        const Icon(Icons.email_outlined)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
