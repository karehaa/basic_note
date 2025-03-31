import 'package:basic_note/auth/auth_service.dart';
import 'package:basic_note/color_pallete.dart';
import 'package:basic_note/services/helper_function.dart';
import 'package:basic_note/widgets/obscure_field.dart';
import 'package:basic_note/widgets/visible_field.dart';
import 'package:basic_note/widgets/multipurpose_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    super.key,
    required this.onTap,
    required this.onForgotPassword,
  });

  final void Function()? onTap;
  final void Function()? onForgotPassword;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator.adaptive()),
    );

    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      String loggedEmail = "${usernameController.text}@gmail.com";

      await auth.signInWithEmailAndPassword(
        email: loggedEmail,
        password: passwordController.text,
      );

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Masuk",
                    style: GoogleFonts.inter(
                      color: ColorPallete.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text("Selamat Datang Kembali!"),
                  const SizedBox(height: 41),
                  Image.asset(
                    'assets/image/basic_note_logo.png',
                    width: 70,
                    height: 72.33,
                  ),
                  const SizedBox(height: 37),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VisibleField(
                        fieldTitle: "Username",
                        labelText: "John",
                        controller: usernameController,
                      ),
                      ObscureField(
                        fieldTitle: "Password",
                        labelText: "**********",
                        controller: passwordController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: widget.onForgotPassword,
                            child: SizedBox(child: Text("Lupa password?")),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 17, top: 56),
                        child: MultipurposeButton(
                          buttonText: "Masuk",
                          ontap: () {
                            if (usernameController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              displayMessageToUser(
                                "All fields are required.",
                                context,
                              );
                            } else {
                              AuthService().signIn(
                                context,
                                usernameController.text.toLowerCase(),
                                passwordController.text,
                              );
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Belum punya akun? ",
                            style: GoogleFonts.inter(
                              color: ColorPallete.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              "Masuk",
                              style: GoogleFonts.inter(
                                color: ColorPallete.primary[900],
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
