import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/utilities/app_utils.dart';
import 'package:image_picker/image_picker.dart';

import '../../utilities/constants.dart';
import '../api_call_using_http_library/ui/progress_part.dart';

class CellCount extends StatefulWidget {
  const CellCount({Key? key}) : super(key: key);

  @override
  _CellCountState createState() => _CellCountState();
}

class _CellCountState extends State<CellCount> {
  Dio dio = Dio();

  bool isLoading = false;
  String errorMsg = '';
  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  @override
  void initState() {
    super.initState();
    setupInterceptors();
  }

  void setupInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        printI('Sending request to: ${options.uri}');
        handler.next(options);
      },
      onResponse: (response, handler) {
        printI('Received response with status: ${response.statusCode}');
        handler.next(response);
      },
      onError: (error, handler) {
        printI('Error occurred: $error');
        handler.next(error);
      },
    ));
  }

  void uploadImage() async {
    updateLoadingStatus(true, '');
    try {
      final formData = FormData.fromMap({
        'name': 'dio',
        'date': DateTime.now().toIso8601String(),
        'file': await MultipartFile.fromFile(staticImgPath1,
            filename: 'upload1.txt'),
        /*'files': [
          await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
          await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
        ]*/
      });
      final response = await dio
          .post('https://demos.neuramonks.com:8000/blood_cell', data: formData);
      printI('Upload image API response: ${response.toString()}');
      updateLoadingStatus(false, '');
    } catch (e) {
      printI('Error adding user: $e');
      updateLoadingStatus(false, 'Error adding user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cell Counting'),
      ),
      body: Center(
        child: isLoading
            ? const ProgressPart()
            : _image == null
                ? const Text('No image selected.')
                : Column(
                    children: [
                      Image.file(File(_image!.path)),
                      ElevatedButton(
                        onPressed: () {
                          uploadImage();
                        },
                        child: Text('Upload selected image.'),
                      ),
                    ],
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Future getImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        printI('selected image:${image.path}');
        setState(() {
          _image = image;
        });
      } else {
        showSnackBottom('Image picker error!',
            'Some issue occurred while capturing the image.');
      }
    } catch (e) {
      showSnackBottom('Image picker error!',
          'Some issue occurred while capturing the image.$e');
    }
  }

  void updateLoadingStatus(loadingStatus, errorMessage) {
    setState(() {
      isLoading = loadingStatus;
      errorMsg = errorMessage;
    });
  }
}
