
// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';
import 'dart:io';
import 'dart:typed_data' show ByteData, Uint8List;

//import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class Preview extends StatefulWidget {
  String imgPath;

  Preview({this.imgPath});
  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Image.file(File(widget.imgPath),fit: BoxFit.cover,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.black,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.share,color: Colors.white,),
                    onPressed: () {
                      getBytes().then((bytes)
                      {
                       //Share.file('Share via', basename(widget.imgPath), bytes.buffer.asUint8List(), 'image/path');
                      });
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<ByteData> getBytes() async {
    Uint8List bytes = File(widget.imgPath).readAsBytesSync();
    return ByteData.view(bytes.buffer);
  }

  // ignore: missing_return
  String basename(String imgPath) {}



  // ignore: missing_return
  // Future<Type> readAsByteSync() async {
  //
  // }
}
