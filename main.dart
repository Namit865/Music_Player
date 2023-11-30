import 'package:flutter/material.dart';
import 'package:music_player/views/mainnscreen.dart';
import 'package:music_player/views/signupScreen/login2.dart';
import 'package:music_player/views/signupScreen/login1.dart';
import 'package:music_player/views/songs.dart';
import 'package:music_player/views/videos.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider/song_provider.dart';
import 'Provider/video_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SongProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoProvider(),
        )
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: (prefs.getBool('issignin') == true) ? '/' : 'signin',
        routes: {
          '/': (context) => const MyApp(),
          'songdetails': (context) => const SongDetails(),
          'videodetails': (context) => const VideoDetails(),
          'Signin': (context) => const SignIn(),
          'SignUp': (context) => const SignUp(),
        },
      ),
    ),
  );
}