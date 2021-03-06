import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:profile_maker/models/profile_model.dart';
import 'package:profile_maker/shared/bottom_navigation.dart';
import 'package:profile_maker/shared/custom_profile_clipper.dart';
import 'package:profile_maker/shared/routes.dart';
import 'package:provider/provider.dart';


class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key, required this.camera}) : super(key: key);
  final CameraDescription camera;

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool hasPhoto = false;
  String imagePath = "";

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  void cleanState() {
    setState(() {
      hasPhoto = false;
    });
  }


  @override
  Widget build(BuildContext context) {
  // TODO refactor
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Maker: Photo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(!hasPhoto)
              const Text("Take your profile photo", style: TextStyle(fontSize: 20)),
            if(!hasPhoto)
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ClipOval(clipper: PreviewProfileClipper(), child: CameraPreview(_controller));
                } else {
                return const Center(child: CircularProgressIndicator());
                }
              }
            ),
            if(hasPhoto)
              const Text("Should we save this photo?", style: TextStyle(fontSize: 20)),
            if(hasPhoto)
              DisplayPictureScreen(imagePath: imagePath, onBackButtonPressed: cleanState),
            if(!hasPhoto)
            FloatingActionButton(
              onPressed: () async {
                try {
                  await _initializeControllerFuture;
                  final image = await _controller.takePicture();
                  setState(() {
                    hasPhoto = true;
                    imagePath = image.path;
                  });
                } catch (e) {
                  print(e);
                }
              },
              child: const Icon(Icons.camera_alt),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(selectedItem: 1),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final VoidCallback onBackButtonPressed;

  const DisplayPictureScreen({Key? key, required this.imagePath, required this.onBackButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileModel>(
      builder: (context, profile, child) {
        return
          Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () => onBackButtonPressed(),
                          child: const Text('<- Try again')
                      ),
                      ElevatedButton(
                          onPressed: () {
                            profile.savePhoto(imagePath);
                            Navigator.pushNamed(
                              context,
                                Routes.routeDetailsPage,
                            );
                          },
                          child: const Text('Next ->')
                      ),
                    ]),
                    ClipOval(clipper: PreviewProfileClipper(), child: Image.file(File(imagePath)))

              ]
          );
      }
    );
  }
}


