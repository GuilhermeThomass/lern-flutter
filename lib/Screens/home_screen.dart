import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primeiro/Widgets/card_hist.dart';
import 'package:primeiro/Widgets/card_visita.dart';
import 'package:primeiro/Widgets/main_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(color: Colors.grey[50], height: 64 + 16),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0C4658), Color(0xFF469CB7)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            height: 140,
            width: double.infinity,
            child: Container(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 8,
                    children: [
                      SvgPicture.asset('assets/Logo_out.svg', height: 40),
                      Text(
                        "Persist Informatica",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(55),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Icon(
                      Icons.notifications_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 108),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.grey[50],
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.all(8),
                  child: Text(
                    "Você tem 6 visitar marcadas",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                MainButton(),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  child: Text(
                    "Últimos atendimentos",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                for (int i = 0; i < 3; i++) CardHist(),
                Padding(
                  padding: EdgeInsetsGeometry.all(8),
                  child: Text(
                    "Visitas planejadas",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: BoxBorder.all(color: Colors.grey.shade300),
                      ),

                      child: ListView(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        children: [for (int i = 0; i < 6; i++) CardVisita()],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
