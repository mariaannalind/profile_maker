import 'package:flutter/material.dart';
import 'package:profile_maker/shared/bottom_navigation.dart';


enum FavoriteFoods { pizza, steak, fries, risotto, burger }

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  FavoriteFoods? _favoriteFood = FavoriteFoods.pizza;

  returnOptions() {
    return <Widget>[
      ListTile(
        title: const Text('Pizza'),
        leading: Radio<FavoriteFoods>(
          value: FavoriteFoods.pizza,
          groupValue: _favoriteFood,
          onChanged: (FavoriteFoods? value) {
            setState(() {
              _favoriteFood = value;
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
              _favoriteFood = value;
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
              _favoriteFood = value;
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
              _favoriteFood = value;
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
              _favoriteFood = value;
            });
          },
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {

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
                      children: returnOptions()
                    )
                )
            ),

            ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Show Profile'))
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(selectedItem: 3),
    );
  }
}
