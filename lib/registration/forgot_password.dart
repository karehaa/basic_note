import 'package:basic_note/color_pallete.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key, required this.onBack});

  final void Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.white,
      body: Center(
        child: ElevatedButton(onPressed: onBack, child: Text("Back")),
      ),
    );
  }
}
