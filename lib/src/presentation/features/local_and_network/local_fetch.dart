import 'package:flutter/material.dart';
import 'package:session/src/data/remote/local_remote.dart';

import '../../../data/remote/network_remote.dart';
import 'pokemon_tile.dart';

class LocalStoreByHive extends StatefulWidget {
  final String title;
  const LocalStoreByHive({required this.title, super.key});

  @override
  State<LocalStoreByHive> createState() => _LocalStoreByHiveState();
}

class _LocalStoreByHiveState extends State<LocalStoreByHive> {
  late PokemonRemote remote;

  @override
  void initState() {
    remote = PokemonRemoteImpl();
    super.initState();
  }

  List sendData = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: remote.fetchListPokemon(),
        builder: ((context, snapshot) {
          final localData = snapshot.data ?? [];
          for (var data in localData) {
            sendData.add({"favorite": true, "data": data});
          }
          return SingleChildScrollView(
              child: Column(
            children: [
              for (final data in sendData)
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 400, maxHeight: 200),
                  child: Tile(
                    favorite: data["favorite"],
                    data: data["data"],
                  ),
                ),
            ],
          ));
        }));
  }
}
