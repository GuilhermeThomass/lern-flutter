import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Customtextfield extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatters;
  final FormFieldSetter<String>? onSaved;
  const Customtextfield({
    super.key,
    required this.label,
    this.validator,
    this.formatters,
    required this.onSaved,
  });

  @override
  State<Customtextfield> createState() => _CustomtextfieldState();
}

class _CustomtextfieldState extends State<Customtextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      margin: EdgeInsets.all(24),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: widget.onSaved,
        validator: widget.validator,
        inputFormatters: widget.formatters,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: widget.label,
          hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
