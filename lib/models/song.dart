enum Cover {
  cover1(namecover: "Vinyl ส้ม", image: "assets/images/1.png"),
  cover2(namecover: "โน้ตเพลงเขียว", image: "assets/images/2.png"),
  cover3(namecover: "อีควอไลเซอร์ม่วง", image: "assets/images/3.png"),
  cover4(namecover: "Vinyl เหลือง", image: "assets/images/4.png"),
  cover5(namecover: "คลื่นเสียงชมพู", image: "assets/images/5.png"),
  cover6(namecover: "วงกลมฟ้า", image: "assets/images/6.png"),
  cover7(namecover: "อีควอไลเซอร์เขียว", image: "assets/images/7.png");

  const Cover({required this.image, required this.namecover});
  final String image;
  final String namecover;
}

// ประเภทเพลงสำหรับ Dropdown ในหน้าเพิ่มข้อมูล
const List<String> genres = ["ป็อป", "ร็อก", "ลูกทุ่ง", "แจ๊ส", "อิเล็กทรอนิกส์"];

class Song {
  Song({
    required this.title,
    required this.artist,
    required this.genre,
    required this.minutes,
    required this.cover,
  });

  String title;
  String artist;
  String genre;
  int minutes; // ความยาวเพลง (นาที)
  Cover cover;
}

List<Song> songs = [
  Song(
    title: "Sunset Drive",
    artist: "Neon Waves",
    genre: "อิเล็กทรอนิกส์",
    minutes: 4,
    cover: Cover.cover1,
  ),
  Song(
    title: "ใจเต้นตึกตัก",
    artist: "ลูกกวาด",
    genre: "ป็อป",
    minutes: 3,
    cover: Cover.cover2,
  ),
  Song(
    title: "Midnight Beat",
    artist: "DJ Pulse",
    genre: "อิเล็กทรอนิกส์",
    minutes: 5,
    cover: Cover.cover3,
  ),
  Song(
    title: "Golden Hour",
    artist: "The Vinyls",
    genre: "ร็อก",
    minutes: 4,
    cover: Cover.cover4,
  ),
  Song(
    title: "Blue Smoke",
    artist: "Miles & Co.",
    genre: "แจ๊ส",
    minutes: 6,
    cover: Cover.cover5,
  ),
  Song(
    title: "คิดถึงบ้านนา",
    artist: "สายฝน",
    genre: "ลูกทุ่ง",
    minutes: 4,
    cover: Cover.cover6,
  ),
  Song(
    title: "Green Light",
    artist: "Echo Park",
    genre: "ป็อป",
    minutes: 3,
    cover: Cover.cover7,
  ),
];
