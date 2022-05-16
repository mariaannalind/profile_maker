import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:profile_maker/models/profile_model.dart';
import 'package:profile_maker/photo_page.dart';
import 'package:profile_maker/preferences_page.dart';
import 'package:profile_maker/profile_page.dart';
import 'package:profile_maker/shared/routes.dart';
import 'package:provider/provider.dart';
import 'details_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.last;

  runApp(ChangeNotifierProvider(create: (context) => ProfileModel(), child: ProfileMakerApp(availableCamera: firstCamera)));
}

class ProfileMakerApp extends StatelessWidget {
  const ProfileMakerApp({Key? key, required this.availableCamera}) : super(key: key);

  final CameraDescription availableCamera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Maker',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const ProfilePage(),
      onGenerateRoute: (settings) {
        if(settings.name == Routes.routeProfilePage) {
          return MaterialPageRoute(builder: (context) => const ProfilePage());
        } else if(settings.name == Routes.routePhotoPage){
          return MaterialPageRoute(builder: (context) => PhotoPage(camera: availableCamera));
        } else if(settings.name == Routes.routeDetailsPage) {
          return MaterialPageRoute(builder: (context) => const DetailsPage());
        } else if (settings.name == Routes.routePreferencesPage) {
          return MaterialPageRoute(builder: (context) => const PreferencesPage());
        } else {
          return MaterialPageRoute(builder: (context) => const ProfilePage());
        }
      },
    );
  }
}

