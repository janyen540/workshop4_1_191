import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop4_1_191/models/song.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _artist = '';
  int _minutes = 0;
  String _genre = genres.first;
  Cover _cover = Cover.cover1; // ตัวแปรเก็บรูปปกที่เลือก

  TextStyle get _labelStyle => GoogleFonts.kanit(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "เพิ่มเพลงใหม่",
          style: GoogleFonts.kanit(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // ตัวอย่างรูปปกที่เลือก
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(_cover.image, width: 140, height: 140),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLength: 30,
                  decoration: InputDecoration(
                    label: Text("ชื่อเพลง", style: _labelStyle),
                    prefixIcon: const Icon(Icons.music_note),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนชื่อเพลง";
                    }
                    return null;
                  },
                  onSaved: (value) => _title = value!,
                ),
                TextFormField(
                  maxLength: 30,
                  decoration: InputDecoration(
                    label: Text("ชื่อศิลปิน", style: _labelStyle),
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนชื่อศิลปิน";
                    }
                    return null;
                  },
                  onSaved: (value) => _artist = value!,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("ความยาว (นาที)", style: _labelStyle),
                    prefixIcon: const Icon(Icons.timer),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return "กรุณาป้อนความยาวเป็นตัวเลข";
                    }
                    return null;
                  },
                  onSaved: (value) => _minutes = int.parse(value!),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _genre,
                  decoration: InputDecoration(
                    label: Text("ประเภทเพลง", style: _labelStyle),
                    prefixIcon: const Icon(Icons.category),
                  ),
                  items: genres.map((g) {
                    return DropdownMenuItem(
                      value: g,
                      child: Text(g, style: GoogleFonts.kanit()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _genre = value!;
                    });
                  },
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<Cover>(
                  value: _cover,
                  decoration: InputDecoration(
                    label: Text("เลือกรูปปก", style: _labelStyle),
                    prefixIcon: const Icon(Icons.image),
                  ),
                  items: Cover.values.map((c) {
                    return DropdownMenuItem(
                      value: c,
                      child: Row(
                        children: [
                          Text(c.namecover, style: GoogleFonts.kanit()),
                          const SizedBox(width: 10),
                          Image.asset(c.image, width: 30, height: 30),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _cover = value!;
                    });
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.save),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        songs.add(Song(
                          title: _title,
                          artist: _artist,
                          genre: _genre,
                          minutes: _minutes,
                          cover: _cover,
                        ));
                        _formKey.currentState!.reset();

                        // ย้อนกลับไปหน้าแสดงข้อมูล (item.dart จะ setState รีเฟรชเอง)
                        Navigator.pop(context);
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    label: Text(
                      "บันทึก",
                      style: GoogleFonts.kanit(fontSize: 20),
                    ),
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
