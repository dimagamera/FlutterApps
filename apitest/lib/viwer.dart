import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cards.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _ip = '';
  String _country = '';
  String _region = '';
  String _city = '';
  String _timeZone = '';
  String _currency = '';
  String _as = '';
  String success = 'success';
  final _ipController = TextEditingController();
  String newIP = '';

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    newIP = _ipController.text;
    final response = await http.get(Uri.parse('http://ip-api.com/json/$newIP'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      success = data['status'];
      if (success == 'success') {
        setState(() {
           _ip = data['query'];
           _country = data['country'];
           _region = data['regionName'];
           _city = data['city'];
           _as = data['as'];
           _timeZone = data['timezone'];
          
        });
        print('Trues');
      } else if (success == false) {
        print('false');
      }
    } else {
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('NSLookUP'),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 200,
                  height: 450,
                  child: CardExp(
                  ip: _ip,
                  country: _country,
                  city: _city,
                  region: _region,
                  as: _as,
                  timezone: _timeZone,

                  ), // Передача ip и type в CardExp
                ),
                TextField(
                  controller: _ipController,
                  maxLength: 100,
                  decoration:
                      const InputDecoration(hintText: 'Введіть адресу'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: fetchData,
                      child: const Text(
                        'Пошук',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      _ipController.clear(); 
                    }, child: Text('Скинути', style:  TextStyle(color: Colors.white),))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
