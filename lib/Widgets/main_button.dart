import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primeiro/Widgets/custom_button.dart';
import 'package:intl/intl.dart';

class MainButton extends StatefulWidget {
  const MainButton({super.key});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  int stateOpen = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0C4658), Color(0xFF469CB7)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Persist Informatica",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Apliper Gestor",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsGeometry.only(right: 4),
                      child: Text(
                        DateFormat('HH:mm').format(DateTime.now()),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Custombutton(
                title: stateOpen == 0
                    ? "Começar a gravar"
                    : stateOpen == 1
                    ? "Finalizar gravação"
                    : "Confirmar finalização",
                icon: stateOpen == 0
                    ? Icons.play_arrow_rounded
                    : stateOpen == 1
                    ? Icons.pause
                    : Icons.check,
                width: double.infinity,
                color: Colors.amber.shade700,
                onTap: () {
                  setState(() {
                    if (stateOpen > 1) {
                      stateOpen = 0;
                    } else {
                      stateOpen += 1;
                    }
                  });
                },
              ),
            ),
            AnimatedCrossFade(
              alignment: Alignment.center,
              firstChild: SizedBox.shrink(),
              secondChild: Center(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 16,
                    left: 8,
                    right: 8,
                    bottom: 8,
                  ),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amber.shade200,
                    backgroundColor: Colors.amber.shade500,
                  ),
                ),
              ),
              crossFadeState: stateOpen == 1
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 300),
            ),
            AnimatedCrossFade(
              alignment: Alignment.center,
              firstChild: SizedBox.shrink(),
              secondChild: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Container(
                    height: 96,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              crossFadeState: stateOpen == 2
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}
