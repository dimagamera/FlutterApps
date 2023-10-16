import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget{
  final IconData icon;
  final String labeltime;
  final String labeltext;
  const HourlyForecastItem({super.key, required this.labeltime, required this.icon, required this.labeltext});

  @override
  Widget build(BuildContext context){
    return Card(
                    elevation: 6,
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: 
                        [
                          Text(labeltime, style: const TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                          ),
                        const SizedBox(height: 10,),
                        Icon(icon, size: 32),
                        const SizedBox(height: 10,),
                        Text(labeltext)
                        ]
                        ),
                        
                    ),
                  );
  }
}