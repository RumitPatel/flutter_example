import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_example/routes/api_call_using_http_library/model/photo_info.dart';
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

Future<List<PhotoInfo>> fetchPhotos() async {
  final response = await http.Client()
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // Synchronously run parsePhotos in the main isolate.
  return compute(_parsePhotos, response.body);
  // return _parsePhotos(response.body);
}

List<PhotoInfo> _parsePhotos(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<PhotoInfo>((json) => PhotoInfo.fromJson(json)).toList();
}
