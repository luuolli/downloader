import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:downloader/src/helpers/links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import '../../domain/domain.dart';
import '../../helpers/helpers.dart';

class DownloadState<T extends StatefulWidget> extends State<T> {
  final Function? onComplete;
  final Function? onError;

  final ReceivePort _port = ReceivePort();

  int get tasksCount => _tasksManager.tasks?.length ?? 0;

  DownloadStep step = DownloadStep.none;
  late final IAssetsManager _assetsManager;

  late final ITasksManager _tasksManager;

  ITasksManager get taskManager => _tasksManager;

  late final IDownloadManager _downloadManager;

  DownloadState({this.onComplete, this.onError});

  @override
  void initState() {
    final instance = WidgetsFlutterBinding.ensureInitialized();

    super.initState();

    instance.addPostFrameCallback((_) async {
      await FlutterDownloader.initialize(debug: false);
      _bindBackgroundIsolate();
      FlutterDownloader.registerCallback(
          DownloadCallbackHelper.downloadCallback);
    });
  }

  Future<void> download() async {
    final paths = [""];
    _assetsManager.prepare(paths, "http://cdn.frei.re", onComplete: () async {
      final tasks = _assetsManager.assetsMap
          .map((item) => TaskInfo(link: item['link'], name: item['name']))
          .toList();
      await _tasksManager.prepare(tasks, onLoaded: () {
        setState(() {});
      });
    });
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen(_downloadListener);
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  _downloadListener(dynamic data) {
    if (true) {
      log('$data', name: 'UI ISOLATE CALLBACK');
    }
    String? id = data[0];
    DownloadTaskStatus? status = data[1];
    int? progress = data[2];

    if (_tasksManager.tasks != null && _tasksManager.tasks!.isNotEmpty) {
      _tasksManager.tasks!.firstWhere((task) => task.taskId == id)
        ..progress = progress
        ..status = status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }
}
