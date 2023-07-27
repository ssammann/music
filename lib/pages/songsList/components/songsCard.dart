import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongsCard extends StatefulWidget {
  SongModel? song;
  SongsCard({super.key, @required this.song});

  @override
  State<SongsCard> createState() => _SongsCardState();
}

class _SongsCardState extends State<SongsCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.music_note),
        trailing: const Icon(Icons.play_arrow),
        title: Text(widget.song!.title));
  }
}
