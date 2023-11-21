import 'dart:convert';
import 'package:horoskope/aa_warfare_systems.dart';
import 'package:horoskope/armoured_vehicle.dart';
import 'package:horoskope/artillery_systems.dart';
import 'package:horoskope/atgm_srbm_systems.dart';
import 'package:horoskope/helicopters.dart';
import 'package:horoskope/mlrs_cards.dart';
import 'package:horoskope/personnel_card.dart';
import 'package:horoskope/planes_cars.dart';
import 'package:horoskope/special_military_equip.dart';
import 'package:horoskope/submarines.dart';
import 'package:horoskope/tank_card.dart';
import 'package:flutter/material.dart';
import 'package:horoskope/uav_systems.dart';
import 'package:horoskope/vehicles_fuel_tanks.dart';
import 'package:horoskope/warships_cutters.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentDayWar = '';
  String _currentDateWar = '';

  String _tanksToday = '';
  String _tanksTotal = '';

  String _personnelunitstoday = '';
  String _totalpersonnelunits = '';

  String _armountedVehicleToday = '';
  String _armountedVehicleTotal = '';

  String _artillerysystemsToday = '';
  String _artillerysystemsTotal = '';

  String _mlrsToday = '';
  String _mlrsTotal = '';

  String _aawarfaresystemsToDay = '';
  String _aawarfaresystemsTotal = '';

  String _planesToDay = '';
  String _planesTotal = '';

  String _helicoptersToDay = '';
  String _helicoptersTotal = '';

  String _vehiclesfueltanksToDay = '';
  String _vehiclesfueltanksTotal = '';

  String _warshipsCuttersToDay = '';
  String _warshipsCuttersTotal = '';

  String _uavsystemsToDay = '';
  String _uavsystemsToTotal = '';

  String _specialmilitaryequipToDay = '';
  String _specialmilitaryequipTotal = '';

  String _atgmSrbmsystemstoday = '';
  String _atgmSrbmsystemsTotal = '';

  String _submarinestoday = '';
  String _submarinestotal = '';

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    String currentUrl = 'https://russianwarship.rip/api/v2/statistics/latest';
    final response = await http.get(Uri.parse(currentUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(
        () {
          _currentDayWar = data['data']['day'].toString();
          _currentDateWar = data['data']['date'].toString();

          _tanksToday = data['data']['increase']['tanks'].toString();
          _tanksTotal = data['data']['stats']['tanks'].toString();

          _personnelunitstoday =
              data['data']['increase']['personnel_units'].toString();
          _totalpersonnelunits =
              data['data']['stats']['personnel_units'].toString();

          _armountedVehicleToday =
              data['data']['increase']['armoured_fighting_vehicles'].toString();
          _armountedVehicleTotal =
              data['data']['stats']['armoured_fighting_vehicles'].toString();

          _artillerysystemsToday =
              data['data']['increase']['artillery_systems'].toString();
          _artillerysystemsTotal =
              data['data']['stats']['artillery_systems'].toString();

          _mlrsToday = data['data']['increase']['mlrs'].toString();
          _mlrsTotal = data['data']['stats']['mlrs'].toString();

          _aawarfaresystemsToDay =
              data['data']['increase']['aa_warfare_systems'].toString();
          _aawarfaresystemsTotal =
              data['data']['stats']['aa_warfare_systems'].toString();

          _planesToDay = data['data']['increase']['planes'].toString();
          _planesTotal = data['data']['stats']['planes'].toString();

          _helicoptersToDay =
              data['data']['increase']['helicopters'].toString();
          _helicoptersTotal = data['data']['stats']['helicopters'].toString();

          _vehiclesfueltanksToDay =
              data['data']['increase']['vehicles_fuel_tanks'].toString();
          _vehiclesfueltanksTotal =
              data['data']['stats']['vehicles_fuel_tanks'].toString();

          _warshipsCuttersToDay =
              data['data']['increase']['warships_cutters'].toString();
          _warshipsCuttersTotal =
              data['data']['stats']['warships_cutters'].toString();

          _uavsystemsToDay = data['data']['increase']['uav_systems'].toString();
          _uavsystemsToTotal = data['data']['stats']['uav_systems'].toString();

          _specialmilitaryequipToDay =
              data['data']['increase']['special_military_equip'].toString();
          _specialmilitaryequipTotal =
              data['data']['stats']['special_military_equip'].toString();

          _atgmSrbmsystemstoday =
              data['data']['increase']['cruise_missiles'].toString();
          _atgmSrbmsystemsTotal =
              data['data']['stats']['cruise_missiles'].toString();

          _submarinestoday = data['data']['increase']['submarines'].toString();
          _submarinestotal = data['data']['stats']['submarines'].toString();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Загальні втрати ворога'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    fetchData();
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Станом на $_currentDateWar',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    '$_currentDayWar-й день війни',
                    style: const TextStyle(fontSize: 15, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Personalcards(
                          personalToday: _personnelunitstoday,
                          personalTotal: _totalpersonnelunits,
                        ),
                        Tankcards(
                          tanksToday: _tanksToday,
                          tanksTotal: _tanksTotal,
                        ),
                        ArmounredVevicleCards(
                          armouredfightingToday: _armountedVehicleToday,
                          armounredVevicleTotal: _armountedVehicleTotal,
                        ),
                        ArtillerySystem(
                          artillerySystemtoday: _artillerysystemsToday,
                          artillerySystemtotal: _artillerysystemsTotal,
                        ),
                        MlrsCards(
                          mlrsToday: _mlrsToday,
                          mlrsTotal: _mlrsTotal,
                        ),
                        AaswarfareSystems(
                          aawarfaresystemstoday: _aawarfaresystemsToDay,
                          aawarfaresystemstotal: _aawarfaresystemsTotal,
                        ),
                        PlanesCards(
                            planesToday: _planesToDay,
                            planesTotal: _planesTotal),
                        Helipoters(
                            helicoptersToDay: _helicoptersToDay,
                            helicoptersTotal: _helicoptersTotal),
                        VehicleFuelTanks(
                          vehicletoday: _vehiclesfueltanksToDay,
                          vehicletotal: _vehiclesfueltanksTotal,
                        ),
                        Warshipscutters(
                          warshipscuttersToDay: _warshipsCuttersToDay,
                          warshipscuttersTotal: _warshipsCuttersTotal,
                        ),
                        Uavsystems(
                          uavsystemtoday: _uavsystemsToDay,
                          uavsystemstotal: _uavsystemsToTotal,
                        ),
                        Specialmilitaryequip(
                          specialmilitaryequipToday: _specialmilitaryequipToDay,
                          SpecialmilitaryequipTotal: _specialmilitaryequipTotal,
                        ),
                        Atgmsrbmsystemscards(
                            atgmsrbmsystemstoday: _atgmSrbmsystemstoday,
                            atgmsrbmsystemstotal: _atgmSrbmsystemsTotal),
                        Submarinecards(
                            submarinestoday: _submarinestoday,
                            submarinestotal: _submarinestotal),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
