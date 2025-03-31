import 'package:basic_note/auth/auth_service.dart';
import 'package:basic_note/color_pallete.dart';
import 'package:basic_note/services/helper_function.dart';
import 'package:basic_note/widgets/obscure_field.dart';
import 'package:basic_note/widgets/visible_field.dart';
import 'package:basic_note/widgets/multipurpose_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator.adaptive()),
    );

    if (passwordController.text != confirmPasswordController.text) {
      Navigator.pop(context);

      displayMessageToUser("Password do not match!", context);
    } else {
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        FirebaseFirestore store = FirebaseFirestore.instance;
        String loggedEmail = "${usernameController.text}@gmail.com";

        UserCredential userCredential = await auth
            .createUserWithEmailAndPassword(
              email: loggedEmail,
              password: passwordController.text,
            );

        await store.collection("users").doc(userCredential.user!.uid).set({
          "username": usernameController.text,
          "nama_lengkap": namaController.text,
          "email": loggedEmail,
        });

        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
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
                    "Daftar",
                    style: GoogleFonts.inter(
                      color: ColorPallete.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text("Buat akun baru kamu!"),
                  const SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VisibleField(
                        fieldTitle: "Nama Lengkap",
                        labelText: "John Doe",
                        controller: namaController,
                      ),
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
                      ObscureField(
                        fieldTitle: "Confirm Password",
                        labelText: "**********",
                        controller: confirmPasswordController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 17, top: 56),
                        child: MultipurposeButton(
                          buttonText: "Daftar",
                          ontap: () {
                            if (namaController.text.isEmpty ||
                                usernameController.text.isEmpty ||
                                passwordController.text.isEmpty ||
                                confirmPasswordController.text.isEmpty) {
                              displayMessageToUser(
                                "All Fields are Required.",
                                context,
                              );
                            } else if (passwordController.text !=
                                confirmPasswordController.text) {
                              displayMessageToUser(
                                "Password do not match.",
                                context,
                              );
                            } else {
                              AuthService().signUp(
                                context,
                                usernameController.text,
                                namaController.text,
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
                            "Sudah punya akun? ",
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
