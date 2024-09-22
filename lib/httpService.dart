import 'dart:convert';
import 'package:http/http.dart';
import 'quranModel.dart';

class HttpService {
  Future<List<QuranModel>> getQuran() async {
    Response res =
        await get(Uri.parse('https://api.npoint.io/99c279bb173a6e28359c/data'));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<QuranModel> Qurans = body
          .map(
            (dynamic item) => QuranModel.fromJson(item),
          )
          .toList();
      return Qurans;
    } else {
      throw "Tidak dapat mengambil data qur'an";
    }
  }
}
