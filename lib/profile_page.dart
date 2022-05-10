import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:profile_maker/shared/bottom_navigation.dart';

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
