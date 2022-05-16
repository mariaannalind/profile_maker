import 'dart:developer';
import 'dart:io';

import 'package:profile_maker/shared/custom_button.dart';
import 'package:profile_maker/shared/custom_profile_clipper.dart';
import 'package:profile_maker/shared/routes.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(padding: const EdgeInsets.all(32.0), child: _buildProfileContainer(context)),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(selectedItem: 0),
    );
  }

  Widget _buildProfileContainer(BuildContext context) {
    return Consumer<ProfileModel>(
        builder: (context, profile, child) {
          return Column(
            children: [
              if(!profile.hasProfile)
                Column(
                    children: [
                      const Text("Your profile is empty!", style: TextStyle(fontSize: 20)),
                      CustomButton(onPressFunction: () {
                        Navigator.pushNamed(
                          context,
                          Routes.routePhotoPage,
                        );
                      }, buttonText: 'Create Profile')
                    ]
                ),
              if(profile.hasProfile)
                Column(
                    children: [
                      _buildProfileDetails(profile),
                      if(profile.profilePhotoPath != "")
                        _buildPhoto(profile.profilePhotoPath),
                      _buildFavoriteFood(profile.favoriteFood.name),
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
                                  Routes.routePhotoPage,
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

  Widget _buildProfileDetails(ProfileModel profile) {
    return (
        Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(profile.name, style: const TextStyle(fontSize: 32.0)),
                ],
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child:
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(profile.email),
                    if(profile.mobile != 0)
                      Text(profile.mobile.toString())
                  ]
              )
              )
            ]
        )
    );
  }

  Widget _buildPhoto(String photoPath) {
    return (
        ClipOval(clipper: ProfileClipper(), child: Image.file(File(photoPath), width: 400, height: 400))
    );
  }

  Widget _buildFavoriteFood(String favoriteFood) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Text('My favorite food is: $favoriteFood'));
  }
}






