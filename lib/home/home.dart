import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/presenter/presenter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends DownloadState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: CircularProgressIndicator()),
            CupertinoButton(
              child: const Text('Baixar'),
              onPressed: download,
            ),
            if (tasksCount > 0)
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(index.toString()));
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
