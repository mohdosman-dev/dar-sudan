import 'package:dar_sudan/resources/base_api.dart';

class BaseRepository {
  /// TODO: API end points start from here
  static Future fetchSongList(String input, int page) async {
    var response = await http.post('/', data: {
      'input': input,
      'type': 'netease',
      'page': page,
      'filter': 'name',
    });
  }
}
