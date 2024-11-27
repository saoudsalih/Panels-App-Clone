
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String sourceImage;
  final int index;
  final double extent;
  const ItemTile(
      {super.key,
      required this.sourceImage,
      required this.index,
      required this.extent});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.antiAlias,
        height: extent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              sourceImage,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),color: Colors.black.withOpacity(.7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("PIC:$index",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                    const Icon(Icons.favorite,color: Colors.white,)
                  ],
                ),))
          ],
        ));
  }
}
