import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/utilities/app_utils.dart';
import 'package:image_picker/image_picker.dart';

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

  File? _image;

  @override
  void initState() {
    super.initState();
    setupInterceptors();
  }

  void setupInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        var fields = (options.data as FormData).fields;
        printI(
            'Sending request to: ${options.uri}\nfieldsCount:${fields.length}\nfields:${fields}\nextra:${options.extra}\nqueryParameters:${options.queryParameters}');
        handler.next(options);
      },
      onResponse: (response, handler) {
        printI(
            'Received response with status: ${response.statusCode}\ndata=${response.data}\nextra=${response.extra}');
        handler.next(response);
      },
      onError: (error, handler) {
        printI('Error occurred: $error');
        handler.next(error);
      },
    ));

/*    dio.interceptors.add(
      LogInterceptor(
        logPrint: (o) => debugPrint('$mTag ${o.toString()}'),
      ),
    );*/
  }

  void _uploadImage() async {
    printI('before API call: path:${_image!.path}, name:${'_image!.name'}');

    updateLoadingStatus(true, '');
    try {
      final formData = FormData.fromMap({
        'name': 'dio',
        'date': DateTime.now().toIso8601String(),
        'image_file': await MultipartFile.fromFile(
          _image!.path,
          filename: '_image!.name',
        ),
        /*'files': [
          await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
          await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
        ]*/
      });
      printI('formData before API call: ${formData.fields.toString()}');
      final response = await dio
          .post('https://demos.neuramonks.com:8000/blood_cell', data: formData);
      printI('Upload image API response: ${response.toString()}');
      updateLoadingStatus(false, '');
    } catch (e) {
      printI('Error cell counting: $e');
      updateLoadingStatus(false, 'Error cell counting: $e');
    }
  }

  Future<void> _uploadImage3(File? imageFile) async {
    try {
      final dio = Dio();
      final String uploadUrl = 'https://demos.neuramonks.com:8000/blood_cell';

      FormData formData = FormData.fromMap({
        'image_file': await MultipartFile.fromFile(
          imageFile!.path,
          filename: 'uploaded_image',
        ),
      });

      final response = await dio.post(uploadUrl, data: formData);

      if (response.statusCode == 200) {
        printI('Image uploaded successfully!');
      } else {
        printI('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (error) {
      printI('Error uploading image: $error');
    }
  }

/*  Future<String> uploadImage2(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image_file":
      await MultipartFile.fromFile(file.path, filename:fileName),
    });
    printI('formData before API call: ${formData.fields.toString()}');
    final response = await dio.post("https://demos.neuramonks.com:8000/blood_cell", data: formData);
    return response.data['id'];
  }*/

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
                          _uploadImage();
                          // uploadImage2(File(_image!.path));
                          // _uploadImage3(_image);
                        },
                        child: Text('Upload selected image.'),
                      ),
                    ],
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Future _getImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        printI('selected image:${pickedFile.path}');
        setState(() {
          _image = File(pickedFile.path);
          printI('selected image:${_image?.path}');
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
