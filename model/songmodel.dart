import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class ListModel {
  bool issecure = true;
  bool ison = false;
  bool isvolume = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  List<Map<String, dynamic>> list = [
    {
      'name': "Pretty Girl",
      'songpath': "asset/music/Pretty.mp3",
      'imgpath': "asset/images/pretty1.jpg",
      'imgpath2': "asset/images/pretty2.jpeg",
    },
    {
      'name': "2002",
      'songpath': "asset/music/2002.mp3",
      'imgpath': "asset/images/annemarie1.jpg",
      'imgpath2': "asset/images/annemarie2.jpeg",
    },
    {
      'name': "Baby",
      'songpath': "asset/music/baby.mp3",
      'imgpath1': "asset/images/justin1.jpeg",
      'imgpath2': "asset/images/justin2.jpeg",
    },
    {
      'name': "I'm the one",
      'songpath': "asset/music/imtheone.mp3",
      'imgpath': "asset/images/khaleed1.jpg",
      'imgpath2': "asset/images/khaleed2.jpeg",
    },
    {
      'name': "Savage Love",
      'songpath': "asset/music/savagelove.mp3",
      'imgpath': "asset/images/savage1.jpeg",
      'imgpath2': "asset/images/savage2.jpg",
    },
    {
      'name': "Honey I'm Good",
      'songpath': "asset/music/honey.mp3",
      'imgpath': "asset/images/honey1.jpg",
      'imgpath2': "asset/images/honey2.jpg",
    },
  ];

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  List<Color> colorlist = [
    Colors.lightGreenAccent,
    Colors.blueAccent,
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.cyanAccent,
    Colors.purple,
    Colors.pink
  ];
}