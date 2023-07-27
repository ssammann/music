import 'package:flutter/material.dart';
import 'Albums.dart';
import 'Allsongs.dart';
import 'Artists.dart';
import 'Folders.dart';
import 'Genres.dart';

class SongsPage extends StatefulWidget {
  const SongsPage({super.key});

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);

    super.initState();
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
    print("changed");
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    18.0,
                  ),
                ),
                child: TabBar(
                  isScrollable: true,

                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      18.0,
                    ),
                    color: Colors.transparent,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.blueGrey,
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Tab(
                        text: 'Songs',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Tab(
                        text: 'Albums',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Tab(
                        text: 'Artists',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Tab(
                        text: 'Genres',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Tab(
                        text: 'Folders',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  AllSongs(),
                  Albums(),
                  Artists(),
                  Genres(),
                  Folders(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
