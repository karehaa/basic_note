import 'package:basic_note/color_pallete.dart';
import 'package:basic_note/content/update_note_page.dart';
import 'package:basic_note/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('dd MMMM yyyy').format(note.date);

    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpdateNotePage(note: note)),
          ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        width: 140,
        height: 186,
        decoration: BoxDecoration(
          color:
              note.color == "blue"
                  ? ColorPallete.primary[100]
                  : ColorPallete.secondary[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReadMoreText(
                  note.title,
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: " ",
                  trimExpandedText: "",
                  style: GoogleFonts.inter(
                    color: ColorPallete.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                ReadMoreText(
                  note.content,
                  trimLength: 90,
                  trimCollapsedText: " ",
                  trimExpandedText: "",
                  trimMode: TrimMode.Length,
                  style: GoogleFonts.inter(
                    color: ColorPallete.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Text(
              date,
              style: GoogleFonts.inter(
                color: ColorPallete.primary[900],
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
