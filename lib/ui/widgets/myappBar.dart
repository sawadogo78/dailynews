// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyappBar extends StatelessWidget {
  final String text1;
  final String text2;

  const MyappBar({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: const Color(0xFF2EFFFF),
      centerTitle: true,
      title: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: text1,
            style: GoogleFonts.acme(
              fontSize: 18,
              color: Colors.blue,
              letterSpacing: 2,
            ),
          ),
          const TextSpan(text: '  '),
          TextSpan(
            text: text2,
            style: GoogleFonts.amarante(
              color: Colors.red,
              fontSize: 25,
              letterSpacing: 3,
            ),
          ),
        ]),
      ),
    );
  }
}
