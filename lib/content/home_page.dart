import 'package:basic_note/model/note_model.dart';
import 'package:basic_note/services/auth/auth_service.dart';
import 'package:basic_note/color_pallete.dart';
import 'package:basic_note/content/add_note_page.dart';
import 'package:basic_note/content/profile_page.dart';
import 'package:basic_note/services/bloc/note_cubit.dart';
import 'package:basic_note/widgets/note_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  bool isLoading = true;
  late NoteCubit noteCubit;

  @override
  void initState() {
    super.initState();
    noteCubit = NoteCubit();
    noteCubit.loadNotes();
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
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    return BlocProvider.value(
      value: noteCubit,
      child: Scaffold(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                              ),
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
                                  Container(
                                    height: screenHeight - (screenHeight * 0.3),
                                    child: BlocBuilder<
                                      NoteCubit,
                                      List<NoteModel>
                                    >(
                                      builder: (context, notes) {
                                        if (notes.isEmpty) {
                                          return const Center(
                                            child: Text("List is Empty"),
                                          );
                                        }

                                        return GridView.builder(
                                          padding: EdgeInsets.only(
                                            top: 28,
                                            bottom:
                                                screenHeight -
                                                (screenHeight * 0.92),
                                          ),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 50,
                                                mainAxisSpacing: 20,
                                                childAspectRatio: 140 / 186,
                                              ),
                                          itemCount: notes.length,
                                          itemBuilder: (context, index) {
                                            NoteModel note = notes[index];
                                            return NoteCard(note: note);
                                          },
                                        );
                                      },
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 64,
                              ),
                              height: 75,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                (context) =>
                                                    const AddNotePage(),
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
                                                (context) =>
                                                    const ProfilePage(),
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
      ),
    );
  }
}
