import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraExample extends StatefulWidget {
  @override
  _CameraExampleState createState() => _CameraExampleState();
}

class _CameraExampleState extends State<CameraExample> {
  late final CameraController _controller;
  late final List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();

    // 사용 가능한 모든 카메라를 가져옵니다.
    availableCameras().then((cameras) {
      setState(() {
        _cameras = cameras;
        _controller = CameraController(
          _cameras[0],
          ResolutionPreset.high,
        );
        _controller.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      body: CameraPreview(_controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.takePicture().then((image) {
            // 캡처한 이미지를 처리합니다.
          });
        },
        child: Icon(Icons.camera),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
