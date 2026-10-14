import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop4_1_191/models/song.dart';
import 'package:workshop4_1_191/screen/addform.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return Card(
                elevation: 3,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      song.cover.image,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.music_note, size: 40),
                    ),
                  ),
                  title: Text(
                    song.title,
                    style: GoogleFonts.kanit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple.shade900,
                    ),
                  ),
                  subtitle: Text(
                    "${song.artist}\n${song.genre}",
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  isThreeLine: true,
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time,
                          size: 18, color: Colors.pink),
                      Text(
                        "${song.minutes} นาที",
                        style: GoogleFonts.kanit(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: 100,
          height: 80,
          child: IconButton(
            icon: const Icon(
              Icons.add_circle,
              size: 48,
              color: Colors.deepPurple,
            ),
            onPressed: () async {
              // รอให้หน้า AddForm ปิดก่อน แล้วค่อยรีเฟรชรายการ
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddForm()),
              );
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
