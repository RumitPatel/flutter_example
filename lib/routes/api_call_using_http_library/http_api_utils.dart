import 'dart:convert';

import 'package:flutter_example/utilities/app_utils.dart';
import 'package:http/http.dart' as http;

import 'model/album_info.dart';

Future<AlbumInfo> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  printI('response: ${response.body}.');
  if (response.statusCode == 200) {
    return AlbumInfo.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}
