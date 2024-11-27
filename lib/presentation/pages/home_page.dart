import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pannel_clone/presentation/widgets/item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        return ItemTile(
          index: index,
          extent: (index % 2) == 0 ? 300 : 150, sourceImage: 'https://picsum.photos/500/500?random=$index',
        );
      },
    );
    ;
  }
}
