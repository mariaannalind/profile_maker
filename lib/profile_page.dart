import 'dart:io';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:profile_maker/shared/bottom_navigation.dart';

import 'models/profile_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Maker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO make title text into a shared widget
            const ProfileContainer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                  context,
                  '/step1',
                  );
                },
                child: const Text('Create Profile'))
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(selectedItem: 0),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileModel>(
      builder: (context, profile, child) {
        return Column(
          children: [
            if(!profile.hasProfile)
            const Text("Your profile is empty", style: TextStyle(fontSize: 20)),
            if(profile.hasProfile)
              const Text("Your profile is not empty", style: TextStyle(fontSize: 20)),
            if(profile.hasProfile)
            Image.file(File(profile.profilePhotoPath))
          ],
        );
      }
    );
  }
}


