import 'package:flutter/material.dart';
import 'quranModel.dart';
import 'httpService.dart';
import 'detailQuran.dart';

class QuranListPage extends StatefulWidget {
  @override
  _QuranListPageState createState() => _QuranListPageState();
}

class _QuranListPageState extends State<QuranListPage> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Surat"),
      ),
      body: FutureBuilder<List<QuranModel>>(
        future: httpService.getQuran(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<QuranModel> qurans = snapshot.data!;
            return ListView.builder(
              itemCount: qurans.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(qurans[index].nama),
                  subtitle: Text("Ayat: ${qurans[index].ayat}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuranDetailPage(
                          quranModel: qurans[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text("Tidak ada data."));
          }
        },
      ),
    );
  }
}
