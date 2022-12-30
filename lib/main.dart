// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

////////////////////////////////////////////////////////////////
///Base on the video https://morioh.com/p/acd6b8170de8?f=5c224490c513a556c9042463
///https://firebase.google.com/docs/flutter/setup?platform=web
///for the FutureBuilder
///////////////////////////////////////////////////////////////////

import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

import 'src/app.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //final Future<void> loadedLibrary = await app.loadLibrary();
  /*final loadedLibrary = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(FriendlyEatsApp());
}

class MyApp extends StatelessWidget {
  final _fpApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Builder',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder(
          future: _fpApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong, please try again');
            } else if (snapshot.hasData) {
              return FriendlyEatsApp();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
