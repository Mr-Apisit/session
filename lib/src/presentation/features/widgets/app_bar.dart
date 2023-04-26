import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class AppbarWidget extends StatelessWidget {
  final String title;
  const AppbarWidget({required this.title, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
    );
  }

  Widget _body() {
    return const SingleChildScrollView(
      child: SizedBox(
          width: double.maxFinite,
          height: 1000,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Placeholder(),
          )),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(title),

      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 1;
      },
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hello SWC this is snackbar')));
          },
        ),
        PopupMenuButton<SampleItem>(
          // Callback that sets the selected popup menu item.

          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemOne,
              child: Text('Item 1'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemTwo,
              child: Text('Item 2'),
            ),
            const PopupMenuItem<SampleItem>(
              value: SampleItem.itemThree,
              child: Text('Item 3'),
            ),
          ],
        ),
      ],
      // The elevation value of the app bar when scroll view has
      // scrolled underneath the app bar.
    );
  }
}
