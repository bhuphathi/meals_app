import 'package:flutter/material.dart';

class MealItemDetail extends StatelessWidget {
  const MealItemDetail({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.amber[50],
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: Colors.amber[50],
          ),
        )
      ],
    );
  }
}
