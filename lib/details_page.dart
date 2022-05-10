import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:profile_maker/shared/bottom_navigation.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _detailsFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Maker: Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), child: (
                Form(key: _detailsFormKey,
                    child: Column(
                      children: <Widget>[
                        const Text("Enter your profile details", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'What do people call you?',
                            labelText: 'Name *',
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'Enter your name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: 'How to contact you?',
                            labelText: 'Email *',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'Enter your email';
                            }
                            if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                              return 'This is not a valid email';
                            }
                            return null;
                          },

                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.phone_android),
                            hintText: 'How to contact you?',
                            labelText: 'Mobile *',
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return 'Enter your mobile';
                            }
                            return null;
                          },
                        ),
                      ],
                    )
                )
              )
            ),
            ElevatedButton(
                onPressed: () {
                  if(_detailsFormKey.currentState!.validate()){
                    Navigator.pushNamed(
                      context,
                      '/step3',
                    );
                  }

                },
                child: const Text('Preferences'))
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(selectedItem: 2),
    );
  }
}
