import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meme_stream/models/meme_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'memes_provider.g.dart';

class MemesApi {
  List<MemeModel> memes = [];
  static String? subreddit;
  Future<List<MemeModel>> getMemes({String? subreddit, int? count}) async {
    //https://meme-api.com/gimme
    String sub = subreddit ?? "";
    MemesApi.subreddit = sub;
    if (sub != "") {
      sub = "$sub/";
    }
    final response =
        await http.get(Uri.https('meme-api.com', '/gimme/$sub$count'));
    // print(response.body);
    final Map<String, dynamic> jsonResponse =
        jsonDecode(response.body) as Map<String, dynamic>;

    // print("--------------");
    // print(jsonResponse["memes"][0]);
    try {
      memes = [...jsonResponse["memes"].map((e) => MemeModel.fromMap(e))];
    } catch (e) {
      return Future.error("Subreddit does not contain images");
    }

    return memes;
  }
}

final memesApiProvider = Provider<MemesApi>((ref) => MemesApi());

@riverpod
Future<List<MemeModel>> getMemes(GetMemesRef ref,
    {String? subreddit, int? count}) {
  return ref
      .read(memesApiProvider)
      .getMemes(subreddit: subreddit, count: count);
}
