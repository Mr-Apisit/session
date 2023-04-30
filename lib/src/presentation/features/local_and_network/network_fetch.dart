import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:session/src/data/models/local_model.dart';
import 'package:session/src/data/remote/local_remote.dart';
import 'package:session/src/data/remote/network_remote.dart';

import '../../../data/models/network_model.dart';

class NetworkByHttp extends StatefulWidget {
  final String title;
  const NetworkByHttp({required this.title, super.key});

  @override
  State<NetworkByHttp> createState() => _NetworkByHttpState();
}

class _NetworkByHttpState extends State<NetworkByHttp> {
  late PokemonRemote remote;
  late LocalRemote localRemote;
  late List<Pokemon> localData;
  @override
  void initState() {
    remote = PokemonRemoteImpl();
    localRemote = LocalRemoteImpl();
    localState();
    super.initState();
  }

  void localState() {
    localRemote.getLocalData().then((value) {
      setState(() {
        localData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: remote.fetchListPokemon(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Pokemon> snapData = snapshot.data!;
            List sendData = [];

            debugPrint("snap : ${snapData.length}");
            debugPrint("local : ${localData.length}");
            if (localData.isNotEmpty) {
              for (var item in snapData) {
                for (var i in localData) {
                  if (i.name == item.name) {
                    sendData.add({"isFav": true, "data": item});
                    snapData.remove(item);
                  }
                }
              }

              debugPrint(" after snap : ${snapData.length}");
              for (var data in snapData) {
                sendData.add({"isFav": false, "data": data});
              }
            } else {
              for (var data in snapData) {
                sendData.add({"isFav": false, "data": data});
              }
            }

            debugPrint("data send : ${sendData.length}");
            return ListView.builder(
                itemCount: sendData.length,
                itemBuilder: (context, index) {
                  return ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400, maxHeight: 200),
                    child: Tile(isFav: sendData[index]["isFav"], data: sendData[index]["data"]),
                  );
                });
          } else {
            return const CupertinoActivityIndicator();
          }
        }));
  }
}

class Tile extends StatefulWidget {
  final bool isFav;
  final Pokemon data;
  const Tile({required this.isFav, required this.data, super.key});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  late LocalRemote remote;
  late List<Pokemon> localData;
  late bool isFav;
  @override
  void initState() {
    isFav = widget.isFav;
    remote = LocalRemoteImpl();
    super.initState();
  }

  bool pressFav = true;

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
                  Positioned(top: 30, child: Text(widget.data.name ?? "", style: Theme.of(context).textTheme.titleLarge)),
                  Positioned(
                    top: 20,
                    right: 0,
                    child: IconButton(
                      onPressed: () async {
                        setState(() {
                          pressFav = !pressFav;
                          isFav = !isFav;
                        });

                        if (!pressFav) {
                          await remote.addLocalData(LocalModel(id: widget.data.id!, value: widget.data.toJson()));
                        } else {
                          await remote.deleteLocalData(widget.data.id!);
                        }
                        if (context.mounted) {
                          if (!pressFav) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(duration: const Duration(milliseconds: 800), content: Text("เพิ่ม ${widget.data.name} เข้ารายการโปรด")));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(duration: const Duration(milliseconds: 800), content: Text("ลบ ${widget.data.name} ออกจากการโปรด")));
                          }
                        }
                      },
                      icon: (!pressFav || isFav) ? const Icon(Icons.star_rate, color: Colors.amber) : const Icon(Icons.star_border),
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
            top: 10,
            child: CachedNetworkImage(
                imageUrl: widget.data.img ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error))),
      ],
    );
  }
}
