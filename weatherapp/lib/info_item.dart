import 'package:flutter/material.dart';
class InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const InfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32,),
        const SizedBox(height: 8,),
        Text(label, style: const TextStyle(fontSize: 15),),
        const SizedBox(height: 8,),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
      ],
    );
  }
}