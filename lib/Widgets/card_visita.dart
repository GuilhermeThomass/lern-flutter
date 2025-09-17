import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardVisita extends StatefulWidget {
  const CardVisita({super.key});

  @override
  State<CardVisita> createState() => _CardVisitaState();
}

final List<Color> cores = [
  Colors.green,
  Colors.red.shade900,
  Colors.yellow.shade800,
];

Color corAleatoria() {
  final random = Random();
  int index = random.nextInt(cores.length);
  return cores[index];
}

class _CardVisitaState extends State<CardVisita> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.symmetric(vertical: 4, horizontal: 24),
      width: double.infinity,
      child: Row(
        spacing: 8,
        children: [
          Icon(Icons.circle, size: 16, color: corAleatoria()),
          Text(
            "Manginis",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.end,
              "17/09 às 13:30h",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
