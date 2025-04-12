import 'package:basic_note/auth/auth_service.dart';
import 'package:basic_note/color_pallete.dart';
import 'package:basic_note/content/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? username;
  String? namaLengkap;
  bool isLoadingUsername = true;
  bool isLoadingNamaLengkap = true;

  @override
  void initState() {
    super.initState();
    fetchUsername();
    fetchNamaLengkap();
  }

  Future<void> fetchUsername() async {
    String? fetchedUsername = await AuthService().getUsername();
    setState(() {
      username = fetchedUsername ?? "User";
      isLoadingUsername = false;
    });
  }

  Future<void> fetchNamaLengkap() async {
    String? fetchedNamaLengkap = await AuthService().getNamaLengkap();
    setState(() {
      namaLengkap = fetchedNamaLengkap ?? "User";
      isLoadingNamaLengkap = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.white,
      body: Center(
        child:
            isLoadingUsername && isLoadingNamaLengkap
                ? const CircularProgressIndicator.adaptive()
                : Stack(
                  children: [
                    SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 76),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ColorPallete.primary[900]!,
                                    width: 4,
                                  ),
                                ),
                                child: Image.asset(
                                  'assets/image/avatar.png',
                                  width: 131.96,
                                  height: 132.22,
                                ),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      child: Text(
                                        "Nama Lengkap",
                                        style: GoogleFonts.inter(
                                          color: ColorPallete.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorPallete.primary[50],
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: ColorPallete.primary[900]!,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "$namaLengkap",
                                            style: GoogleFonts.inter(
                                              color: ColorPallete.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                        top: 16,
                                      ),
                                      child: Text(
                                        "Username",
                                        style: GoogleFonts.inter(
                                          color: ColorPallete.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorPallete.primary[50],
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: ColorPallete.primary[900]!,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "$username",
                                            style: GoogleFonts.inter(
                                              color: ColorPallete.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 30,
                                      ),
                                      child: Container(
                                        height: 43,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: ColorPallete.primary[900],
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Edit Profil",
                                            style: GoogleFonts.inter(
                                              color: ColorPallete.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 53,
                                        vertical: 14,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            'assets/image/basic_note_logo.png',
                                            width: 30,
                                            height: 31,
                                          ),
                                          Text(
                                            "My Basic Note",
                                            style: GoogleFonts.inter(
                                              color: ColorPallete.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "Ver 1.0",
                                            style: GoogleFonts.inter(
                                              color: ColorPallete.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 107),
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text(
                                      "Ingin beralih akun?",
                                      style: GoogleFonts.inter(
                                        color: ColorPallete.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    GestureDetector(
                                      onTap:
                                          () => AuthService().signOut(context),
                                      child: Container(
                                        width: double.infinity,
                                        height: 43,
                                        decoration: BoxDecoration(
                                          color: ColorPallete.red,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Keluar",
                                            style: GoogleFonts.inter(
                                              color: ColorPallete.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 141),
                            ],
                          ),
                        ),
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
                                    'assets/image/note_icon_off.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                Container(
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
                                    'assets/image/profile_icon_on.png',
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
