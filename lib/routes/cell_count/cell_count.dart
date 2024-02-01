import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/routes/api_call_using_http_library/model/cell_counting.dart';
import 'package:flutter_example/utilities/app_utils.dart';
import 'package:image_picker/image_picker.dart';

import '../../utilities/constants.dart';
import '../api_call_using_http_library/http_api_utils.dart';
import '../api_call_using_http_library/model/photo_info.dart';
import '../api_call_using_http_library/ui/progress_part.dart';

class CellCount extends StatefulWidget {
  const CellCount({super.key});

  @override
  _CellCountState createState() => _CellCountState();
}

class _CellCountState extends State<CellCount> {
  Dio dio = Dio();

  PState _pState = PState.initial;
  XFile? _imageXFile;
  CellCounting? _cellCounting;

  @override
  void initState() {
    super.initState();
    setupInterceptors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(cellCounting),
      ),
      body: _getWidget(_pState),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(cellCountingInfo1),
      ),
    );
  }

  Widget _getWidget(PState pState) {
    switch (pState) {
      case PState.initial:
        return ImageSelectionPart(
          onPickImagePressed: _pickImage,
          onListImageSelected: (String imgUrl) {
            _uploadImage(false, imgUrl);
          },
        );
      case PState.progress:
        return const ProgressPart();
      case PState.data:
        return _ImageResultPart(
          cellCounting: _cellCounting,
          onTryAgainPressed: () {
            _updatePState(PState.initial);
          },
        );
      case PState.error:
        return const Text('Some error occurred.');
      case PState.imageSelectionDone:
        return _LocalImageSelectedPart(
            imgFile: File(_imageXFile!.path),
            mOnPressed: () {
              _uploadImage(true, '');
            });
    }
  }

  void setupInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        var fields = (options.data as FormData).fields;
        printI(
            'Sending request to: ${options.uri}\nfieldsCount:${fields.length}\nfields:$fields\nextra:${options.extra}\nqueryParameters:${options.queryParameters}');
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

  void _uploadImage(bool isForImageFile, String? imgUrl) async {
    _updatePState(PState.progress);
    FormData formData = FormData();
    try {
      if (isForImageFile) {
        formData = FormData.fromMap({
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
      } else if (imgUrl!.isNotEmpty) {
        formData = FormData.fromMap({
          'image_url': imgUrl,
        });
      }

      /*final formData = FormData.fromMap({
        'image_url':
            'https://demos.neuramonks.com/img/cell-counting-demo-imgs/BloodImage_00168.jpg'
      });*/

      final response = await dio.post(baseURLCellCounting, data: formData);
      CellCounting cellCounting = CellCounting.fromJson(response.data);
      printI(
          'API Response:\nRBC:${cellCounting.RBC},\nWBC:${cellCounting.WBC},\nPlatelets:${cellCounting.Platelets},\nimage_url:${cellCounting.image_url}');
      _updatePState(PState.data);

      setState(() {
        _imageXFile = null;
        _cellCounting = cellCounting;
      });
    } catch (e) {
      printI('Error cell counting: $e');
      _updatePState(PState.error);
    }
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
          _updatePState(PState.imageSelectionDone);
        });
      } else {
        showSnackBottom(imagePickerError, errorWhileCapture);
      }
    } catch (e) {
      showSnackBottom(imagePickerError, '$errorWhileCapture $e');
    }
  }

  void _updatePState(PState mPState) {
    setState(() {
      _pState = mPState;
    });
  }
}

class ImageSelectionPart extends StatelessWidget {
  const ImageSelectionPart({
    super.key,
    required this.onPickImagePressed,
    required this.onListImageSelected,
  });

  final VoidCallback? onPickImagePressed;
  final Function(String imgUrl) onListImageSelected;

  @override
  Widget build(BuildContext context) {
    final List<PhotoInfo> photos = staticPhotos();

    return Column(
      children: [
        Text(
          cellCountingData1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          cellCountingData2,
          style: TextStyle(color: Colors.grey[500]),
        ),
        ElevatedButton(
          onPressed: onPickImagePressed,
          child: const Text(pickFromGallery),
        ),
        const Text(cellCountingData3),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              String? imgUrl = photos[index].url ?? '';
              return InkWell(
                onTap: () {
                  onListImageSelected(imgUrl);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Image.network(imgUrl ?? ''),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
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
          child: const Text('Upload selected image.'),
        )
      ],
    );
  }
}

class _ImageResultPart extends StatelessWidget {
  const _ImageResultPart({
    required this.cellCounting,
    required this.onTryAgainPressed,
  });

  final CellCounting? cellCounting;
  final VoidCallback? onTryAgainPressed;

  @override
  Widget build(BuildContext context) {
    String imgUrl = cellCounting?.image_url ?? '';
    int? rbc = cellCounting?.RBC;
    int? wbc = cellCounting?.WBC;
    int? platelets = cellCounting?.Platelets;

    return Column(
      children: [
        Image.network(imgUrl),
        Text('RBC: $rbc'),
        Text('WBC: $wbc'),
        Text('Platelets: $platelets'),
        ElevatedButton(
          onPressed: onTryAgainPressed,
          child: const Text(tryAgain),
        ),
      ],
    );
  }
}
