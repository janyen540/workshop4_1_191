import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:workshop4_1_191/screen/item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "เพลย์ลิสต์ของฉัน",
          style: GoogleFonts.kanit(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: const Item(),
    );
  }
}
