import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String title;
  const ImageWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Container(
            height: size.height * .3,
            width: size.width * .5,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://media.istockphoto.com/id/1254721353/photo/desert-highway-death-valley.jpg?s=612x612&w=0&k=20&c=UxnlhBJpY-ekHGXSC4nGdpc6bN5DhGQeoIVNEl2nwoY="))),
          ),
        ));
  }
}
