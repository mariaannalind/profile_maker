import 'dart:developer';

import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key, required this.selectedItem}) : super(key: key);

  final int selectedItem;

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
    @override
    Widget build(BuildContext context) {

      void _onTap(int index) {
        if(index == 0) {
          Navigator.popUntil(context, (route) => route.isFirst);
        }
        if(index == 1) {
          Navigator.pushNamed(context, '/step1');
        }

        if(index == 2) {
          Navigator.pushNamed(context, '/step2');
        }

        if(index == 3) {
          Navigator.pushNamed(context, '/step3');
        }
      }

    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.deepOrangeAccent,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: "Photo",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.speaker_notes),
          label: "Details"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: "Preferences"
        ),
      ],
      onTap: _onTap,
      currentIndex: widget.selectedItem,
      type: BottomNavigationBarType.fixed,
      );
    }
}



