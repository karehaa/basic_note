import 'package:basic_note/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MultipurposeButton extends StatelessWidget {
  const MultipurposeButton({
    super.key,
    required this.buttonText,
    required this.ontap,
  });

  final String buttonText;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorPallete.primary[900],
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        height: 43,
        child: Center(
          child: Text(
            buttonText,
            style: GoogleFonts.inter(
              color: ColorPallete.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
