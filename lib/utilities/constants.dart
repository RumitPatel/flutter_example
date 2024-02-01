import '../routes/api_call_using_http_library/model/photo_info.dart';

const String appName = "Rum Flutter Sample App";

const double textSizeNormal = 18;
const double inputRadios = 15;
const double inputContentPadding = 20;

const String loginFormTitle = "Login form";
const String lblEmailPlaceholder = "Enter your email address";
const String msgIncorrectEmailError = "Please enter valid email address";
const String lblPasswordPlaceholder = "Enter your password";
const String msgIncorrectPasswordError = "Please enter valid password";

const String lblSubmit = "Submit";
const String tempTextProcessingData = "Login success!";
const String loginTestTitle = "Login test page";
const String homeScreenTitle = "Home Screen";

const String staticSqureImageUrl =
    'https://dartpad-workshops-io2021.web.app/getting_started_with_slivers/assets/day_0.jpeg';

const String lorumIpsum1 =
    "Lake Oeschinen lies at the foot of the Blumisalp in the bernes Alps. Lake Oeschinen lies at the foot of the Blumisalp in the bernes Alps. Lake Oeschinen lies at the foot of the Blumisalp in the bernes Alps. Lake Oeschinen lies at the foot of the Blumisalp in the bernes Alps. Lake Oeschinen lies at the foot of the Blumisalp in the bernes Alps. Lake Oeschinen lies at the foot of the Blumisalp in the bernes Alps. Lake Oeschinen lies at the foot of the Blumisalp in the bernes Alps. Lake Oeschinen lies at the foot of the Blumisalp in the bernes Alps.";

enum PState {
  initial,
  progress,
  data,
  error,
  imageSelectionDone,
}

const String cellCounting = 'Cell Counting';
const String cellCountingData1 = 'Try it out - Cell Counting Demo!';
const String cellCountingData2 =
    'Upload an image for AI model analysis to quantity cell count., Switzerland';
const String cellCountingData3 = 'No image? one of these:';
const String cellCountingInfo1 =
    'Note: We have utilized publicly available data,\n so please be aware that results may vary accordingly';
const String tryAgain = 'Try Again.';
const String pickFromGallery = 'Pick Image From Gallery';
const String imagePickerError = 'Image picker error!';
const String errorWhileCapture =
    'Some issue occurred while capturing the image.';

List<PhotoInfo> staticPhotos() {
  return [
    PhotoInfo(
      albumId: 1,
      id: 1,
      title: 'title1',
      url:
          'https://demos.neuramonks.com/img/cell-counting-demo-imgs/BloodImage_00168.jpg',
      thumbnailUrl: '',
    ),
    PhotoInfo(
      albumId: 2,
      id: 2,
      title: 'title2',
      url:
          'https://demos.neuramonks.com/img/cell-counting-demo-imgs/BloodImage_00172.jpg',
      thumbnailUrl: '',
    ),
    PhotoInfo(
      albumId: 3,
      id: 3,
      title: 'title3',
      url:
          'https://demos.neuramonks.com/img/cell-counting-demo-imgs/BloodImage_00263.jpg',
      thumbnailUrl: '',
    ),
    PhotoInfo(
      albumId: 4,
      id: 4,
      title: 'title4',
      url:
          'https://demos.neuramonks.com/img/cell-counting-demo-imgs/BloodImage_00315.jpg',
      thumbnailUrl: '',
    ),
/*    PhotoInfo(
      albumId: 5,
      id: 5,
      title: 'title5',
      url:
          'https://demos.neuramonks.com/img/cell-counting-demo-imgs/BloodImage_00168.jpg',
      thumbnailUrl: '',
    ),
    PhotoInfo(
      albumId: 6,
      id: 6,
      title: 'title6',
      url:
          'https://demos.neuramonks.com/img/cell-counting-demo-imgs/BloodImage_00172.jpg',
      thumbnailUrl: '',
    ),
    PhotoInfo(
      albumId: 7,
      id: 7,
      title: 'title7',
      url:
          'https://demos.neuramonks.com/img/cell-counting-demo-imgs/BloodImage_00263.jpg',
      thumbnailUrl: '',
    ),
    PhotoInfo(
      albumId: 8,
      id: 8,
      title: 'title8',
      url:
          'https://demos.neuramonks.com/img/cell-counting-demo-imgs/BloodImage_00315.jpg',
      thumbnailUrl: '',
    ),*/
  ];
}
