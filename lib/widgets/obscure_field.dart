import 'package:basic_note/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ObscureField extends StatefulWidget {
  const ObscureField({
    super.key,
    required this.fieldTitle,
    required this.labelText,
    required this.controller,
  });

  final String fieldTitle;
  final String labelText;
  final TextEditingController controller;

  @override
  State<ObscureField> createState() => _ObscureFieldState();
}

class _ObscureFieldState extends State<ObscureField> {
  bool isObscured = true;

  void toggleObscure() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 12),
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
              obscuringCharacter: "*",
              obscureText: isObscured,
              style: GoogleFonts.inter(
                color: ColorPallete.primary[800],
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
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
                suffixIcon: IconButton(
                  onPressed: toggleObscure,
                  icon: Icon(
                    isObscured ? Icons.visibility_off : Icons.visibility,
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
