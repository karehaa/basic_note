import 'package:basic_note/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController judulController = TextEditingController();
  TextEditingController isiController = TextEditingController();
  bool blueSelected = true;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentDate = DateFormat('dd MMMM yyyy').format(now);
    String wordCount = "${isiController.text.length}";

    return Scaffold(
      backgroundColor: ColorPallete.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 25),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(color: ColorPallete.primary[900]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: ColorPallete.white,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Buat Notes Baru",
                      style: GoogleFonts.inter(
                        color: ColorPallete.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Catat Keajaibanmu!",
                      style: GoogleFonts.inter(
                        color: ColorPallete.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                centerTitle: false,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check_rounded,
                      color: ColorPallete.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 31, horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 52,
                  child: TextField(
                    controller: judulController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      hintText: "Judul...",
                      hintStyle: GoogleFonts.inter(
                        color: ColorPallete.grey.withAlpha(100),
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      fillColor: ColorPallete.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 31, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(currentDate), Text("$wordCount/5000")],
                  ),
                ),
                SizedBox(
                  height: 517,
                  child: TextField(
                    textAlign: TextAlign.justify,
                    onChanged: (text) {
                      setState(() {
                        wordCount = "${text.length}";
                      });
                    },
                    controller: isiController,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    inputFormatters: [LengthLimitingTextInputFormatter(5000)],
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      hintText: "Isikan sesuatu...",
                      hintStyle: GoogleFonts.inter(
                        color: ColorPallete.grey.withAlpha(100),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      fillColor: ColorPallete.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            blueSelected = true;
                          });
                        },
                        child: Container(
                          width: 95,
                          height: 28,
                          decoration: BoxDecoration(
                            color:
                                blueSelected
                                    ? ColorPallete.primary[200]
                                    : ColorPallete.white,
                            border: Border.all(
                              width: 1,
                              color: ColorPallete.primary[900]!,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                const SizedBox(width: 9),
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: ColorPallete.primary[100],
                                    border: Border.all(
                                      color: ColorPallete.primary[900]!,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "Biru",
                                  style: GoogleFonts.inter(
                                    color: ColorPallete.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            blueSelected = false;
                          });
                        },
                        child: Container(
                          width: 95,
                          height: 28,
                          decoration: BoxDecoration(
                            color:
                                blueSelected
                                    ? ColorPallete.white
                                    : ColorPallete.primary[200],
                            border: Border.all(
                              width: 1,
                              color: ColorPallete.primary[900]!,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                const SizedBox(width: 9),
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: ColorPallete.secondary[100],
                                    border: Border.all(
                                      color: ColorPallete.primary[900]!,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "Oranye",
                                  style: GoogleFonts.inter(
                                    color: ColorPallete.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
