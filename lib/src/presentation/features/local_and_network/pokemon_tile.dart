import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/network_model.dart';
import 'network_fetch.dart';

class Tile extends StatefulWidget {
  final bool favorite;
  final Pokemon data;
  const Tile({required this.favorite, required this.data, super.key});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  late bool addFavorite;
  
  @override
  void initState() {
    addFavorite = widget.favorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
            top: 90,
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                      top: 30,
                      child: Text(widget.data.name ?? "",
                          style: Theme.of(context).textTheme.titleLarge)),
                  Positioned(
                    top: 20,
                    right: 0,
                    child: IconButton(
                      icon: addFavorite
                          ? const Icon(Icons.star_rate, color: Colors.amber)
                          : const Icon(Icons.star_border),
                      onPressed: () {
                        setState(() {
                          addFavorite = !addFavorite;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
            top: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PokemonDetails(details: widget.data);
                }));
              },
              child: CachedNetworkImage(
                  imageUrl: widget.data.img ?? "",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error)),
            )),
      ],
    );
  }
}
