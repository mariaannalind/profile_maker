import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:profile_maker/models/profile_model.dart';
import 'package:profile_maker/photo_page.dart';
import 'package:profile_maker/preferences_page.dart';
import 'package:profile_maker/profile_page.dart';
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
      routes: {
        '/': (context) => const ProfilePage(),
        '/step1' : (context) => PhotoPage(camera: availableCamera),
        '/step2' : (context) => const DetailsPage(),
        '/step3' : (context) => const PreferencesPage(),
      }
    );
  }
}
