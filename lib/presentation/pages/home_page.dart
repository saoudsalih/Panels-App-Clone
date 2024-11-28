import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pannel_clone/presentation/widgets/item_tile.dart';

class HomePage extends StatefulWidget {
  final Function(bool) afterScrollCallback;
  const HomePage({super.key, required this.afterScrollCallback});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool isVisibleBottomBar = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisibleBottomBar) {
          isVisibleBottomBar = false;
          widget.afterScrollCallback(isVisibleBottomBar);
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isVisibleBottomBar) {
          isVisibleBottomBar = true;
          widget.afterScrollCallback(isVisibleBottomBar);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              title: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle)),
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Suggested"),
                  Tab(text: "Liked"),
                  Tab(text: "Library"),
                ],
                indicatorColor: Colors.red,
                indicatorWeight: 4,
              ),
            ),
          ];
        },
        body: TabBarView(children: [
          MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return ItemTile(
                index: index,
                extent: (index % 2) == 0 ? 300 : 150,
                sourceImage: 'https://picsum.photos/500/500?random=$index',
              );
            },
          ),
          SizedBox(),
          SizedBox()
        ]),
      ),
    );
    ;
  }
}
