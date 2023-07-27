import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Albums extends StatefulWidget {
  const Albums({super.key});

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  List<AlbumModel> audios = [];
  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<void> getSongs() async {
    audios = await _audioQuery.queryAlbums();
  }

  @override
  void initState() {
    getSongs();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //  getSongs();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
            child: Text('Total ${audios.length} songs found'),
          ),
        ),
        Expanded(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: audios.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.music_note),
                trailing: const Icon(Icons.play_arrow),
                title: Text(audios[index].album));
          },
        )),
      ],
    );
  }
}
