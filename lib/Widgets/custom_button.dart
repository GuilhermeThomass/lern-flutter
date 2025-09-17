import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custombutton extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final IconData? icon;
  final Function() onTap;
  final Color color;
  const Custombutton({
    super.key,
    this.width = 175,
    this.height = 45,
    required this.title,
    this.icon,
    this.color = Colors.blueAccent,
    required this.onTap,
  });

  @override
  State<Custombutton> createState() => _CustombuttonState();
}

class _CustombuttonState extends State<Custombutton> {
  bool isTaped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () async {
        setState(() {
          isTaped = true;
        });
        await Future.delayed(Duration(milliseconds: 120));
        setState(() {
          isTaped = false;
        });
        widget.onTap();
      },
      child: AnimatedScale(
        duration: Duration(milliseconds: 100),
        scale: isTaped ? .95 : 1,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: widget.color.withAlpha(30),
                blurRadius: 10,
                spreadRadius: 0.1,
                offset: Offset(10, 0),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                if (widget.icon != null)
                  Icon(widget.icon, color: Colors.white, size: 28),
                // if (widget.icon != null) SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
