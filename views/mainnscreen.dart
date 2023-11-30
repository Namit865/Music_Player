// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Provider/song_provider.dart';
import '../Provider/video_provider.dart';
import '../model/songmodel.dart';
import '../model/videomodel.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ListModel listModel = ListModel();
    VideoModel videoModel = VideoModel();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('issignin', false);
                Navigator.pushNamed(context, 'signin');
              },
              icon: const Icon(Icons.logout),
            ),
          ],
          title: const Text("RAINBOW"),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.music_note,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.music_video_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.black,
              child: ListView.builder(
                itemCount: listModel.list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'songdetails',
                          arguments: index);
                      Provider.of<SongProvider>(context, listen: false)
                          .startmusic(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: listModel.colorlist[index],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                  "${listModel.list[index]['imgpath']}"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              listModel.list[index]['name'],
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_right,
                            size: 50,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.black,
              child: ListView.builder(
                itemCount: videoModel.list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'videodetails',
                          arguments: index);
                      Provider.of<VideoProvider>(context, listen: false)
                          .startvideo(index);
                      Provider.of<VideoProvider>(context, listen: false)
                          .chewiecontroller();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Center(
                              child: Image.asset(
                                videoModel.list[index]['imgpath'],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.play_arrow,
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}