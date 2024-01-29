import 'package:flutter/material.dart';
import 'package:flutter_example/utilities/app_utils.dart';

import 'http_api_utils.dart';
import 'model/album_info.dart';

class ApiCallUsingHttp extends StatelessWidget {
  const ApiCallUsingHttp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Api call using http library')),
      body: const MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  const MyBody({
    super.key,
  });

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  late Future<AlbumInfo> _futureAlbum;

  @override
  void initState() {
    _callAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            _callAPI();
          },
          child: const Text('Call API!'),
        ),
        FutureBuilder<AlbumInfo>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              printI('snapshot.hasData');
              return Text(
                  'userId: ${snapshot.data!.userId}\nid: ${snapshot.data!.id}\ntitle: ${snapshot.data!.title}, ');
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )
      ],
    ));
  }

  void _callAPI() {
    _futureAlbum = fetchAlbum();
  }
}
