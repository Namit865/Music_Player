import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoModel {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  List<Map<String, dynamic>> list = [
    {
      'name': "Pretty Girl",
      'videopath': "asset/video/prettygirl.mp4",
      'imgpath': "asset/images/pretty1.jpg",
      'imgpath2': "asset/images/pretty2.jpeg",
    },
    {
      'name': "2002",
      'videopath': "asset/video/2002.mp4",
      'imgpath': "asset/images/annemarie1.jpg",
      'imgpath2': "asset/images/annemarie2.jpeg",
    },
    {
      'name': "Baby",
      'videopath': "asset/video/baby.mp4",
      'imgpath2': "asset/images/justin1.jpeg",
      'imgpath': "asset/images/ramtajogi2.jpeg",
    },
    {
      'name': "I'm the one",
      'videopath': "asset/video/imtheone.mp4",
      'imgpath': "asset/images/khaleed1.jpg",
      'imgpath2': "asset/images/khaleed2.jpeg",
    },
    {
      'name': "Honey I'm Good",
      'videopath': "asset/video/honey.mp4",
      'imgpath': "asset/images/honey1.jpg",
      'imgpath2': "asset/images/honey2.jpeg",
    },
    {
      'name': "Savage Love",
      'videopath': "asset/video/savagelove.mp4",
      'imgpath': "asset/images/savage1.jpeg",
      'imgpath2': "asset/images/honey2.jpg",
    },
    {
      'name': "Somebody To You",
      'videopath': "asset/video/somebody.mp4",
      'imgpath': "asset/images/savage1.jpeg",
      'imgpath2': "asset/images/honey2.jpg",
    },
  ];
}