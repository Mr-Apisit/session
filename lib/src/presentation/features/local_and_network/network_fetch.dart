import 'package:flutter/material.dart';

import 'package:session/src/data/remote/local_remote.dart';
import 'package:session/src/data/remote/network_remote.dart';

import '../../../data/models/network_model.dart';
import 'pokemon_tile.dart';

class NetworkByHttp extends StatefulWidget {
  final String title;
  const NetworkByHttp({required this.title, super.key});

  @override
  State<NetworkByHttp> createState() => _NetworkByHttpState();
}

class _NetworkByHttpState extends State<NetworkByHttp> {
  late PokemonRemote remote;
  late LocalRemote localRemote;

  @override
  void initState() {
    remote = PokemonRemoteImpl();
    localRemote = LocalRemoteImpl();

    super.initState();
  }

  List sendData = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: localRemote.getLocalData(),
        builder: (context, snapshot) {
          final localData = snapshot.data ?? [];
          debugPrint("Pokemon on local had length : ${localData.length}");
          return FutureBuilder(
              future: remote.fetchListPokemon(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  final snapData = snapshot.data ?? [];
                  debugPrint(
                      "Pokemon on network had length : ${snapData.length}");

                  for (var net in snapData) {
                    sendData.add({"favorite": false, "data": net});
                  }

                  debugPrint("UI got data length : ${sendData.length}");
                  return ListView.builder(
                      itemCount: sendData.length,
                      itemBuilder: (context, index) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxWidth: 400, maxHeight: 200),
                          child: Tile(
                              favorite: sendData[index]["favorite"],
                              data: sendData[index]["data"]),
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }));
        });
  }
}

class PokemonDetails extends StatelessWidget {
  final Pokemon details;
  const PokemonDetails({required this.details, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(details.weaknesses.toString()),
        ),
      ),
    );
  }
}
