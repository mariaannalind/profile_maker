import 'dart:developer';
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
            const Padding(padding: EdgeInsets.all(32.0), child: ProfileContainer()),
            // TODO make title text into a shared widget

          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(selectedItem: 0),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  _showProfileDetails(ProfileModel profile) {
    return (
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(profile.name),
          Text(profile.email),
          if(profile.mobile != 0)
            Text(profile.mobile.toString())
        ]
      )
    );
  }

  _showPhoto(String photoPath) {
    return Image.file(File(photoPath));
  }

  _showFavoriteFood(String favoriteFood) {
    return Text('My favorite food is: $favoriteFood');
  }

  const ProfileContainer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileModel>(
      builder: (context, profile, child) {
        return Column(
          children: [
            if(!profile.hasProfile)
              Column(
                children: [
                  const Text("Your profile is empty!", style: TextStyle(fontSize: 20)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/step1',
                        );
                      },
                      child: const Text('Create Profile')
                  ),
                ]
              ),
            if(profile.hasProfile)
              Column(
                children: [
                  _showProfileDetails(profile),
                  if(profile.profilePhotoPath != "")
                  _showPhoto(profile.profilePhotoPath),
                  _showFavoriteFood(profile.favoriteFood.name),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            profile.resetProfile();

                          },
                          child: const Text('Reset Profile')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/step1',
                            );
                          },
                          child: const Text('Edit Profile')),
                    ],
                  )
                ]
              ),


          ],
        );
      }
    );
  }
}


