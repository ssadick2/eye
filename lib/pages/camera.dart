// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:path_provider/path_provider.dart';
//
// List<CameraDescription> cameras;
//
// class Cameras extends StatefulWidget {
//   @override
//   CameraState createState() => CameraState();
// }
//
// class CameraState extends State<Cameras> {
//   List<CameraDescription> cameras;
//   CameraController controller;
//   bool isReady = false;
//   bool showCamera = true;
//   String imagePath;
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController abvController = TextEditingController();
//
//   get scaffoldKey => null;
//
//   get onTakePictureButtonPressed => null;
//
//   @override
//   void initState() {
//     super.initState();
//     setupCameras();
//   }
//
//   Future<void> setupCameras() async {
//     try {
//       cameras = await availableCameras();
//       controller = new CameraController(cameras[0], ResolutionPreset.medium);
//       await controller.initialize();
//     } on CameraException catch (_) {
//       setState(() {
//         isReady = false;
//       });
//     }
//     setState(() {
//       isReady = true;
//     });
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: scaffoldKey,
//         body: Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: <Widget>[
//                   Center(
//                     child: showCamera
//                         ? Container(
//                       height: 290,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 5),
//                         child: Center(child: cameraPreviewWidget()),
//                       ),
//                     )
//                         : Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           imagePreviewWidget(),
//                           editCaptureControlRowWidget(),
//                         ]),
//                   ),
//                   showCamera ? captureControlRowWidget() : Container(),
//                   cameraOptionsWidget(),
//                   //beerInfoInputsWidget()
//                 ],
//               ),
//             )));
//   }
//
//   // Widget build(BuildContext context) {
//   //   if (!isReady && !controller.value.isInitialized) {
//   //     return Container();
//   //   }
//   //   return AspectRatio(
//   //       aspectRatio: controller.value.aspectRatio,
//   //       child: CameraPreview(controller));
//   // }
//
//   Widget cameraPreviewWidget() {
//     if (!isReady || !controller.value.isInitialized) {
//       return Container();
//     }
//     return AspectRatio(
//         aspectRatio: controller.value.aspectRatio,
//         child: CameraPreview(controller));
//   }
//
//   Widget imagePreviewWidget() {
//     return Container(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: Align(
//             alignment: Alignment.topCenter,
//             child: imagePath == null
//                 ? null
//                 : SizedBox(
//               child: Image.file(File(imagePath)),
//               height: 290.0,
//             ),
//           ),
//         ));
//   }
//
//
//   Widget captureControlRowWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.camera_alt),
//           color: Colors.blue,
//           onPressed: controller != null && controller.value.isInitialized
//               ? onTakePictureButtonPressed
//               : null,
//         ),
//       ],
//     );
//   }
//
//   // editCaptureControlRowWidget() {}
//   // void onTakePictureButtonPressed() {
//   //   takePicture().then((String filePath) {
//   //     if (mounted) {
//   //       setState(() {
//   //         showCamera = false;
//   //         imagePath = filePath;
//   //       });
//   //     }
//   //   });
//   // }
//   Future<String> takePicture() async {
//     if (!controller.value.isInitialized) {
//       return null;
//     }
//     final Directory extDir = await getApplicationDocumentsDirectory();
//     final String dirPath = '${extDir.path}/Pictures/flutter_test';
//     await Directory(dirPath).create(recursive: true);
//     final String filePath = '$dirPath/${timestamp()}.jpg';
//
//     if (controller.value.isTakingPicture) {
//       return null;
//     }
//
//     try {
//       await controller.takePicture(filePath);
//     } on CameraException {
//       return null;
//     }
//     return filePath;
//   }
//
//   Widget editCaptureControlRowWidget() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 5),
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: IconButton(
//           icon: const Icon(Icons.camera_alt),
//           color: Colors.blue,
//           onPressed: () => setState(() {
//             showCamera = true;
//           }),
//         ),
//       ),
//     );
//   }
//
//   Widget cameraOptionsWidget() {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           showCamera ? cameraTogglesRowWidget() : Container(),
//         ],
//       ),
//     );
//   }
//
//   Widget cameraTogglesRowWidget() {
//     final List<Widget> toggles = <Widget>[];
//
//     if (cameras != null) {
//       if (cameras.isEmpty) {
//         return const Text('No camera found');
//       } else {
//         for (CameraDescription cameraDescription in cameras) {
//           toggles.add(
//             SizedBox(
//               width: 90.0,
//               child: RadioListTile<CameraDescription>(
//                 title: Icon(getCameraLensIcon(cameraDescription.lensDirection)),
//                 groupValue: controller?.description,
//                 value: cameraDescription,
//                 onChanged: controller != null ? onNewCameraSelected : null,
//               ),
//             ),
//           );
//         }
//       }
//     }
//
//     return Row(children: toggles);
//   }
//
//   void onNewCameraSelected(CameraDescription cameraDescription) async {
//     if (controller != null) {
//       await controller.dispose();
//     }
//     controller = CameraController(cameraDescription, ResolutionPreset.high);
//
//     controller.addListener(() {
//       if (mounted) setState(() {});
//       if (controller.value.hasError) {
//         showInSnackBar('Camera error ${controller.value.errorDescription}');
//       }
//     });
//
//     try {
//       await controller.initialize();
//     } on CameraException catch (e) {
//       showInSnackBar('Camera error $e');
//     }
//
//     if (mounted) {
//       setState(() {});
//     }
//   }
//   Widget beerInfoInputsWidget() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 3, bottom: 4.0),
//           child: TextField(
//               controller: nameController,
//               onChanged: (v) => nameController.text = v,
//               decoration: InputDecoration(
//                 labelText: 'Name the beer',
//               )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 3, bottom: 4.0),
//           child: TextField(
//               controller: countryController,
//               onChanged: (v) => countryController.text = v,
//               decoration: InputDecoration(
//                 labelText: "Country name",
//               )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 3),
//           child: TextField(
//               controller: abvController,
//               onChanged: (v) => abvController.text = v,
//               decoration: InputDecoration(
//                 labelText: 'ABV',
//               )),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Builder(
//             builder: (context) {
//               return RaisedButton(
//                 onPressed: () => {},
//                 color: Colors.lightBlue,
//                 child: Text('Add beer'),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   void showInSnackBar(String s) {}
//
//   // ignore: missing_return
//   IconData getCameraLensIcon(CameraLensDirection lensDirection) {}
//
//   timestamp() {}
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Cameras extends StatefulWidget {
  @override
  _CamerasState createState() => _CamerasState();
}

class _CamerasState extends State<Cameras> {
  File imageFile; // holding the image instance


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void openImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150,
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  'Pick an image',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  child: Text(
                    'Use Camera',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    getImage(context, ImageSource.camera);
                  },
                ),
                FlatButton(
                  child: Text(
                    'Use Gallery',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    getImage(context, ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  void getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(
      source: source,
      maxWidth: 400,
    ).then((File image) {

      setState(() {
        imageFile = image;
      });
      Navigator.pop(context);
      uploadImage(imageFile);
    });
  }

  uploadImage(File image, {String imagePath}) async {

    // image ==> the image picked from the camera
    // So write logic to upload the image to a server for prediction
    // cheers

  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: 20,
      ),
      OutlineButton(
        borderSide: BorderSide(color: Colors.lightBlue),
        onPressed: () {
          openImagePicker(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.camera_alt),
            SizedBox(
              width: 5.0,
            ),
            Text('Upload an image')
          ],
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      imageFile == null
          ? Text('Please choose an image')
          : Image.file(
        imageFile,
        fit: BoxFit.cover,
        height: 300.0,
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
      ),

    ]);
  }
}
