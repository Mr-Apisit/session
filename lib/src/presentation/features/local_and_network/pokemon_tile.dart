import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

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
            top: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PokemonDetails(details: widget.data);
                }));
              },
              child: ImageNetwork(
                  fitWeb: BoxFitWeb.contain,
                  image: widget.data.img ?? "",
                  height: 120,
                  width: 120,
                  onLoading: const CircularProgressIndicator(),
                  onError: const Icon(Icons.error)),
            )),
      ],
    );
  }
}
