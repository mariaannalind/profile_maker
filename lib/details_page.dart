import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:profile_maker/shared/bottom_navigation.dart';
import 'package:provider/provider.dart';

import 'models/profile_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _detailsFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileModel>(
        builder: (context, profile, child) {
          TextEditingController emailController = TextEditingController(text: profile.email != "" ? profile.email : "");
          TextEditingController nameController = TextEditingController(text: profile.name != "" ? profile.name : "");
          TextEditingController mobileController = TextEditingController(text: profile.mobile != 0 ? profile.mobile.toString() : "");

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
                                controller: nameController,
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
                                controller: emailController,
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
                                controller: mobileController,
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
                          profile.saveDetails(nameController.text, emailController.text, int.parse(mobileController.text));
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
        });
  }
}
