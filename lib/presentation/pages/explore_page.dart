import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/item_tile.dart';

const double kImageSliderHeight = 320;

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int selectedSlideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              flexibleSpace: Stack(
                children: [
                  PageView.builder(
                    itemCount: 5,
                    onPageChanged: (ind) {
                      setState(() {
                        selectedSlideIndex = ind;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                'https://picsum.photos/500/500?random=slide_$index',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.black, Colors.transparent],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    stops: [0.01, 1])),
                          )
                        ],
                      );
                    },
                  ),
                  Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(5, (index) {
                          return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedSlideIndex == index
                                      ? Colors.white
                                      : Colors.grey));
                        }),
                      )),
                ],
              ),
              expandedHeight: kImageSliderHeight,
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: SliverAppBar(
                floating: true,
                snap: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                ),
                title: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Search",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            )
          ];
        },
        body: Container(
          color: Colors.white,
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return ItemTile(
                index: index,
                extent: (index % 2) == 0 ? 300 : 150,
                sourceImage: 'https://picsum.photos/500/500?random=nature_$index',
              );
            },
          ),
        ),
      ),
    );
  }
}
