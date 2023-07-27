import 'package:flat_list/flat_list.dart';
import 'package:flutter/material.dart';
import 'package:music/pages/songsList/components/songsCard.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AllSongs extends StatefulWidget {
  const AllSongs({super.key});

  @override
  State<AllSongs> createState() => _AllSongsState();
}

class _AllSongsState extends State<AllSongs> {
  bool loading =true;
  List<SongModel> audios = [];
  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<void> getSongs() async {
    audios = await _audioQuery.querySongs();
    // setState(() {
      loading=false;
    // });
  }

  @override
  void initState() {
    getSongs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FlatList(
      listHeaderWidget: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
          child: Text('Total ${audios.length} songs found'),
        ),
      ),
      onRefresh: getSongs,
      listEmptyWidget: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: const Text('List is empty!'),
      ),
       loading: loading,
      data: audios,
      buildItem: (item, index) {
        return SongsCard(song: audios[index]);
      },
    ));
  }
}
