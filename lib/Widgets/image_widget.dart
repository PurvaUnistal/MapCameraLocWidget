import 'dart:io';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final File imgFile;
  final void Function() onPressed;
  const ImageWidget({super.key, required this.imgFile, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: MediaQuery.of(context).size.width *0.23,
        height:MediaQuery.of(context).size.height* 0.12,
        child: InkWell(
          onTap: onPressed,
          child: imgFile.path.isNotEmpty ? Card(
            child: Stack(
              children: <Widget>[
                Image.file(
                  imgFile,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width *0.23,
                  height:MediaQuery.of(context).size.height* 0.12,
                ),
                Container(
                    width: MediaQuery.of(context).size.width/3,
                    height:MediaQuery.of(context).size.width/3,
                  //  color : Colors.white.withOpacity(0.6),
                    child: Center(child: Icon(Icons.refresh, color: Colors.blue.shade900,))),
              ],

            ),
          )
              :Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.photo_camera_back_outlined, color: Colors.blue.shade900,size: 18,),
                Text("Photo"),
              ],
            ),
          ),
        )
    );
  }
}
