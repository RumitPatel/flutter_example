import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/routes/api_call_using_http_library/model/cell_counting.dart';
import 'package:flutter_example/utilities/app_utils.dart';
import 'package:image_picker/image_picker.dart';

import '../api_call_using_http_library/http_api_utils.dart';
import '../api_call_using_http_library/ui/progress_part.dart';

class CellCount extends StatefulWidget {
  const CellCount({super.key});

  @override
  _CellCountState createState() => _CellCountState();
}

class _CellCountState extends State<CellCount> {
  Dio dio = Dio();

  bool _isLoading = false;
  String _errorMsg = '';

  XFile? _imageXFile;
  CellCounting? _cellCounting;
  bool gotResult = false;

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
    _updateLoadingStatus(true, '');
    try {
      final formData = FormData.fromMap({
        'name': 'rum_test',
        'image_file': await MultipartFile.fromFile(
          _imageXFile!.path,
          filename: _imageXFile!.path,
        ),
        /*'files': [
          await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
          await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
        ]*/
      });

      /*final formData = FormData.fromMap({
        'image_url':
            'https://demos.neuramonks.com/img/cell-counting-demo-imgs/BloodImage_00168.jpg'
      });*/

      final response = await dio.post(baseURLCellCounting, data: formData);
      CellCounting cellCounting = CellCounting.fromJson(response.data);
      printI(
          'API Response:\nRBC:${cellCounting.RBC},\nWBC:${cellCounting.WBC},\nPlatelets:${cellCounting.Platelets},\nimage_url:${cellCounting.image_url}');
      _updateLoadingStatus(false, '');

      setState(() {
        _imageXFile = null;
        gotResult = true;
        _cellCounting = cellCounting;
      });
    } catch (e) {
      printI('Error cell counting: $e');
      _updateLoadingStatus(false, 'Error cell counting: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cell Counting'),
      ),
      body: Center(
        child: _isLoading
            ? const ProgressPart()
            : _imageXFile != null
                ? _LocalImageSelectedPart(
                    imgFile: File(_imageXFile!.path),
                    mOnPressed: () {
                      _uploadImage();
                    })
                : gotResult
                    ? _ImageResultPart(
                        cellCounting: _cellCounting,
                        mOnPressed: () {},
                      )
                    : const Text('No image selected.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Future _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        printI('selected image:${pickedFile.path}');
        setState(() {
          _imageXFile = pickedFile;
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

  void _updateLoadingStatus(loadingStatus, errorMessage) {
    setState(() {
      _isLoading = loadingStatus;
      _errorMsg = errorMessage;
    });
  }
}

class _LocalImageSelectedPart extends StatelessWidget {
  const _LocalImageSelectedPart({
    required this.imgFile,
    required this.mOnPressed,
  });

  final File? imgFile;
  final VoidCallback? mOnPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.file(imgFile!),
        ElevatedButton(
          onPressed: mOnPressed,
          child: Text('Upload selected image.'),
        )
      ],
    );
  }
}

class _ImageResultPart extends StatelessWidget {
  const _ImageResultPart({
    required this.cellCounting,
    required this.mOnPressed,
  });

  final CellCounting? cellCounting;
  final VoidCallback? mOnPressed;

  @override
  Widget build(BuildContext context) {
    String imgUrl = cellCounting?.image_url ?? '';
    int? RBC = cellCounting?.RBC;
    int? WBC = cellCounting?.WBC;
    int? Platelets = cellCounting?.Platelets;

    return Column(
      children: [
        Image.network(imgUrl),
        Text('RBC: $RBC'),
        Text('WBC: $WBC'),
        Text('Platelets: $Platelets'),
      ],
    );
  }
}