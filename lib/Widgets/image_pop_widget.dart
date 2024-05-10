import 'package:flutter/material.dart';
import 'package:map_camera_flutter/map_camera_flutter.dart';

class ImagePopWidget extends StatelessWidget {
  final void Function()? onTapGallery, onTapCamera;
  const ImagePopWidget(
      {Key? key, required this.onTapGallery, required this.onTapCamera})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child:
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text('Choose One',textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue.shade900,fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.blue.shade900,),
                title: const Text('Photo Library',),
                onTap: onTapGallery,
              ),
              ListTile(
                leading: Icon(Icons.photo_camera, color: Colors.blue.shade900,),
                title: const Text('Camera'),
                onTap:onTapCamera,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
