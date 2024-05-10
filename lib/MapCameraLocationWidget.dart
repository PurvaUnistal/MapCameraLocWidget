import 'package:map_camera_flutter/map_camera_flutter.dart';

class MapCameraLocWidget extends StatelessWidget {
  final CameraDescription? camera;
  final void Function(ImageAndLocationData)? onImageCaptured;
  const MapCameraLocWidget({super.key,
  this.camera,
  this.onImageCaptured});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapCameraLocation(
        camera: camera!,
        onImageCaptured: onImageCaptured,
      ),
    );
  }
}
