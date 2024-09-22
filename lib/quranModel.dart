class QuranModel {
  String arti;
  String asma;
  int ayat;
  String nama;
  String type;
  String urut;
  String audio;
  String nomor;
  String rukuk;
  String keterangan;

  QuranModel({
    required this.arti,
    required this.asma,
    required this.ayat,
    required this.nama,
    required this.type,
    required this.urut,
    required this.audio,
    required this.nomor,
    required this.rukuk,
    required this.keterangan,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
        arti: json['arti'] as String,
        asma: json['asma'] as String,
        ayat: json['ayat'] as int,
        nama: json['nama'] as String,
        type: json['type'] as String,
        urut: json['urut'] as String,
        audio: json['audio'] as String,
        nomor: json['nomor'] as String,
        rukuk: json['rukuk'] as String,
        keterangan: json['keterangan'] as String);
  }
}
