import 'package:basic_note/auth/auth_service.dart';
import 'package:basic_note/color_pallete.dart';
import 'package:basic_note/content/add_note_page.dart';
import 'package:basic_note/content/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsername();
  }

  Future<void> fetchUsername() async {
    String? fetchedUsername = await AuthService().getUsername();
    setState(() {
      username = fetchedUsername ?? "User";
      isLoading = false;
    });
  }

  Future<void> logOutUser(BuildContext context) async {
    AuthService().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.white,
      body: Center(
        child:
            isLoading
                ? const CircularProgressIndicator.adaptive()
                : Stack(
                  children: [
                    SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 21,
                              horizontal: 40,
                            ),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hola! $username",
                                      style: GoogleFonts.inter(
                                        color: ColorPallete.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "Siap menjalani hari mu?",
                                      style: GoogleFonts.inter(
                                        color: ColorPallete.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'assets/image/avatar.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            width: double.infinity,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search_rounded),
                                      filled: true,
                                      fillColor: ColorPallete.green,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed:
                                              () => AuthService().signOut(
                                                context,
                                              ),
                                          child: const Text("Log Out"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorPallete.primary[900],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.elliptical(16, 16),
                            topRight: Radius.elliptical(16, 16),
                          ),
                        ),
                        child: SafeArea(
                          top: false,
                          bottom: true,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 64),
                            height: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap:
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => const HomePage(),
                                        ),
                                      ),
                                  child: Image.asset(
                                    'assets/image/note_icon.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                GestureDetector(
                                  onTap:
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => const AddNotePage(),
                                        ),
                                      ),
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorPallete.secondary[500],
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: ColorPallete.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap:
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => const ProfilePage(),
                                        ),
                                      ),
                                  child: Image.asset(
                                    'assets/image/profile_icon.png',
                                    color: ColorPallete.white,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
