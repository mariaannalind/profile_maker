import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:profile_maker/shared/bottom_navigation.dart';
import 'package:provider/provider.dart';

import 'models/profile_model.dart';

// TODO move to one place accessible from different widgets
class PreferencesPage extends StatefulWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  FavoriteFoods _favoriteFood = FavoriteFoods.pizza;
  //TODO favorite food from profile

  returnOptions(FavoriteFoods profileFavoriteFood) {
    return <Widget>[
      const Text("Choose your favorite food", style: TextStyle(fontSize: 20)),
      ListTile(
        title: const Text('Pizza'),
        leading: Radio<FavoriteFoods>(
          value: FavoriteFoods.pizza,
          groupValue: _favoriteFood,
          onChanged: (FavoriteFoods? value) {
            setState(() {
              _favoriteFood = value ?? FavoriteFoods.pizza;
            });
          },
        ),
      ),
      ListTile(
        title: const Text('Steak'),
        leading: Radio<FavoriteFoods>(
          value: FavoriteFoods.steak,
          groupValue: _favoriteFood,
          onChanged: (FavoriteFoods? value) {
            setState(() {
              _favoriteFood = value ?? FavoriteFoods.pizza;
            });
          },
        ),
      ),
      ListTile(
        title: const Text('Fries'),
        leading: Radio<FavoriteFoods>(
          value: FavoriteFoods.fries,
          groupValue: _favoriteFood,
          onChanged: (FavoriteFoods? value) {
            setState(() {
              _favoriteFood = value ?? FavoriteFoods.pizza;
            });
          },
        ),
      ),
      ListTile(
        title: const Text('Risotto'),
        leading: Radio<FavoriteFoods>(
          value: FavoriteFoods.risotto,
          groupValue: _favoriteFood,
          onChanged: (FavoriteFoods? value) {
            setState(() {
              _favoriteFood = value ?? FavoriteFoods.pizza;
            });
          },
        ),
      ),
      ListTile(
        title: const Text('Burger'),
        leading: Radio<FavoriteFoods>(
          value: FavoriteFoods.burger,
          groupValue: _favoriteFood,
          onChanged: (FavoriteFoods? value) {
            setState(() {
              _favoriteFood = value ?? FavoriteFoods.pizza;
            });
          },
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileModel>(
        builder: (context, profile, child) {

          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile Maker: Preferences'),
            ),
            body: Center(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), child: (
                      Column(
                          children: returnOptions(profile.favoriteFood)
                      )
                  )
                  ),

                  ElevatedButton(
                      onPressed: () {
                        profile.savePreferences(_favoriteFood);
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: const Text('Show Profile'))
                ],
              ),
            ),
            bottomNavigationBar: const BottomNavigationBarWidget(selectedItem: 3),
          );
        } );

  }
}
