import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingButton extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final IconData? icon;
  final Future<void> Function() onTap;
  final Color color;

  const CustomLoadingButton({
    super.key,
    this.width = 200,
    this.height = 45,
    required this.title,
    this.icon,
    required this.onTap,
    this.color = Colors.blueAccent,
  });

  @override
  State<CustomLoadingButton> createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton> {
  bool isLoading = false;
  bool showText = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () async {
        setState(() {
          isLoading = true;
          showText = false;
        });

        await widget.onTap();

        setState(() {
          isLoading = false;
        });
        Future.delayed(Duration(milliseconds: 100)).then((_) {
          setState(() {
            showText = true;
          });
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isLoading ? 60 : widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: widget.color.withAlpha(50),
              blurRadius: 10,
              spreadRadius: 0.1,
              offset: Offset(10, 0),
            ),
          ],
        ),
        child: isLoading
            ? Center(
                child: LoadingAnimationWidget.discreteCircle(
                  color: Colors.white,
                  size: 24,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null && showText)
                    Icon(widget.icon, color: Colors.white, size: 16),
                  if (widget.icon != null) SizedBox(width: 8),
                  if (showText)
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
