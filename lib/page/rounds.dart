import 'dart:math';
import 'package:video_player/video_player.dart';
import 'package:f_on/component/layouts/default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class RoundsScreen extends StatefulWidget {
  @override
  _RoundsScreenState createState() => _RoundsScreenState();
}

const VIDEO_SOURCES = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"
];

class Video {
  final String filename;
  final String url;
  String thumnail;
  bool selected = false;
  Video({@required this.filename, @required this.url, this.thumnail});
}

class Pdf {
  final String filename;
  final String url;
  bool selected = false;
  Pdf({@required this.filename, @required this.url});
}

class Round {
  final String name;
  List<Pdf> pdfs = [];
  List<Video> videos = [];
  bool selected = false;
  Round({@required this.name, this.pdfs, this.videos});
}

class _RoundsScreenState extends State<RoundsScreen> {
  List<Round> rounds = [];
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void moch() {
    if (rounds.length == 0) {
      var random = new Random();
      // var max = random.nextInt(3);
      for (var i = 0; i < 10; i++) {
        List<Video> videos = [];
        var videoLen = random.nextInt(10);
        for (var j = 0; j < videoLen; j++) {
          var url = VIDEO_SOURCES[random.nextInt(VIDEO_SOURCES.length)];
          var arr = url.split('/');
          var filename = arr[arr.length - 1];
          videos.add(new Video(filename: filename, url: url));
        }

        List<Pdf> pdfs = [];
        var pdfLen = random.nextInt(10);
        for (var j = 0; j < pdfLen; j++) {
          pdfs.add(new Pdf(filename: "Pdf $j", url: "Pdf Url $j"));
        }
        var round = new Round(name: "Round $i", pdfs: pdfs, videos: videos);
        rounds.add(round);
      }
    }
  }

  Future<void> selectVideo(Video video) async {
    setState(() {
      var round =
          rounds.firstWhere((_round) => _round.selected, orElse: () => null);
      if (round != null) {
        round.videos.forEach((_video) {
          if (_video == video) {
            _video.selected = true;
          } else {
            _video.selected = false;
          }
        });
      }
    });

    final uint8list = await VideoThumbnail.thumbnailData(
      video:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      imageFormat: ImageFormat.JPEG,
      maxHeightOrWidth: 128,
      quality: 25,
    );
    print(uint8list);
    return uint8list;
  }

  void selectRound(Round round) {
    setState(() {
      rounds.forEach((_round) {
        _round.selected = false;
        _round.videos.forEach((v) {
          v.selected = false;
        });
        _round.pdfs.forEach((p) {
          p.selected = false;
        });
      });

      round.selected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    moch();

    var roundsWidget = Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ...rounds.map((round) {
            return Container(
                margin: EdgeInsets.all(5),
                child: RaisedButton(
                  color: round.selected ? Colors.blueAccent : Colors.white60,
                  child: Text(round.name),
                  onPressed: () {
                    selectRound(round);
                  },
                ));
          })
        ],
      ),
    );

    var children = <Widget>[roundsWidget];

    var round =
        rounds.firstWhere((_round) => _round.selected, orElse: () => null);
    if (round != null) {
      var videosWidget = Container(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ...round.videos.map((video) {
              return Container(
                  margin: EdgeInsets.all(5),
                  child: RaisedButton(
                    color: video.selected ? Colors.blueAccent : Colors.white60,
                    child: Text(video.filename),
                    onPressed: () {
                      selectVideo(video);
                    },
                  ));
            })
          ],
        ),
      );
      children.add(videosWidget);
    }
    if (_controller.value.initialized) {
      children.add(AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      ));
      children.add(RaisedButton(onPressed: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      }));
    }
    return DefaultLayout(child: ListView(children: children));
  }
}

// children: <Widget>[
//         ListView(
//       ],
