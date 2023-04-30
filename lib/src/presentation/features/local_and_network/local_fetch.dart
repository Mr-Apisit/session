import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:session/src/data/remote/local_remote.dart';

import '../../../data/models/network_model.dart';

class LocalStoreByHive extends StatefulWidget {
  final String title;
  const LocalStoreByHive({required this.title, super.key});

  @override
  State<LocalStoreByHive> createState() => _LocalStoreByHiveState();
}

class _LocalStoreByHiveState extends State<LocalStoreByHive> {
  late LocalRemote remote;

  @override
  void initState() {
    remote = LocalRemoteImpl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: remote.getLocalData(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400, maxHeight: 200),
                    child: Tile(data: snapshot.data![index]),
                  );
                });
          } else {
            return const CupertinoActivityIndicator();
          }
        }));
  }
}

class Tile extends StatelessWidget {
  final Pokemon data;
  const Tile({required this.data, super.key});

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
                  Positioned(top: 30, child: Text(data.name ?? "", style: Theme.of(context).textTheme.titleLarge)),
                  const Positioned(
                    top: 20,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.star_rate, color: Colors.amber),
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
            top: 10,
            child: CachedNetworkImage(
                imageUrl: data.img ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error))),
      ],
    );
  }
}
