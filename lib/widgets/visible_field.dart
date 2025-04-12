import 'package:basic_note/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisibleField extends StatefulWidget {
  const VisibleField({
    super.key,
    required this.fieldTitle,
    required this.labelText,
    required this.controller,
  });

  final String fieldTitle;
  final String labelText;
  final TextEditingController controller;

  @override
  State<VisibleField> createState() => _VisibleFieldState();
}

class _VisibleFieldState extends State<VisibleField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.fieldTitle,
              style: GoogleFonts.inter(
                color: ColorPallete.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: TextField(
              controller: widget.controller,
              style: GoogleFonts.inter(
                color: ColorPallete.primary[800],
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10.5,
                  bottom: 0,
                ),
                label: Text(
                  widget.labelText,
                  style: GoogleFonts.inter(
                    color: ColorPallete.primary[800],
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: ColorPallete.primary[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorPallete.primary[900]!,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorPallete.primary[900]!,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorPallete.primary[900]!,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
