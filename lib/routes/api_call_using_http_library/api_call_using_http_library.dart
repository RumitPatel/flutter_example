import 'package:flutter/material.dart';
import 'package:flutter_example/routes/api_call_using_http_library/model/photo_info.dart';
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
              return Text(
                  'userId: ${snapshot.data!.userId}\nid: ${snapshot.data!.id}\ntitle: ${snapshot.data!.title}, ');
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
        FutureBuilder<List<PhotoInfo>>(
          future: fetchPhotos(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.hasData) {
              printI('snapshot.hasData${snapshot.data.toString()}');
              return Expanded(
                child: PhotosList(photos: snapshot.data!),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    ));
  }

  void _callAPI() {
    _futureAlbum = fetchAlbum();
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<PhotoInfo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}
