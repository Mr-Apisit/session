import 'package:flutter/material.dart';

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
        IconButton(
          icon: const Icon(Icons.navigate_next),
          tooltip: 'Go to the next page',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Next page'),
                  ),
                  body: const Center(
                    child: Text(
                      'This is the next page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ));
          },
        ),
      ],
      // The elevation value of the app bar when scroll view has
      // scrolled underneath the app bar.
    );
  }
}
