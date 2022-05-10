import 'package:flutter/material.dart';
import 'package:profile_maker/shared/bottom_navigation.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Maker: Details'),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/step3',
                  );
                },
                child: const Text('Preferences'))
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(selectedItem: 2),
    );
  }
}
