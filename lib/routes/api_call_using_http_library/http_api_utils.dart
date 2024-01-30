import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_example/routes/api_call_using_http_library/model/photo_info.dart';
import 'package:flutter_example/routes/api_call_using_http_library/model/user.dart';
import 'package:flutter_example/utilities/app_utils.dart';
import 'package:http/http.dart' as http;

import 'model/album_info.dart';

const String baseURLJPHolder = 'https://jsonplaceholder.typicode.com/';

Future<AlbumInfo> fetchAlbum() async {
  final response = await http.get(Uri.parse('${baseURLJPHolder}albums/1'));
  printI('response: ${response.body}.');
  if (response.statusCode == 200) {
    return AlbumInfo.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<PhotoInfo>> fetchPhotos() async {
  final response =
      await http.Client().get(Uri.parse('${baseURLJPHolder}photos'));

  // Synchronously run parsePhotos in the main isolate.
  return compute(_parsePhotos, response.body);
  // return _parsePhotos(response.body);
}

List<PhotoInfo> _parsePhotos(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<PhotoInfo>((json) => PhotoInfo.fromJson(json)).toList();
}

Future<List<User>> fetchUsers() async {
  final response =
      await http.Client().get(Uri.parse('${baseURLJPHolder}users'));

  // Synchronously run parsePhotos in the main isolate.
  return compute(_parseUsers, response.body);
  // return _parsePhotos(response.body);
}

List<User> _parseUsers(String responseBody) {
  final parsed =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}
