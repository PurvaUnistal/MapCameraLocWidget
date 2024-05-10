import 'package:demo/MapCameraLocationWidget.dart';
import 'package:demo/Widgets/cameratest.dart';
import 'package:demo/Widgets/image_pop_widget.dart';
import 'package:demo/Widgets/image_widget.dart';
import 'package:map_camera_flutter/map_camera_flutter.dart';

class GalleryAccess extends StatefulWidget {
  const GalleryAccess({super.key, });

  @override
  State<GalleryAccess> createState() => _GalleryAccessState();
}

class _GalleryAccessState extends State<GalleryAccess> {



  File galleryFile = File("");

  imageGallery() async{
    var pic = await Testing.galleryCapture();
    if(pic != null){
     setState(() {
       galleryFile = pic;
     });
    }
  }
  imageCamera() async{
    var pic = await Testing.cameraCapture();
    if(pic != null){
      setState(() {
        galleryFile = pic;
      });
    }
  }
  imageTeCamera() async{
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MapCameraLocWidget(
          camera: firstCamera,
          onImageCaptured: (ImageAndLocationData data) {
            setState(() {
              galleryFile = File(data.imagePath!);
            });
            print('Captured image path: ${data.imagePath}');
            print('Latitude: ${data.latitude}');
            print('Longitude: ${data.longitude}');
            print('Location name: ${data.locationName}');
            print('Sublocation: ${data.subLocation}');
          },
        ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery and Camera Access'),
        backgroundColor: Colors.blue.shade900,
        actions: const [],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageWidget(
                  imgFile: galleryFile,
                  onPressed: (){
                    showModalBottomSheet(
                        enableDrag: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return ImagePopWidget(
                            onTapCamera: () async {
                              Navigator.of(context).pop();
                              imageTeCamera();
                              },

                            onTapGallery: () async {
                              Navigator.of(context).pop();
                              imageGallery();
                            },
                          );
                        });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}